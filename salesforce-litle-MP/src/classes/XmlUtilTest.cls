@isTest
private class XmlUtilTest {
	
	static testMethod void testExtractXmlTagText(){
    	HttpResponse response = new HttpResponse();
    	response.setBody('<CD> ' + '<TITLE>Empire Burlesque</TITLE> ' + '<ARTIST>Bob Dylan</ARTIST> ' + '<COUNTRY>USA</COUNTRY> ' + 
    					'<COMPANY>Columbia</COMPANY> ' + '<PRICE>10.90</PRICE> ' + '<YEAR>1985</YEAR> ' + '</CD> ');
    	
    	System.assertEquals('USA', XmlUtil.extractXmlTagText(response, 'COUNTRY'));
    	System.assertEquals('', XmlUtil.extractXmlTagText(response, 'COUN'));
    	// test for blank tag name
    	System.assertEquals('', XmlUtil.extractXmlTagText(response, ''));
    	// test for null response
    	response = null;
    	System.assertEquals('', XmlUtil.extractXmlTagText(response, 'COUNTRY'));
    	// test for null body
    	response = new HttpResponse();
    	
    	System.assertEquals('', XmlUtil.extractXmlTagText(response, 'COUNTRY'));
    	
    }
}