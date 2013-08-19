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
private class LitleKYCControllerTest {
	
	public static final String ACCOUNT_NAME = 'Test Account';
	public static final String OPPORTUNITY_NAME = 'Test Opportunity';
	public static final String DEFAULT_STRING = 'Default String';
	public static final Date DEFAULT_DATE = Date.today();
	
	static testMethod void testNoUrlParameters() {
        // TO DO: implement unit test
        LitleKYCController controller = new LitleKYCController();
        System.assertEquals(null, controller.urlAccountId);
        System.assertEquals(null, controller.urlOpportunityId);
    }

    static testMethod void testUrlParametersForAccount() {
        // TO DO: implement unit test
        Apexpages.currentPage().getParameters().put('accid' , DEFAULT_STRING);
        LitleKYCController controller = new LitleKYCController();
        System.assertEquals(DEFAULT_STRING, controller.urlAccountId);
        System.assertEquals(null, controller.urlOpportunityId);
    }
    
    static testMethod void testUrlParametersForOpportunity() {
        // TO DO: implement unit test
        Apexpages.currentPage().getParameters().put('oppid' , DEFAULT_STRING);
        LitleKYCController controller = new LitleKYCController();
        System.assertEquals(DEFAULT_STRING, controller.urlOpportunityId);
        System.assertEquals(null, controller.urlAccountId);
    }
    
    static testMethod void testCancelFromOpportunity(){
    	Apexpages.currentPage().getParameters().put('oppid' , DEFAULT_STRING);
        LitleKYCController controller = new LitleKYCController();
        System.assertEquals('/'+DEFAULT_STRING, controller.cancel().getUrl());
    }
    
    static testMethod void testCancelFromAccount(){
    	Apexpages.currentPage().getParameters().put('accid' , DEFAULT_STRING);
        LitleKYCController controller = new LitleKYCController();
        System.assertEquals('/'+DEFAULT_STRING, controller.cancel().getUrl());
    }
    
    static testMethod void testCancelFromNietherAccountNorOpportunity(){
    	LitleKYCController controller = new LitleKYCController();
    	 System.assertEquals(null, controller.cancel());
    }
    
