@isTest
private class XmlUtilTest {
	
	static testMethod void testExtractXmlTagText(){
    	HttpResponse response = new HttpResponse();
    	response.setBody('<CD> ' + '<TITLE>Empire Burlesque</TITLE> ' + '<ARTIST>Bob Dylan</ARTIST> ' + '<COUNTRY>USA</COUNTRY> ' + 
    					'<COMPANY>Columbia</COMPANY> ' + '<PRICE>10.90</PRICE> ' + '<YEAR>1985</YEAR> '+ '<COUNTRY>GERMANY</COUNTRY> '+ '</CD> ');
    	
    	System.assertEquals('USA', XmlUtil.extractXmlTagText(response, 'COUNTRY'));
    	System.assertEquals(null, XmlUtil.extractXmlTagText(response, 'COUN'));
    	// test for blank tag name
    	System.assertEquals(null, XmlUtil.extractXmlTagText(response, ''));
    	// test for null response
    	response = null;
    	System.assertEquals(null, XmlUtil.extractXmlTagText(response, 'COUNTRY'));
    	// test for null body
    	response = new HttpResponse();
    	
    	System.assertEquals(null, XmlUtil.extractXmlTagText(response, 'COUNTRY'));
    	
    	// verify the new line in response
    	response.setBody('<CD> ' + '<TITLE>Empire Burlesque</TITLE> ' + '<ARTIST>Bob Dylan</ARTIST> ' + '<COUNTRY>USA\nUK</COUNTRY> ' + 
    					'<COMPANY>Columbia</COMPANY> ' + '<PRICE>10.90</PRICE> ' + '<YEAR>1985</YEAR> '+ '<COUNTRY>GERMANY</COUNTRY> '+ '</CD> ');
    	System.assertEquals('USA\nUK', XmlUtil.extractXmlTagText(response, 'COUNTRY'));
    }
    
    static testMethod void testExtractListOfTagText_OneError(){
    	Httpresponse response = new Httpresponse();
    	String body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
						'<errorResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
						    '<transactionId>82821592641044699</transactionId>'+
						    '<errors>'+
						        '<error>Error of [may not be null] on [annualCreditCardSalesVolume]</error>'+
						    '</errors>'+
						'</errorResponse>';
		response.setBody(body);
		List<String> expectedList = new List<String>();
		expectedList.add('Error of [may not be null] on [annualCreditCardSalesVolume]');
		System.assertEquals(expectedList, XmlUtil.extractListOfTagText(response, 'errors', 'error'));
    }
    
	static testMethod void testExtractListOfTagText_MultipleErrorResponses(){	
		Httpresponse response = new Httpresponse();
		String body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
						'<errorResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
						    '<transactionId>82821592641044699</transactionId>'+
						    '<errors>'+
						        '<error>Error of [may not be null] on [annualCreditCardSalesVolume]</error>'+
						        '<error>Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress2]</error>' +
						    '</errors>'+
						'</errorResponse>';
		response.setBody(body);
		List<String> expectedList = new List<String>();
		expectedList.add('Error of [may not be null] on [annualCreditCardSalesVolume]');
		expectedList.add('Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress2]');
		System.assertEquals(expectedList, XmlUtil.extractListOfTagText(response, 'errors', 'error'));
	}
	
	static testMethod void extractListOfTagTextWithNoChildTagsReturnsEmptyList(){
		Httpresponse response = new Httpresponse();		
		List<String> expectedList = new List<String>();
		String body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
						'<errorResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
						    '<transactionId>82821592641044699</transactionId>'+
						    '<errors>'+
						    '</errors>'+
						'</errorResponse>';
		response.setBody(body);
		System.assertEquals(expectedList, XmlUtil.extractListOfTagText(response, 'errors', 'error'));
    }
    
	static testMethod void extractListOfTagTextWithInvalidParentTagReturnsEmptyList(){
		Httpresponse response = new Httpresponse();		
		List<String> expectedList = new List<String>();
		String body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
						'<errorResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
						    '<transactionId>82821592641044699</transactionId>'+
						    '<errors>'+
						        '<error>Error of [may not be null] on [annualCreditCardSalesVolume]</error>'+
						        '<error>Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress2]</error>' +
						    '</errors>'+
						'</errorResponse>';
		response.setBody(body);				
		System.assertEquals(expectedList, XmlUtil.extractListOfTagText(response, 'nothing', 'error'));
    }
    
