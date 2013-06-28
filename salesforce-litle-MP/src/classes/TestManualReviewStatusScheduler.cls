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

    static testmethod void test() {
    	Test.startTest();
    	String jobId = System.schedule('TestScheduling', LitleConstants.SCHEDULER_CRON_EXP, new ManualReviewStatusScheduler());
    	CronTrigger ct = fetchCronTrigger(jobId);
    	
    	System.assertEquals(LitleConstants.SCHEDULER_CRON_EXP, ct.CronExpression);
		System.assertEquals(0, ct.TimesTriggered);
		 
		 
		DateTime today = DateTime.now();
		String dateString = ''+today.year()+'-'+today.addMonths(1).month()+'-01 00:00:00';
		System.assertNotEquals(String.valueOf(DateTime.valueOf(dateString)), String.valueOf(ct.NextFireTime), 'Did not get the right fire date');
		 
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = fetchManualReviewRecord();
		System.assert(litleRequestResponseLogs.isEmpty());
		
		LitleRequestResponseLog__c litleRequestResponse = new LitleRequestResponseLog__c();
		 
    	
    	Test.stopTest();
    }
    	
    public static List<LitleRequestResponseLog__c> fetchManualReviewRecord() {
    	return [select legalEntityId__c, legalEntityResponseCode__c,	subMerchantAcceptHeader__c, subMerchantAuthorizationHeader__c, subMerchantContentTypeHeader__c, 
			sObjectId__c, sObjectType__c, createSubMerchantRequestXml__c from LitleRequestResponseLog__c where legalEntityResponseCode__c = '20'];
	}
	
	 public static CronTrigger fetchCronTrigger(String jobId) {
	 	return [select CronExpression, TimesTriggered, NextFireTime from CronTrigger where Id = :jobId];
	}
	
/*    	Account a = new Account(name = 'test');
    	a.forceMock__TestCount__c = '2';
    	upsert a;

   // Schedule the test job

      String jobId = System.schedule('testBasicScheduledApex', LitleConstants.SCHEDULER_CRON_EXP, new ManualReviewStatusScheduler());
   // Get the information from the CronTrigger API object

      CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];

   // Verify the expressions are the same
      System.assertEquals(LitleConstants.SCHEDULER_CRON_EXP, ct.CronExpression);

   // Verify the job has not run
      System.assertEquals(0, ct.TimesTriggered);

   // Verify the next time the job will run
      System.assertEquals('2013-06-26 10:58:00', String.valueOf(ct.NextFireTime));
      Account testAccount = [SELECT TestCount__c FROM account WHERE id = :a.id];
      System.assertNotEquals('3', testAccount.TestCount__c); */

   	
   /*	testAccount = [SELECT TestCount__c FROM account WHERE id = :a.id];

   System.assertEquals('3', testAccount.forceMock__TestCount__c);*/

}