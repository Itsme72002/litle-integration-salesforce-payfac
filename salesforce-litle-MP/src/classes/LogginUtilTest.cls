@isTest
private class LogginUtilTest {
	public static final String DEFAULT_NAME = 'test';
	public static final Date DEFAULT_DATE = Date.today();
	
	static testMethod void testlogSObjectDetailsAccount(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		// test for account
		Account account = new Account(name = DEFAULT_NAME);
		insert account;
		LoggingUtil.logSObjectDetails(account.id, null, litleRequestResponseLog);
		System.assertEquals('Account', litleRequestResponseLog.sObjectType__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(account.id, litleRequestResponseLog.Account__c);	
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
		
		//test with bad account id
		litleRequestResponseLog = new LitleRequestResponseLog__c();
		LoggingUtil.logSObjectDetails('123', null, litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.sObjectType__c);
		System.assertEquals(null, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);	
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);	
		
		//test for opportunity
		Opportunity opportunity = new Opportunity(name = DEFAULT_NAME, stageName=DEFAULT_NAME, CloseDate=DEFAULT_DATE);
		insert opportunity;
		LoggingUtil.logSObjectDetails( null,opportunity.id, litleRequestResponseLog);
		System.assertEquals('Opportunity', litleRequestResponseLog.sObjectType__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);	
		System.assertEquals(opportunity.id, litleRequestResponseLog.Opportunity__c);	
		
		//test with bad opportunity id
		litleRequestResponseLog = new LitleRequestResponseLog__c();
		LoggingUtil.logSObjectDetails(null, '123', litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.sObjectType__c);
		System.assertEquals(null, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);	
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
			
	} 
	static testMethod void testfillSObjectLogObject(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		LoggingUtil.fillSObjectLogObject(null, null, null, litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.sObjectType__c);
		System.assertEquals(null, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
	} 
	
	static testMethod void testFillSObject_Account(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		Account account = new Account(name = DEFAULT_NAME);
		insert account;
		LoggingUtil.fillSObjectLogObject('Account', DEFAULT_NAME, account.Id, litleRequestResponseLog);
		System.assertEquals('Account', litleRequestResponseLog.sObjectType__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(account.Id, litleRequestResponseLog.Account__c);
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
	}
	
	static testMethod void testFillSObject_Opportunity(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		Opportunity opportunity = new Opportunity(name = DEFAULT_NAME, stageName=DEFAULT_NAME, CloseDate=DEFAULT_DATE);
		insert opportunity;
		LoggingUtil.fillSObjectLogObject('Opportunity', DEFAULT_NAME, opportunity.Id, litleRequestResponseLog);
		System.assertEquals('Opportunity', litleRequestResponseLog.sObjectType__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);
		System.assertEquals(opportunity.Id, litleRequestResponseLog.Opportunity__c);
	}
	
	static testMethod void testlogCreateLegalEntityRequest(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		// test null http request
		LoggingUtil.logCreateLegalEntityRequest(null, litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.createLegalEntityRequestDate__c);
		System.assertEquals(null, litleRequestResponseLog.createLegalEntityRequestXml__c);
		System.assertEquals(null, litleRequestResponseLog.legalEntityEndpoint__c);
		System.assertEquals(null, litleRequestResponseLog.legalEntityAcceptHeader__c);
		System.assertEquals(null, litleRequestResponseLog.legalEntityContentTypeHeader__c);
		System.assertEquals(null, litleRequestResponseLog.legalEntityAuthorizationHeader__c);
		
		// test with http request
		litleRequestResponseLog = new LitleRequestResponseLog__c();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(DEFAULT_NAME);
        request.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, DEFAULT_NAME);
        request.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, DEFAULT_NAME);
		request.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, DEFAULT_NAME);
		request.setBody(DEFAULT_NAME);
		LoggingUtil.logCreateLegalEntityRequest(request, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createLegalEntityRequestDate__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createLegalEntityRequestXml__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.legalEntityEndpoint__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.legalEntityAcceptHeader__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.legalEntityContentTypeHeader__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.legalEntityAuthorizationHeader__c);
	} 
	static testMethod void testlogCreateSubMerchantRequest(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		// test null http request
		LoggingUtil.logCreateSubMerchantRequest(null, litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.createSubMerchantRequestDate__c);
		System.assertEquals(null, litleRequestResponseLog.createSubMerchantRequestXml__c);
		System.assertEquals(null, litleRequestResponseLog.subMerchantEndpoint__c);
		System.assertEquals(null, litleRequestResponseLog.subMerchantAcceptHeader__c);
		System.assertEquals(null, litleRequestResponseLog.subMerchantContentTypeHeader__c);
		System.assertEquals(null, litleRequestResponseLog.subMerchantAuthorizationHeader__c);
		
		// test with http request
		litleRequestResponseLog = new LitleRequestResponseLog__c();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(DEFAULT_NAME);
        request.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, DEFAULT_NAME);
        request.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, DEFAULT_NAME);
		request.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, DEFAULT_NAME);
		request.setBody(DEFAULT_NAME);
		LoggingUtil.logCreateSubMerchantRequest(request, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createSubMerchantRequestDate__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createSubMerchantRequestXml__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.subMerchantEndpoint__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.subMerchantAcceptHeader__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.subMerchantContentTypeHeader__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.subMerchantAuthorizationHeader__c);	
	} 
	static testMethod void testLogCreateLegalEntityResponse(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();	
		HttpResponse response = new HttpResponse();	
		// test with blank response
		LoggingUtil.logCreateLegalEntityResponse(response, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createLegalEntityResponseDate__c);
		System.assertEquals('', litleRequestResponseLog.createLegalEntityResponseXml__c);
		System.assertEquals('0', litleRequestResponseLog.createLegalEntityResponseStatusCode__c);	
		System.assertEquals(null, litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);		
		
		// set response parameters
		response.setStatus(DEFAULT_NAME);
		response.setStatusCode(200);
		response.setBody(DEFAULT_NAME);
		LoggingUtil.logCreateLegalEntityResponse(response, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createLegalEntityResponseDate__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createLegalEntityResponseXml__c);
		System.assertEquals('200', litleRequestResponseLog.createLegalEntityResponseStatusCode__c);	
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);	
	} 
	static testMethod void testLogCreateSubMerchantResponse(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();	
		HttpResponse response = new HttpResponse();	
		// test with blank response
		LoggingUtil.logCreateSubMerchantResponse(response, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createSubMerchantResponseDate__c);
		System.assertEquals('', litleRequestResponseLog.createSubMerchantResponseXml__c);
		System.assertEquals('0', litleRequestResponseLog.createSubMerchantResponseStatusCode__c);	
		System.assertEquals(null, litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);		
		
		// set response parameters
		response.setStatus(DEFAULT_NAME);
		response.setStatusCode(200);
		response.setBody(DEFAULT_NAME);
		LoggingUtil.logCreateSubMerchantResponse(response, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createSubMerchantResponseDate__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createSubMerchantResponseXml__c);
		System.assertEquals('200', litleRequestResponseLog.createSubMerchantResponseStatusCode__c);	
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);	
	} 
	static testMethod void testGetRequestParamsLog(){
		System.assertEquals(null, LoggingUtil.getRequestParamsLog(null));
		HttpRequest request = new HttpRequest();
		// test with blank request
		System.assertEquals('Authorization: null\nContent-Type: null\nAccept: null\n', LoggingUtil.getRequestParamsLog(request));
		// set headers and body
		request.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, DEFAULT_NAME);
		request.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, DEFAULT_NAME);
		request.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, DEFAULT_NAME);
		request.setBody(DEFAULT_NAME);
		System.assertEquals('Authorization: '+ DEFAULT_NAME +'\nContent-Type: '+ DEFAULT_NAME +'\nAccept: '+ DEFAULT_NAME +'\n'+ DEFAULT_NAME, LoggingUtil.getRequestParamsLog(request));
			
	} 
	static testMethod void testGetResponseParamsLog(){
		System.assertEquals(null, LoggingUtil.getResponseParamsLog(null));
		HttpResponse response = new HttpResponse();	
		System.assertEquals('', LoggingUtil.getResponseParamsLog(response));
		// set headers and body
		response.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, DEFAULT_NAME);
		response.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, DEFAULT_NAME);
		response.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, DEFAULT_NAME);
		response.setBody(DEFAULT_NAME);
		System.assertEquals('Authorization :'+ DEFAULT_NAME  +'\nAccept :'+ DEFAULT_NAME +'\nContent-Type :'+ DEFAULT_NAME +'\n'+ DEFAULT_NAME, LoggingUtil.getResponseParamsLog(response));
		
	} 

}