	static testMethod void extractListOfTagTextWithInvalidChildTagReturnsEmptyList(){
		Httpresponse response = new Httpresponse();		
		//empty lists returned
		List<String> expectedList = new List<String>();
		String body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
						'<errorResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
						    '<transactionId>82821592641044699</transactionId>'+
						    '<errors>'+
						        '<error>Error of [may not be null] on [annualCreditCardSalesVolume]</error>'+
						        '<error>Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress2]</error>' +
						    '</errors>'+
						'</errorResponse>';
		response.setBody(body);				
		System.assertEquals(expectedList, XmlUtil.extractListOfTagText(response, 'errors', 'nothing'));
		
    }
    
    
    
    //test for attribute value
    static testMethod void testExtractAttributeValue(){
    	HttpResponse response = new HttpResponse();
    	response.setBody('<CD> ' + '<TITLE author="test">Empire Burlesque</TITLE> ' + '<ARTIST author="donotpickme">Bob Dylan</ARTIST> ' + '<COUNTRY>USA</COUNTRY> ' + 
    					'<COMPANY>Columbia</COMPANY> ' + '<PRICE>10.90</PRICE> ' + '<YEAR>1985</YEAR> ' + '<TITLE author="new author">Empire Burlesque</TITLE>'+'</CD> ');
		System.assertEquals('test', XmlUtil.extractAttributeValue(response, 'TITLE', 'author'));
		System.assertEquals(null, XmlUtil.extractAttributeValue(response, 'TITLE', 'book'));
		System.assertEquals(null, XmlUtil.extractAttributeValue(response, 'TITLE', 'ARTIST'));
		System.assertEquals(null, XmlUtil.extractAttributeValue(response, 'TITLE', 'AUTHOR'));
		System.assertEquals(null, XmlUtil.extractAttributeValue(null, 'TITLE', 'AUTHOR'));
		System.assertEquals(null, XmlUtil.extractAttributeValue(response, 'TITLE', ''));
		System.assertEquals(null, XmlUtil.extractAttributeValue(response, '', null));
		System.assertEquals(null, XmlUtil.extractAttributeValue(null, null, null));
		System.assertEquals(null, XmlUtil.extractAttributeValue(response, null, 'author'));
    }
    
    static testMethod void extractTagValueWithParentTag(){
    	HttpResponse response = new HttpResponse();
    	String body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
						'<errorResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
						    '<transactionId>82821592641044699</transactionId>'+
						    '<errors>'+
						        '<error>Error of [may not be null] on [annualCreditCardSalesVolume]</error>'+
						        '<error>Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress2]</error>' +
						        '<transactionId>123456</transactionId>'+
						    '</errors>'+
						'</errorResponse>';
		response.setBody(body);
    	System.assertEquals('123456', XmlUtil.extractTagValueWithParentTag(response, 'errors', 'transactionId'));
    	System.assertEquals('82821592641044699', XmlUtil.extractTagValueWithParentTag(response, 'errorResponse', 'transactionId'));
    	System.assertEquals(null, XmlUtil.extractTagValueWithParentTag(response, 'errors', 'transact'));
    	System.assertEquals(null, XmlUtil.extractTagValueWithParentTag(response, 'transact', 'transactionId'));
    	System.assertEquals(null, XmlUtil.extractTagValueWithParentTag(response, 'errors', null));
    	System.assertEquals(null, XmlUtil.extractTagValueWithParentTag(response, null, 'error'));
    	System.assertEquals(null, XmlUtil.extractTagValueWithParentTag(null, 'errors', 'transactionId'));
    	
    }
    
    static testMethod void elementExists(){
    	HttpResponse response = new HttpResponse();
    	String body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
						'<errorResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
						    '<transactionId>82821592641044699</transactionId>'+
						    '<errors>'+
						        '<error>Error of [may not be null] on [annualCreditCardSalesVolume]</error>'+
						        '<error>Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress2]</error>' +
						        '<transactionId>123456</transactionId>'+
						    '</errors>'+
						'</errorResponse>';
		response.setBody(body);
		System.assert(XmlUtil.elementExists(response, 'errors'));
		System.assert(!XmlUtil.elementExists(response, 'transact'));
		System.assert(!XmlUtil.elementExists(response, null));
		System.assert(!XmlUtil.elementExists(null, 'errors'));
    }
    
    
}