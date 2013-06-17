/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
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
		System.assertEquals(account.id, litleRequestResponseLog.sObjectId__c);	
		
		//test for opportunity
		Opportunity opportunity = new Opportunity(name = DEFAULT_NAME, stageName=DEFAULT_NAME, CloseDate=DEFAULT_DATE);
		insert opportunity;
		LoggingUtil.logSObjectDetails( null,opportunity.id, litleRequestResponseLog);
		System.assertEquals('Opportunity', litleRequestResponseLog.sObjectType__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(opportunity.id, litleRequestResponseLog.sObjectId__c);	
			
	} 
	static testMethod void testfillSObjectLogObject(){
			
	} 
	static testMethod void testlogCreateLegalEntityRequest(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		// test null http request
		LoggingUtil.logCreateLegalEntityRequest(null, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createLegalEntityRequestDate__c);
		System.assertEquals(null, litleRequestResponseLog.createLegalEntityRequestXml__c);
	} 
	static testMethod void testlogCreateSubMerchantRequest(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		// test null http request
		LoggingUtil.logCreateSubMerchantRequest(null, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createSubMerchantRequestDate__c);
		System.assertEquals(null, litleRequestResponseLog.createSubMerchantRequestXml__c);	
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
		request.setHeader('Authorization', DEFAULT_NAME);
		request.setHeader('Content-Type', DEFAULT_NAME);
		request.setHeader('Accept', DEFAULT_NAME);
		request.setBody(DEFAULT_NAME);
		System.assertEquals('Authorization: '+ DEFAULT_NAME +'\nContent-Type: '+ DEFAULT_NAME +'\nAccept: '+ DEFAULT_NAME +'\n'+ DEFAULT_NAME, LoggingUtil.getRequestParamsLog(request));
			
	} 
	static testMethod void testGetResponseParamsLog(){
		System.assertEquals(null, LoggingUtil.getResponseParamsLog(null));
		HttpResponse response = new HttpResponse();	
		System.assertEquals('', LoggingUtil.getResponseParamsLog(response));
		// set headers and body
		response.setHeader('Authorization', DEFAULT_NAME);
		response.setHeader('Content-Type', DEFAULT_NAME);
		response.setHeader('Accept', DEFAULT_NAME);
		response.setBody(DEFAULT_NAME);
		System.assertEquals('Authorization :'+ DEFAULT_NAME  +'\nAccept :'+ DEFAULT_NAME +'\nContent-Type :'+ DEFAULT_NAME +'\n'+ DEFAULT_NAME, LoggingUtil.getResponseParamsLog(response));
		
	} 

}