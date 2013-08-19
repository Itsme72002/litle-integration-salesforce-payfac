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
private class TestManualReviewStatusScheduler {
	
	public static final String LEGAL_ENTITY_ID = '123';
	public static final String AUTH_HEADER = 'test';
	public static final String REQUEST_XML = '<test />';
	public static final String TEST_STRING = 'test';
	public static final Date DEFAULT_DATE = Date.today();
	public static final String ACCOUNT_NAME = 'Test Account';
	public static final String OPPORTUNITY_NAME = 'Test Opportunity';
	public static final String DEFAULT_STRING = 'Default String';
	
	static testMethod void scheduleManualReviews_NoLogRecords(){
		// check for no changes in account/opportunity 
		Account account = new Account(name = ACCOUNT_NAME);
    	insert account;
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	Test.startTest();
    	ManualReviewStatusScheduler.scheduleManualReviews();
    	Test.stopTest();
    	List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select legalEntityId__c, 
																		legalEntityResponseCode__c,
																		subMerchantAcceptHeader__c, 
																		subMerchantAuthorizationHeader__c, 
																		subMerchantContentTypeHeader__c, 
																		Account__c, 
																		Opportunity__c,
																		sObjectType__c, 
																		createSubMerchantRequestXml__c 
																			from LitleRequestResponseLog__c 
																		where legalEntityResponseCode__c= :LitleConstants.RESPONSE_MANUAL_REVIEW];
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :account.Id];	
		Opportunity thisOpportunity = [select Litle_Mid__c, PayFac_Portal_Link__c from Opportunity where Id = :opportunity.Id];	
		System.assertEquals(0, litleRequestResponseLogs.size());
		System.assertEquals(null, thisAccount.Litle_Mid__c);
		System.assertEquals(null, thisAccount.PayFac_Portal_Link__c);
		System.assertEquals(null, thisOpportunity.Litle_Mid__c);
		System.assertEquals(null, thisOpportunity.PayFac_Portal_Link__c);
	}
	
	static testMethod void scheduleManualReviews_NoManualReviewRecords(){
		Account account = new Account(name = ACCOUNT_NAME);
    	insert account;
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
		LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_APPROVED; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Account';
		logObject.Account__c = account.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_DECLINED; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Opportunity';
		logObject.Opportunity__c = opportunity.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		Test.startTest();
		ManualReviewStatusScheduler.scheduleManualReviews();
		Test.stopTest();
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select legalEntityId__c, 
																		legalEntityResponseCode__c,
																		subMerchantAcceptHeader__c, 
																		subMerchantAuthorizationHeader__c, 
																		subMerchantContentTypeHeader__c, 
																		Account__c, 
																		Opportunity__c,
																		sObjectType__c, 
																		createSubMerchantRequestXml__c 
																			from LitleRequestResponseLog__c 
																		where legalEntityResponseCode__c= :LitleConstants.RESPONSE_MANUAL_REVIEW];
																		
		System.assertEquals(0, litleRequestResponseLogs.size());
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :account.Id];	
		Opportunity thisOpportunity = [select Litle_Mid__c, PayFac_Portal_Link__c from Opportunity where Id = :opportunity.Id];	
		System.assertEquals(null, thisAccount.Litle_Mid__c);
		System.assertEquals(null, thisAccount.PayFac_Portal_Link__c);
		System.assertEquals(null, thisOpportunity.Litle_Mid__c);
		System.assertEquals(null, thisOpportunity.PayFac_Portal_Link__c);
	}
	
	static testMethod void scheduleManualReviews_ManualReviewApprovedInAccount(){
		Account account = new Account(name = ACCOUNT_NAME);
    	insert account;
    	
    	LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_MANUAL_REVIEW; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Account';
		logObject.Account__c = account.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(), new SubMerchantApprovedResponse()));
		ManualReviewStatusScheduler.scheduleManualReviews();
		Test.stopTest();
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select name,
																	legalEntityId__c, 
																	legalEntityResponseCode__c,
																	subMerchantAcceptHeader__c, 
																	subMerchantAuthorizationHeader__c, 
																	subMerchantContentTypeHeader__c, 
																	Account__c, 
																	Opportunity__c,
																	sObjectType__c, 
																	createSubMerchantRequestXml__c 
																		from LitleRequestResponseLog__c 
																where id = :logObject.id];
		System.assertEquals(1, litleRequestResponseLogs.size());
		System.assertEquals('10', litleRequestResponseLogs.get(0).legalEntityResponseCode__c);
		
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :account.Id];	
		System.assertEquals('01100003', thisAccount.Litle_Mid__c);
		System.assertEquals('https://psp-cert.litle.com/metaui/payfacPortal/legalEntity/123/subMerchant/1100003', thisAccount.PayFac_Portal_Link__c);
		
	}
	
	static testMethod void scheduleManualReviews_ManualReviewApprovedInOpportunity(){
		Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_MANUAL_REVIEW; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Opportunity';
		logObject.Opportunity__c = opportunity.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(), new SubMerchantApprovedResponse()));
		ManualReviewStatusScheduler.scheduleManualReviews();
		Test.stopTest();
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select name,
																	legalEntityId__c, 
																	legalEntityResponseCode__c,
																	subMerchantAcceptHeader__c, 
																	subMerchantAuthorizationHeader__c, 
																	subMerchantContentTypeHeader__c, 
																	Account__c, 
																	Opportunity__c,
																	sObjectType__c, 
																	createSubMerchantRequestXml__c 
																		from LitleRequestResponseLog__c 
																where id = :logObject.id];
		System.assertEquals(1, litleRequestResponseLogs.size());
		System.assertEquals('10', litleRequestResponseLogs.get(0).legalEntityResponseCode__c);
		
		Opportunity thisOpportunity = [select Litle_Mid__c, PayFac_Portal_Link__c from Opportunity where Id = :opportunity.Id];	
		System.assertEquals('01100003', thisOpportunity.Litle_Mid__c);
		System.assertEquals('https://psp-cert.litle.com/metaui/payfacPortal/legalEntity/123/subMerchant/1100003', thisOpportunity.PayFac_Portal_Link__c);
	}
	
	static testMethod void scheduleManualReviews_ManualReviewDeclinedInAccount(){
		Account account = new Account(name = ACCOUNT_NAME);
    	insert account;
    	
    	LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_MANUAL_REVIEW; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Account';
		logObject.Account__c = account.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityDeclinedResponse(), null));
		ManualReviewStatusScheduler.scheduleManualReviews();
		Test.stopTest();
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select name,
																	legalEntityId__c, 
																	legalEntityResponseCode__c,
																	subMerchantAcceptHeader__c, 
																	subMerchantAuthorizationHeader__c, 
																	subMerchantContentTypeHeader__c, 
																	Account__c, 
																	Opportunity__c,
																	sObjectType__c, 
																	createSubMerchantRequestXml__c 
																		from LitleRequestResponseLog__c 
																where id = :logObject.id];
		System.assertEquals(1, litleRequestResponseLogs.size());
		System.assertEquals('40', litleRequestResponseLogs.get(0).legalEntityResponseCode__c);
		
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :account.Id];	
		System.assertEquals('40 : Declined', thisAccount.Litle_Mid__c);
		System.assertEquals(null, thisAccount.PayFac_Portal_Link__c);
	}
	
	static testMethod void scheduleManualReviews_ManualReviewDeclinedInOpportunity(){
		Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_MANUAL_REVIEW; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Opportunity';
		logObject.Opportunity__c = opportunity.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityDeclinedResponse(), null));
		ManualReviewStatusScheduler.scheduleManualReviews();
		Test.stopTest();
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select name,
																	legalEntityId__c, 
																	legalEntityResponseCode__c,
																	subMerchantAcceptHeader__c, 
																	subMerchantAuthorizationHeader__c, 
																	subMerchantContentTypeHeader__c, 
																	Account__c, 
																	Opportunity__c,
																	sObjectType__c, 
																	createSubMerchantRequestXml__c 
																		from LitleRequestResponseLog__c 
																where id = :logObject.id];
		System.assertEquals(1, litleRequestResponseLogs.size());
		System.assertEquals('40', litleRequestResponseLogs.get(0).legalEntityResponseCode__c);
		
		Opportunity thisOpportunity = [select Litle_Mid__c, PayFac_Portal_Link__c from Opportunity where Id = :opportunity.Id];	
		System.assertEquals('40 : Declined', thisOpportunity.Litle_Mid__c);
		System.assertEquals(null, thisOpportunity.PayFac_Portal_Link__c);
	}
	
	static testMethod void scheduleManualReviews_ManualReviewReturnsManualReviewInAccount(){
		Account account = new Account(name = ACCOUNT_NAME);
    	insert account;
    	
    	LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_MANUAL_REVIEW; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Account';
		logObject.Account__c = account.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityManualReviewResponse(), null));
		ManualReviewStatusScheduler.scheduleManualReviews();
		Test.stopTest();
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select name,
																	legalEntityId__c, 
																	legalEntityResponseCode__c,
																	subMerchantAcceptHeader__c, 
																	subMerchantAuthorizationHeader__c, 
																	subMerchantContentTypeHeader__c, 
																	Account__c, 
																	Opportunity__c,
																	sObjectType__c, 
																	createSubMerchantRequestXml__c 
																		from LitleRequestResponseLog__c 
																where id = :logObject.id];
		System.assertEquals(1, litleRequestResponseLogs.size());
		System.assertEquals('20', litleRequestResponseLogs.get(0).legalEntityResponseCode__c);
		
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :account.Id];	
		System.assertEquals('20 : Manual Review', thisAccount.Litle_Mid__c);
		System.assertEquals(null, thisAccount.PayFac_Portal_Link__c);
	}
	
	static testMethod void scheduleManualReviews_ManualReviewReturnsManualReviewInOpportunity(){
		Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_MANUAL_REVIEW; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Opportunity';
		logObject.Opportunity__c = opportunity.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityManualReviewResponse(), null));
		ManualReviewStatusScheduler.scheduleManualReviews();
		Test.stopTest();
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select name,
																	legalEntityId__c, 
																	legalEntityResponseCode__c,
																	subMerchantAcceptHeader__c, 
																	subMerchantAuthorizationHeader__c, 
																	subMerchantContentTypeHeader__c, 
																	Account__c, 
																	Opportunity__c,
																	sObjectType__c, 
																	createSubMerchantRequestXml__c 
																		from LitleRequestResponseLog__c 
																where id = :logObject.id];
		System.assertEquals(1, litleRequestResponseLogs.size());
		System.assertEquals('20', litleRequestResponseLogs.get(0).legalEntityResponseCode__c);
		
		Opportunity thisOpportunity = [select Litle_Mid__c, PayFac_Portal_Link__c from Opportunity where Id = :opportunity.Id];	
		System.assertEquals('20 : Manual Review', thisOpportunity.Litle_Mid__c);
		System.assertEquals(null, thisOpportunity.PayFac_Portal_Link__c);
	}

	static testMethod void scheduleManualReviews_ManualReviewReturnsErrorInAccount(){
		Account account = new Account(name = ACCOUNT_NAME, litle_Mid__c = '20 : Manual Review');
    	insert account;
    	
    	LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_MANUAL_REVIEW; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Account';
		logObject.Account__c = account.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
		ManualReviewStatusScheduler.scheduleManualReviews();
		Test.stopTest();
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select name,
																	legalEntityId__c, 
																	legalEntityResponseCode__c,
																	subMerchantAcceptHeader__c, 
																	subMerchantAuthorizationHeader__c, 
																	subMerchantContentTypeHeader__c, 
																	Account__c, 
																	Opportunity__c,
																	sObjectType__c, 
																	createSubMerchantRequestXml__c 
																		from LitleRequestResponseLog__c 
																where id = :logObject.id];
		System.assertEquals(1, litleRequestResponseLogs.size());
		System.assertEquals('20', litleRequestResponseLogs.get(0).legalEntityResponseCode__c);
		
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :account.Id];	
		System.assertEquals('20 : Manual Review', thisAccount.Litle_Mid__c);
		System.assertEquals(null, thisAccount.PayFac_Portal_Link__c);
	}
	
	static testMethod void scheduleManualReviews_ManualReviewReturnsErrorInOpportunity(){
		Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE, litle_mid__c='20 : Manual Review');
    	insert opportunity;
    	
    	LitleRequestResponseLog__c logObject = new LitleRequestResponseLog__c();
    	logObject.legalEntityId__c = LEGAL_ENTITY_ID; 
		logObject.legalEntityResponseCode__c = LitleConstants.RESPONSE_MANUAL_REVIEW; 
		logObject.subMerchantAcceptHeader__c = LitleConstants.REQUEST_HEADER_ACCEPT_VALUE; 
		logObject.subMerchantAuthorizationHeader__c = LitleConstants.REQUEST_HEADER_AUTHORIZATION;
		logObject.subMerchantContentTypeHeader__c = LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE;
		logObject.legalEntityEndpoint__c = 'https://psp-cert.litle.com/legalentity';
		logObject.sObjectType__c = 'Opportunity';
		logObject.Opportunity__c = opportunity.id; 
		logObject.createSubMerchantRequestXml__c = REQUEST_XML; 
		insert logObject;
		
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
		ManualReviewStatusScheduler.scheduleManualReviews();
		Test.stopTest();
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select name,
																	legalEntityId__c, 
																	legalEntityResponseCode__c,
																	subMerchantAcceptHeader__c, 
																	subMerchantAuthorizationHeader__c, 
																	subMerchantContentTypeHeader__c, 
																	Account__c, 
																	Opportunity__c,
																	sObjectType__c, 
																	createSubMerchantRequestXml__c 
																		from LitleRequestResponseLog__c 
																where id = :logObject.id];
		System.assertEquals(1, litleRequestResponseLogs.size());
		System.assertEquals('20', litleRequestResponseLogs.get(0).legalEntityResponseCode__c);
		
		Opportunity thisOpportunity = [select Litle_Mid__c, PayFac_Portal_Link__c from Opportunity where Id = :opportunity.Id];	
		System.assertEquals('20 : Manual Review', thisOpportunity.Litle_Mid__c);
		System.assertEquals(null, thisOpportunity.PayFac_Portal_Link__c);
	}
	
	public static CronTrigger fetchCronTrigger(String jobId) {
	 	return [select CronExpression, TimesTriggered, NextFireTime from CronTrigger where Id = :jobId];
	}
    
}