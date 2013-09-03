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
private class MccServiceTest {

    static testMethod void getAllMccForUser_Success() {
    	MccService service = new MccService();
    	List<String> expectedMcc = new List<String>();
    	expectedMcc.add('5960');
    	expectedMcc.add('5964');
    	expectedMcc.add('5965');
    	expectedMcc.add('8220');
    	Test.startTest();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new MccSuccessResponse(), null));
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	List<String> actualMcc = service.getAllMccForUser('user', 'pass', 'endpoint', litleRequestResponseLog);
        System.assertEquals(expectedMcc, actualMcc);
        
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccAcceptHeader__c);
        Blob headerValue = Blob.valueOf('user:pass'); //Enter username and password
        String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
        System.assertEquals(authorizationHeader, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals('endpoint/mcc', litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals('GET', litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals('Success', litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals('', litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals('200', litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(MccSuccessResponse.response, litleRequestResponseLog.MccResponseXml__c);
        Test.stopTest();
    }
    
    static testMethod void getAllMccForUser_Error() {
    	MccService service = new MccService();
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	List<String> actualMcc = service.getAllMccForUser('', 'pass', 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMcc);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMcc = service.getAllMccForUser('user', '', 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMcc);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMcc = service.getAllMccForUser(null, 'pass', 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMcc);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMcc = service.getAllMccForUser('user', null, 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMcc);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMcc = service.getAllMccForUser('user', 'pass', '', litleRequestResponseLog);
        System.assertEquals(null, actualMcc);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMcc = service.getAllMccForUser('user', 'pass', null, litleRequestResponseLog);
        System.assertEquals(null, actualMcc);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        Test.startTest();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
    	litleRequestResponseLog = new LitleRequestResponseLog__c();
    	actualMcc = service.getAllMccForUser('user', 'pass', 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMcc);
        
       System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccAcceptHeader__c);
        Blob headerValue = Blob.valueOf('user:pass'); //Enter username and password
        String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
        System.assertEquals(authorizationHeader, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals('endpoint/mcc', litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals('GET', litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals('Unauthorized', litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals('', litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals('401', litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(LitleErrorResponse.response, litleRequestResponseLog.MccResponseXml__c);
        Test.stopTest();
    }
    
    static testMethod void getAllMccForUser_Invalid() {
    	MccService service = new MccService();
    	Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(false), null));
        LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
        List<String> actualMcc = service.getAllMccForUser('user', 'pass', 'endpoint', litleRequestResponseLog);
        System.assertEquals(0, actualMcc.size());
        
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccAcceptHeader__c);
        Blob headerValue = Blob.valueOf('user:pass'); //Enter username and password
        String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
        System.assertEquals(authorizationHeader, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals('endpoint/mcc', litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals('GET', litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals('Approved', litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals('', litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals('200', litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(LegalEntityApprovedResponse.approvedResponse, litleRequestResponseLog.MccResponseXml__c);
        Test.stopTest();
    }
    
    static testMethod void getMccSelectOptionsForUser_Success(){
    	MccService service = new MccService();
    	List<Selectoption> expectedMccSelectOptions = new List<Selectoption>();
    	expectedMccSelectOptions.add(new Selectoption('5960', '5960'));
    	expectedMccSelectOptions.add(new Selectoption('5964', '5964'));
    	expectedMccSelectOptions.add(new Selectoption('5965', '5965'));
    	expectedMccSelectOptions.add(new Selectoption('8220','8220'));
    	Test.startTest();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new MccSuccessResponse(), null));
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	List<Selectoption> actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', 'endpoint', litleRequestResponseLog);
        System.assertEquals(expectedMccSelectOptions, actualMccSelectOptions);
        
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccAcceptHeader__c);
        Blob headerValue = Blob.valueOf('user:pass'); //Enter username and password
        String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
        System.assertEquals(authorizationHeader, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals('endpoint/mcc', litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals('GET', litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals('Success', litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals('', litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals('200', litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(MccSuccessResponse.response, litleRequestResponseLog.MccResponseXml__c);
        Test.stopTest();
    }
    
    static testMethod void getMccSelectOptionsForUser_Error() {
    	MccService service = new MccService();
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	List<Selectoption> actualMccSelectOptions = service.getMccSelectOptionsForUser('', 'pass', 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMccSelectOptions);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMccSelectOptions = service.getMccSelectOptionsForUser('user', '', 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMccSelectOptions);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMccSelectOptions = service.getMccSelectOptionsForUser(null, 'pass', 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMccSelectOptions);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMccSelectOptions = service.getMccSelectOptionsForUser('user', null, 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMccSelectOptions);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', '', litleRequestResponseLog);
        System.assertEquals(null, actualMccSelectOptions);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        litleRequestResponseLog = new LitleRequestResponseLog__c();
        actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', null, litleRequestResponseLog);
        System.assertEquals(null, actualMccSelectOptions);
        
        System.assertEquals(null, litleRequestResponseLog.MccAcceptHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals(null, litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals(null, litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals(null, litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals(null, litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(null, litleRequestResponseLog.MccResponseXml__c);
        
        Test.startTest();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
    	litleRequestResponseLog = new LitleRequestResponseLog__c();
    	actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', 'endpoint', litleRequestResponseLog);
        System.assertEquals(null, actualMccSelectOptions);
        
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccAcceptHeader__c);
        Blob headerValue = Blob.valueOf('user:pass'); //Enter username and password
        String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
        System.assertEquals(authorizationHeader, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals('endpoint/mcc', litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals('GET', litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals('Unauthorized', litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals('', litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals('401', litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(LitleErrorResponse.response, litleRequestResponseLog.MccResponseXml__c);
        Test.stopTest();
    }
    
    static testMethod void getMccSelectOptionsForUser_Invalid() {
    	MccService service = new MccService();
    	Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(false), null));
        LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
        List<Selectoption>  actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', 'endpoint', litleRequestResponseLog);
        System.assert(actualMccSelectOptions.isEmpty());
        
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccAcceptHeader__c);
        Blob headerValue = Blob.valueOf('user:pass'); //Enter username and password
        String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
        System.assertEquals(authorizationHeader, litleRequestResponseLog.MccAuthorizationHeader__c);
        System.assertEquals('endpoint/mcc', litleRequestResponseLog.MccEndpoint__c);
        System.assertEquals('application/com.litle.psp-v6+xml', litleRequestResponseLog.MccContentTypeHeader__c);
        
        System.assertEquals('GET', litleRequestResponseLog.Mcc_Request_Method__c);
        
        System.assertEquals('Approved', litleRequestResponseLog.MccResponseStatusMessage__c);
        System.assertEquals('', litleRequestResponseLog.MccRequestXml__c);
        System.assertEquals('200', litleRequestResponseLog.MccResponseStatusCode__c);
        System.assertEquals(LegalEntityApprovedResponse.approvedResponse, litleRequestResponseLog.MccResponseXml__c);
        Test.stopTest();
     }
}