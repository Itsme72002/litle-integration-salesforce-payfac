/*
Copyright (c) 2013 Litle & Co.
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/
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
    
    static testMethod void getXmlReaderTillNode(){
    	String xml = '<Articles><books title="First Book"><book>1</book></books><books title="Second Book"><book>2</book></books>'+
    					'<Magazines title="First Magazine"><Magazine>10</Magazine></Magazines></Articles>';
    	//Get the reader till first book
    	System.assertEquals(Xmltag.START_ELEMENT, XmlUtil.getXmlReaderTillNode(xml, 'books').getEventType());
    	System.assertEquals('books', XmlUtil.getXmlReaderTillNode(xml, 'books').getLocalName());
    	System.assertEquals('First Book', XmlUtil.getXmlReaderTillNode(xml, 'books').getAttributeValue(null, 'title'));
    	
    	//Get reader till magazine
    	System.assertEquals(Xmltag.START_ELEMENT, XmlUtil.getXmlReaderTillNode(xml, 'Magazines').getEventType());
    	System.assertEquals('Magazines', XmlUtil.getXmlReaderTillNode(xml, 'Magazines').getLocalName());
    	System.assertEquals('First Magazine', XmlUtil.getXmlReaderTillNode(xml, 'Magazines').getAttributeValue(null, 'title'));
    	
    	//ugly cases
    	System.assertEquals(null, XmlUtil.getXmlReaderTillNode(xml, 'invalidTag'));
    	System.assertEquals(null, XmlUtil.getXmlReaderTillNode(xml, ''));
    	System.assertEquals(null, XmlUtil.getXmlReaderTillNode(null, 'books'));
    }
    
    static testMethod void getTagTextFromXmlStreamReader(){
    	String xml = '<Articles><books title="First Book"><book>1</book></books><books title="Second Book"><book>2</book></books>'+
    					'<Magazines title="First Magazine"><Magazine></Magazine></Magazines></Articles>';
    	System.assertEquals('1', XmlUtil.getTagTextFromXml(xml, 'book'));
    	System.assertEquals(null, XmlUtil.getTagTextFromXml(xml, 'Magazine'));
    	
    	String overallScoreBody = '<overallScore>'
								 + '<score>40</score>'
								 + '<description>Last name, address &amp; SSN or phone verified; first name, phone or SSN verification failures</description>'
								 + '</overallScore>';
		 System.assertEquals('Last name, address & SSN or phone verified; first name, phone or SSN verification failures', XmlUtil.getTagTextFromXml(overallScoreBody, 'description'));
    	
    	//ugly cases
    	System.assertEquals(null, XmlUtil.getTagTextFromXml(overallScoreBody, 'invalidTag'));
    	System.assertEquals(null, XmlUtil.getTagTextFromXml(overallScoreBody, ''));
    	System.assertEquals(null, XmlUtil.getTagTextFromXml(null, 'books'));
    }
    
    static testMethod void addTagToXml(){
    	Xmlstreamwriter writer = new Xmlstreamwriter();
    	Xmlutil.addTagToXml(writer, 'book', 'Let us C');
    	System.assertEquals('<book>Let us C</book>', writer.getXmlString());
    	Xmlutil.addTagToXml(writer, 'book', '');
    	System.assertEquals('<book>Let us C</book>', writer.getXmlString());
    	Xmlutil.addTagToXml(writer, 'book', null);
    	System.assertEquals('<book>Let us C</book>', writer.getXmlString());
    	
    	//ugly cases
    	writer = new Xmlstreamwriter();
    	Xmlutil.addTagToXml(writer, '', 'Let us C');
    	System.assertEquals('', writer.getXmlString());
    	
    	Xmlutil.addTagToXml(writer, null, 'Let us C');
    	System.assertEquals('', writer.getXmlString());
    	
    	System.assertEquals(null, Xmlutil.addTagToXml(null, 'book', 'Let us C'));
    	System.assertEquals('', Xmlutil.addTagToXml(writer, 'book', '').getXmlString());
    }
    
    static testMethod void getXmlOfNode(){
    	String xml = '<Articles><books title="First Book"><book>1</book></books><books title="Second Book"><book>2</book></books>'+
    					'<Magazines title="First Magazine"><Magazine>10</Magazine></Magazines></Articles>';
    	//Get the reader till first book
    	System.assertEquals('<books title="First Book"><book>1</book></books>', XmlUtil.getXmlOfNode(xml, 'books'));
    	
    	//Get reader till magazine
    	System.assertEquals('<Magazines title="First Magazine"><Magazine>10</Magazine></Magazines>', XmlUtil.getXmlOfNode(xml, 'Magazines'));
    	
    	xml = '<foos><foo></foo><foos>';
    	System.assertEquals('<foo></foo>', XmlUtil.getXmlOfNode(xml, 'foo'));
    	
    	xml = '<foos><foo/><foos>';
    	System.assertEquals('<foo/>', XmlUtil.getXmlOfNode(xml, 'foo'));
    	
    	//ugly cases
    	System.assertEquals(null, XmlUtil.getXmlOfNode(xml, 'invalidTag'));
    	System.assertEquals(null, XmlUtil.getXmlOfNode(xml, ''));
    	System.assertEquals(null, XmlUtil.getXmlOfNode(null, 'books'));
    }
    
    static testMethod void getListOfChildrenOfNode(){
    	String xml = '<Articles><books title="First Book"><book>1</book></books><books title="Second Book"><book>2</book></books>'+
    					'<Magazines title="First Magazine"><Magazine>10</Magazine></Magazines></Articles>';
    	System.assertEquals(2, XmlUtil.getListOfChildrenOfNode(xml, 'books').size());
    	System.assertEquals('<books title="First Book"><book>1</book></books>', XmlUtil.getListOfChildrenOfNode(xml, 'books').get(0));
    	System.assertEquals('<books title="Second Book"><book>2</book></books>', XmlUtil.getListOfChildrenOfNode(xml, 'books').get(1));
    	
    	System.assertEquals(1, XmlUtil.getListOfChildrenOfNode(xml, 'Magazine').size());
    	System.assertEquals('<Magazine>10</Magazine>', XmlUtil.getListOfChildrenOfNode(xml, 'Magazine').get(0));
    	
    	xml = '<foos><foo></foo><foo></foo><foos>';
    	System.assertEquals(2, XmlUtil.getListOfChildrenOfNode(xml, 'foo').size());
    	System.assertEquals('<foo></foo>', XmlUtil.getListOfChildrenOfNode(xml, 'foo').get(0));
    	System.assertEquals('<foo></foo>', XmlUtil.getListOfChildrenOfNode(xml, 'foo').get(1));
    	
    	xml = '<foos><foo/><foo/><foos>';
    	System.assertEquals(2, XmlUtil.getListOfChildrenOfNode(xml, 'foo').size());
    	System.assertEquals('<foo/>', XmlUtil.getListOfChildrenOfNode(xml, 'foo').get(0));
    	System.assertEquals('<foo/>', XmlUtil.getListOfChildrenOfNode(xml, 'foo').get(1));
    	
    	//ugly cases
    	System.assert(XmlUtil.getListOfChildrenOfNode(xml, 'invalidTag').isEmpty());
    	System.assert(XmlUtil.getListOfChildrenOfNode(xml, '').isEmpty());
    	System.assert(XmlUtil.getListOfChildrenOfNode('', 'foo').isEmpty());
    	System.assert(XmlUtil.getListOfChildrenOfNode(null, 'foo').isEmpty());
    	
    }
    
}