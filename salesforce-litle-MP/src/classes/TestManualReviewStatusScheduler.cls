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
private class TestManualReviewStatusScheduler {
	
	//job id = 08ei0000004HWYsAAO
	public static final String LEGAL_ENTITY_ID = '123';
	public static final String AUTH_HEADER = 'test';
	public static final String REQUEST_XML = '<test />';
	public static final String TEST_STRING = 'test';
	
	static testMethod void testScheduleIt(){
		Test.startTest();
		String jobId = ManualReviewStatusScheduler.scheduleIt();
		CronTrigger ct = fetchCronTrigger(jobId);
    	//check the cron expression
    	System.assertEquals(LitleConstants.SCHEDULER_CRON_EXP, ct.CronExpression);
    	System.abortJob(jobId);
    	//add account
    	Account account = new Account(name = TEST_STRING);
    	insert account;
    	//insert one record for manual review
    	LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_MANUAL_REVIEW; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = AUTH_HEADER; 
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE; 
		logObject.sObjectId__c = String.valueOf(account.Id); 
		logObject.sObjectType__c = 'Account'; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		Test.setMock(HttpCalloutMock.class, new MockCreateLegalEntityApprovedResponse());
		 jobId = ManualReviewStatusScheduler.scheduleIt();
		 ct = fetchCronTrigger(jobId);
    	//check the cron expression
    	System.assertEquals(LitleConstants.SCHEDULER_CRON_EXP, ct.CronExpression);
    	
    	// check for failed legal entity request
    	// check for success legal entity request
    	// check for failed sub merchant request
    	// check for success sub merchant request
    	// check for account litle mid
    	// check for opportunity litle mid
    	// check response log if updated
    	
		Test.stopTest();
	}

	public static CronTrigger fetchCronTrigger(String jobId) {
	 	return [select CronExpression, TimesTriggered, NextFireTime from CronTrigger where Id = :jobId];
	}
    
}