    static testMethod void testAccountNoUrlParameter(){
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.account);
    }
    
    static testMethod void testAccountWithValidAccountIdInUrlParameter(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Apexpages.currentPage().getParameters().put('accid' , account.id);
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(ACCOUNT_NAME, controller.account.name);
    	System.assertEquals(account.id, controller.account.id);
    }
    
    static testMethod void testAccountWithInvalidAccountIdInUrlParameter(){
    	Apexpages.currentPage().getParameters().put('accid' , 'invalid');
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.account);
    }
    
    static testMethod void testOpportunityNoUrlParameter(){
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.opportunity);
    }
    
    static testMethod void testOpportunityWithValidOpportunityIdInUrlParameter(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.id);
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(OPPORTUNITY_NAME, controller.opportunity.name);
    	System.assertEquals(opportunity.id, controller.opportunity.id);
    }
    
    static testMethod void testOpportunityWithInvalidOpportunityIdInUrlParameter(){
    	Apexpages.currentPage().getParameters().put('oppid' , 'invalid');
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.opportunity);
    }
    
    static testMethod void testKYCForAccountNoAccountPresent(){
    	Apexpages.currentPage().getParameters().put('accid' , '123');
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.account);
    	System.assertEquals(null, controller.litleKYC);
    }
    
    static testMethod void testKYCForAccountNoKYCPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(ACCOUNT_NAME, controller.account.name);
    	System.assertEquals(null, controller.litleKYC);
    }
    
    static testMethod void testKYCForAccountKYCPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(ACCOUNT_NAME, controller.account.name);
    	System.assertEquals(litleKYC.id, controller.litleKYC.id);
    }
    
    static testMethod void testKYCForOpportunityNoOpportunityPresent(){
    	Apexpages.currentPage().getParameters().put('oppid' , '123');
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.opportunity);
    	System.assertEquals(null, controller.litleKYC);
    }
    
    static testMethod void testKYCForOpportunityNoKYCPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(opportunity_NAME, controller.opportunity.name);
    	System.assertEquals(null, controller.litleKYC);
    }
    
    static testMethod void testKYCForOpportunityKYCPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(opportunity_NAME, controller.opportunity.name);
    	System.assertEquals(litleKYC.id, controller.litleKYC.id);
    }
    
    static testMethod void testPrincipalForAccountNoKYCPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litleKYC);
    	System.assertEquals(null, controller.litlePrincipal);
    }
    
    static testMethod void testPrincipalForAccountNoPrincipalPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleKYC);
    	System.assertEquals(null, controller.litlePrincipal);
    }
    
    static testMethod void testPrincipalForAccountPrincipalPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleKYC);
    	System.assertNotEquals(null, controller.litlePrincipal);
    	System.assertEquals(DEFAULT_STRING, controller.litlePrincipal.First_Name__c);
    }
    
    static testMethod void testPrincipalForOpportunityNoKYCPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litleKYC);
    	System.assertEquals(null, controller.litlePrincipal);
    }
    
    static testMethod void testPrincipalForOpportunityNoPrincipalPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleKYC);
    	System.assertEquals(null, controller.litlePrincipal);
    }
    
    static testMethod void testPrincipalForOpportunityPrincipalPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleKYC);
    	System.assertNotEquals(null, controller.litlePrincipal);
    	System.assertEquals(DEFAULT_STRING, controller.litlePrincipal.First_Name__c);
    }
    
    static testMethod void testBusinessForAccountNoKYCPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litleKYC);
    	System.assertEquals(null, controller.litleBusiness);
    }
    
    static testMethod void testBusinessForAccountNoBusinessPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleKYC);
    	System.assertEquals(null, controller.litleBusiness);
    }
    
    static testMethod void testBusinessForAccountBusinessPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleKYC);
    	System.assertNotEquals(null, controller.litleBusiness);
    	System.assertEquals(litleBusiness.Id, controller.litleBusiness.Id);
    }
    
    static testMethod void testBusinessForOpportunityNoKYCPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litleKYC);
    	System.assertEquals(null, controller.litleBusiness);
    }
    
    static testMethod void testBusinessForOpportunityNoBusinessPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleKYC);
    	System.assertEquals(null, controller.litleBusiness);
    }
    
    static testMethod void testBusinessForOpportunityBusinessPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleKYC);
    	System.assertNotEquals(null, controller.litleBusiness);
    	System.assertEquals(litleBusiness.Id, controller.litleBusiness.Id);
    }
    
    static testMethod void testVerificationResultForAccountNoBusinessOrPrincipalPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litleBusiness);
    	System.assertEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(null, controller.litleBusinessVerificationResult);
    }
    
    static testMethod void litleBusinessVerificationResultForAccountNoVerificationResultPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleBusiness);
    	System.assertEquals(null, controller.litleBusinessVerificationResult);
    }
    
    
    static testMethod void litlePrincipalVerificationResultForAccountNoVerificationResultPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litlePrincipal);
    	System.assertEquals(null, controller.litlePrincipalVerificationResult);
    }
    
    static testMethod void litlePrincipalVerificationResultForAccount(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Principal__c = litlePrincipal.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litlePrincipal);
    	System.assertNotEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(litlePrincipal.Id, controller.litlePrincipalVerificationResult.Litle_Principal__c);
    	System.assertEquals('true', controller.litlePrincipalVerificationResult.Address_Verified__c);
    	System.assertEquals('12', controller.litlePrincipalVerificationResult.Overall_Score__c);
    }
    
    static testMethod void litleBusinessVerificationResultForAccount(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Business__c = litleBusiness.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleBusiness);
    	System.assertNotEquals(null, controller.litleBusinessVerificationResult);
    	System.assertEquals(litleBusiness.Id, controller.litleBusinessVerificationResult.Litle_Business__c);
    	System.assertEquals('true', controller.litleBusinessVerificationResult.Address_Verified__c);
    	System.assertEquals('12', controller.litleBusinessVerificationResult.Overall_Score__c);
    }
    
    //////////////////////////////
    
    static testMethod void testVerificationResultForOpportunityNoBusinessOrPrincipalPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litleBusiness);
    	System.assertEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(null, controller.litleBusinessVerificationResult);
    }
    
    static testMethod void litleBusinessVerificationResultForOpportunityNoVerificationResultPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleBusiness);
    	System.assertEquals(null, controller.litleBusinessVerificationResult);
    }
    
    
    static testMethod void litlePrincipalVerificationResultForOpportunityNoVerificationResultPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litlePrincipal);
    	System.assertEquals(null, controller.litlePrincipalVerificationResult);
    }
    
    static testMethod void litlePrincipalVerificationResultForOpportunity(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Principal__c = litlePrincipal.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litlePrincipal);
    	System.assertNotEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(litlePrincipal.Id, controller.litlePrincipalVerificationResult.Litle_Principal__c);
    	System.assertEquals('true', controller.litlePrincipalVerificationResult.Address_Verified__c);
    	System.assertEquals('12', controller.litlePrincipalVerificationResult.Overall_Score__c);
    }
    
    static testMethod void litleBusinessVerificationResultForOpportunity(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Business__c = litleBusiness.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleBusiness);
    	System.assertNotEquals(null, controller.litleBusinessVerificationResult);
    	System.assertEquals(litleBusiness.Id, controller.litleBusinessVerificationResult.Litle_Business__c);
    	System.assertEquals('true', controller.litleBusinessVerificationResult.Address_Verified__c);
    	System.assertEquals('12', controller.litleBusinessVerificationResult.Overall_Score__c);
    }
    
    static testMethod void principalRiskIndicatorsNoVerificationResultPresentInAccount(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(null, controller.litlePrincipalRiskIndicators);
    }
    
    static testMethod void principalRiskIndicatorsInAccountNoRisksPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Principal__c = litlePrincipal.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(new List<Litle_Risk_Indicator__c>(), controller.litlePrincipalRiskIndicators);
    }
    
    static testMethod void multiplePrincipalRiskIndicatorsInAccount(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Principal__c = litlePrincipal.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Litle_Risk_Indicator__c riskIndicator1 = new Litle_Risk_Indicator__c();
    	riskIndicator1.Litle_Verification_Result__c = litleVerificationResult.Id;
    	riskIndicator1.Code__c = '10';
    	insert riskIndicator1;
    	
    	Litle_Risk_Indicator__c riskIndicator2 = new Litle_Risk_Indicator__c();
    	riskIndicator2.Litle_Verification_Result__c = litleVerificationResult.Id;
    	riskIndicator2.Description__c = 'risky';
    	insert riskIndicator2;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(2, controller.litlePrincipalRiskIndicators.size());
    	System.assertEquals('10', controller.litlePrincipalRiskIndicators.get(0).Code__c);
    	System.assertEquals('risky', controller.litlePrincipalRiskIndicators.get(1).Description__c);
    }
    
    static testMethod void businessRiskIndicatorsNoVerificationResultPresentInAccount(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litleBusinessVerificationResult);
    	System.assertEquals(null, controller.litleBusinessRiskIndicators);
    }
    
    static testMethod void businessRiskIndicatorsInAccountNoRisksPresent(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Business__c = litleBusiness.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleBusinessVerificationResult);
    	System.assertEquals(new List<Litle_Risk_Indicator__c>(), controller.litleBusinessRiskIndicators);
    }
    
    static testMethod void multipleBusinessRiskIndicatorsInAccount(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Business__c = litleBusiness.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Litle_Risk_Indicator__c riskIndicator1 = new Litle_Risk_Indicator__c();
    	riskIndicator1.Litle_Verification_Result__c = litleVerificationResult.Id;
    	riskIndicator1.Code__c = '10';
    	insert riskIndicator1;
    	
    	Litle_Risk_Indicator__c riskIndicator2 = new Litle_Risk_Indicator__c();
    	riskIndicator2.Litle_Verification_Result__c = litleVerificationResult.Id;
    	riskIndicator2.Description__c = 'risky';
    	insert riskIndicator2;
    	
    	Apexpages.currentPage().getParameters().put('accid' , account.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleBusinessVerificationResult);
    	System.assertEquals(2, controller.litleBusinessRiskIndicators.size());
    	System.assertEquals('10', controller.litleBusinessRiskIndicators.get(0).Code__c);
    	System.assertEquals('risky', controller.litleBusinessRiskIndicators.get(1).Description__c);
    }
    ////////////////////////////////
    
    static testMethod void principalRiskIndicatorsNoVerificationResultPresentInOpportunity(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(null, controller.litlePrincipalRiskIndicators);
    }
    
    static testMethod void principalRiskIndicatorsInOpportunityNoRisksPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Principal__c = litlePrincipal.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(new List<Litle_Risk_Indicator__c>(), controller.litlePrincipalRiskIndicators);
    }
    
    static testMethod void multiplePrincipalRiskIndicatorsInOpportunity(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
    	litlePrincipal.litle_KYC__c = litleKYC.id;
    	litlePrincipal.First_Name__c = DEFAULT_STRING;
    	insert litlePrincipal;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Principal__c = litlePrincipal.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Litle_Risk_Indicator__c riskIndicator1 = new Litle_Risk_Indicator__c();
    	riskIndicator1.Litle_Verification_Result__c = litleVerificationResult.Id;
    	riskIndicator1.Code__c = '10';
    	insert riskIndicator1;
    	
    	Litle_Risk_Indicator__c riskIndicator2 = new Litle_Risk_Indicator__c();
    	riskIndicator2.Litle_Verification_Result__c = litleVerificationResult.Id;
    	riskIndicator2.Description__c = 'risky';
    	insert riskIndicator2;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litlePrincipalVerificationResult);
    	System.assertEquals(2, controller.litlePrincipalRiskIndicators.size());
    	System.assertEquals('10', controller.litlePrincipalRiskIndicators.get(0).Code__c);
    	System.assertEquals('risky', controller.litlePrincipalRiskIndicators.get(1).Description__c);
    }
    
    static testMethod void businessRiskIndicatorsNoVerificationResultPresentInOpportunity(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertEquals(null, controller.litleBusinessVerificationResult);
    	System.assertEquals(null, controller.litleBusinessRiskIndicators);
    }
    
    static testMethod void businessRiskIndicatorsInOpportunityNoRisksPresent(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Business__c = litleBusiness.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleBusinessVerificationResult);
    	System.assertEquals(new List<Litle_Risk_Indicator__c>(), controller.litleBusinessRiskIndicators);
    }
    
    static testMethod void multipleBusinessRiskIndicatorsInOpportunity(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
    	litleBusiness.litle_KYC__c = litleKYC.id;
    	insert litleBusiness;
    	
    	Litle_Verification_Result__c litleVerificationResult = new Litle_Verification_Result__c();
    	litleVerificationResult.Litle_Business__c = litleBusiness.Id;
    	litleVerificationResult.Address_Verified__c = 'true';
    	litleVerificationResult.Overall_Score__c = '12';
    	insert litleVerificationResult;
    	
    	Litle_Risk_Indicator__c riskIndicator1 = new Litle_Risk_Indicator__c();
    	riskIndicator1.Litle_Verification_Result__c = litleVerificationResult.Id;
    	riskIndicator1.Code__c = '10';
    	insert riskIndicator1;
    	
    	Litle_Risk_Indicator__c riskIndicator2 = new Litle_Risk_Indicator__c();
    	riskIndicator2.Litle_Verification_Result__c = litleVerificationResult.Id;
    	riskIndicator2.Description__c = 'risky';
    	insert riskIndicator2;
    	
    	Apexpages.currentPage().getParameters().put('oppid' , opportunity.Id);
    	
    	LitleKYCController controller = new LitleKYCController();
    	System.assertNotEquals(null, controller.litleBusinessVerificationResult);
    	System.assertEquals(2, controller.litleBusinessRiskIndicators.size());
    	System.assertEquals('10', controller.litleBusinessRiskIndicators.get(0).Code__c);
    	System.assertEquals('risky', controller.litleBusinessRiskIndicators.get(1).Description__c);
    }
}