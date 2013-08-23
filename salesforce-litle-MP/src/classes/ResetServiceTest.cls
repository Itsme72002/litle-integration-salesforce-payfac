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
private class ResetServiceTest {
	public static final String ACCOUNT_NAME = 'Test Account';
	public static final String OPPORTUNITY_NAME = 'Test Opportunity';
	public static final String DEFAULT_STRING = 'Default String';
	public static final Date DEFAULT_DATE = Date.today();

    static testMethod void deleteAllLitleKYC_NoKYCRecords(){
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, litleKYCs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleKYC();
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, litleKYCs.size());
    }
    
    static testMethod void deleteAllLitleKYC_WithKYCRecord(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.Id;
    	insert litleKYC;
    	List<Litle_KYC__c> accountKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1, accountKYCs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleKYC();
    	accountKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, accountKYCs.size());
    }
    
    static testMethod void deleteAllKYCForAccount_WithKYCDetails(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.Id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
        litleBusiness.Litle_KYC__c = litleKYC.Id;
        insert litleBusiness;
        
        Litle_Verification_Result__c businessVerification = new Litle_Verification_Result__c();
        businessVerification.Address_Verified__c = 'test';
        businessVerification.City_Verified__c = 'test';
        businessVerification.Litle_Business__c = litleBusiness.Id;
        businessVerification.Name_Address_Phone_Association_Code__c = 'test';
        businessVerification.Name_Address_Phone_Association_Desc__c = 'test';
        businessVerification.Name_Address_TaxId_Association_Code__c = 'test';
        businessVerification.Name_Address_TaxId_Association_Desc__c = 'test';
        businessVerification.Name_Verified__c = 'test';
        businessVerification.Overall_Description__c = 'test';
        businessVerification.Overall_Score__c = '12';
        businessVerification.Phone_Verified__c = 'test';
        businessVerification.TaxId_Verified__c = 'test';
        businessVerification.Zip_Verified__c = 'test';
        insert businessVerification; 
        
        Litle_Risk_Indicator__c businessRisk = new Litle_Risk_Indicator__c();
        businessRisk.Code__c = 'test';
        businessRisk.Description__c = 'test';
        businessRisk.Litle_Verification_Result__c = businessVerification.Id;
        insert businessRisk;
        
        Litle_Principal__c litlePrincipal = new Litle_Principal__c();
        litlePrincipal.Litle_KYC__c = litleKYC.Id;
        litlePrincipal.Principal_Id__c = '10';
        litlePrincipal.First_Name__c = 'First Name';
        litlePrincipal.Last_Name__c = 'Last Name';
        insert litlePrincipal;
        
        Litle_Verification_Result__c principalVerification = new Litle_Verification_Result__c();
        principalVerification.Address_Verified__c = 'test';
        principalVerification.City_Verified__c = 'test';
        principalVerification.Litle_Principal__c = litlePrincipal.Id;
        principalVerification.Name_Address_Phone_Association_Code__c = 'test';
        principalVerification.Name_Address_Phone_Association_Desc__c = 'test';
        principalVerification.Name_Address_TaxId_Association_Code__c = 'test';
        principalVerification.Name_Address_TaxId_Association_Desc__c = 'test';
        principalVerification.Name_Verified__c = 'test';
        principalVerification.Overall_Description__c = 'test';
        principalVerification.Overall_Score__c = '12';
        principalVerification.Phone_Verified__c = 'test';
        principalVerification.TaxId_Verified__c = 'test';
        principalVerification.Zip_Verified__c = 'test';
        insert principalVerification; 
        
        Litle_Risk_Indicator__c principalRisk = new Litle_Risk_Indicator__c();
        principalRisk.Code__c = 'test';
        principalRisk.Description__c = 'test';
        principalRisk.Litle_Verification_Result__c = principalVerification.Id;
        insert principalRisk;
    	
    	List<Litle_KYC__c> accountKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1, accountKYCs.size());
    	List<Litle_Principal__c> accountPrincipals = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(1, accountPrincipals.size());
    	List<Litle_Business__c> accountBusinesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(1, accountBusinesses.size());
    	List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(2, verificationResults.size());
    	List<Litle_Risk_Indicator__c> riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
    	System.assertEquals(2, riskIndicators.size());
    	
    	ResetService service = new ResetService();
    	service.deleteAllLitleKYC();
    	accountKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, accountKYCs.size());
    	accountPrincipals = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0, accountPrincipals.size());
    	accountBusinesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0, accountBusinesses.size());
    	verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    	riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
    	System.assertEquals(0, riskIndicators.size());
    }
    
    static testMethod void deleteKYCForOpportunity_NoKYCRecords(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	List<Litle_KYC__c> opportunityKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, opportunityKYCs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleKYC();
    	opportunityKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, opportunityKYCs.size());
    }
    
    static testMethod void deleteKYCForOpportunity_WithKYCRecord(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.Id;
    	insert litleKYC;
    	List<Litle_KYC__c> opportunityKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1, opportunityKYCs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleKYC();
    	opportunityKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, opportunityKYCs.size());
    }
    
    static testMethod void deleteKYCForOpportunity_WithKYCDetails(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Opportunity__c = opportunity.Id;
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
        litleBusiness.Litle_KYC__c = litleKYC.Id;
        insert litleBusiness;
        
        Litle_Verification_Result__c businessVerification = new Litle_Verification_Result__c();
        businessVerification.Address_Verified__c = 'test';
        businessVerification.City_Verified__c = 'test';
        businessVerification.Litle_Business__c = litleBusiness.Id;
        businessVerification.Name_Address_Phone_Association_Code__c = 'test';
        businessVerification.Name_Address_Phone_Association_Desc__c = 'test';
        businessVerification.Name_Address_TaxId_Association_Code__c = 'test';
        businessVerification.Name_Address_TaxId_Association_Desc__c = 'test';
        businessVerification.Name_Verified__c = 'test';
        businessVerification.Overall_Description__c = 'test';
        businessVerification.Overall_Score__c = '12';
        businessVerification.Phone_Verified__c = 'test';
        businessVerification.TaxId_Verified__c = 'test';
        businessVerification.Zip_Verified__c = 'test';
        insert businessVerification; 
        
        Litle_Risk_Indicator__c businessRisk = new Litle_Risk_Indicator__c();
        businessRisk.Code__c = 'test';
        businessRisk.Description__c = 'test';
        businessRisk.Litle_Verification_Result__c = businessVerification.Id;
        insert businessRisk;
        
        Litle_Principal__c litlePrincipal = new Litle_Principal__c();
        litlePrincipal.Litle_KYC__c = litleKYC.Id;
        litlePrincipal.Principal_Id__c = '10';
        litlePrincipal.First_Name__c = 'First Name';
        litlePrincipal.Last_Name__c = 'Last Name';
        insert litlePrincipal;
        
        Litle_Verification_Result__c principalVerification = new Litle_Verification_Result__c();
        principalVerification.Address_Verified__c = 'test';
        principalVerification.City_Verified__c = 'test';
        principalVerification.Litle_Principal__c = litlePrincipal.Id;
        principalVerification.Name_Address_Phone_Association_Code__c = 'test';
        principalVerification.Name_Address_Phone_Association_Desc__c = 'test';
        principalVerification.Name_Address_TaxId_Association_Code__c = 'test';
        principalVerification.Name_Address_TaxId_Association_Desc__c = 'test';
        principalVerification.Name_Verified__c = 'test';
        principalVerification.Overall_Description__c = 'test';
        principalVerification.Overall_Score__c = '12';
        principalVerification.Phone_Verified__c = 'test';
        principalVerification.TaxId_Verified__c = 'test';
        principalVerification.Zip_Verified__c = 'test';
        insert principalVerification; 
        
        Litle_Risk_Indicator__c principalRisk = new Litle_Risk_Indicator__c();
        principalRisk.Code__c = 'test';
        principalRisk.Description__c = 'test';
        principalRisk.Litle_Verification_Result__c = principalVerification.Id;
        insert principalRisk;
    	
    	List<Litle_KYC__c> opportunityKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1, opportunityKYCs.size());
    	List<Litle_Principal__c> opportunityPrincipals = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(1, opportunityPrincipals.size());
    	List<Litle_Business__c> opportunityBusinesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(1, opportunityBusinesses.size());
    	List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(2, verificationResults.size());
    	List<Litle_Risk_Indicator__c> riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
    	System.assertEquals(2, riskIndicators.size());
    	
    	ResetService service = new ResetService();
    	service.deleteAllLitleKYC();
    	opportunityKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, opportunityKYCs.size());
    	opportunityPrincipals = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0, opportunityPrincipals.size());
    	opportunityBusinesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0, opportunityBusinesses.size());
    	verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    	riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
    	System.assertEquals(0, riskIndicators.size());
    }
    
    static testMethod void deleteRiskIndicatorOfVerificationResult_NoRecords(){
    	Litle_Verification_Result__c verification = new Litle_Verification_Result__c();
        verification.Address_Verified__c = 'test';
        verification.City_Verified__c = 'test';
        verification.Name_Address_Phone_Association_Code__c = 'test';
        verification.Name_Address_Phone_Association_Desc__c = 'test';
        verification.Name_Address_TaxId_Association_Code__c = 'test';
        verification.Name_Address_TaxId_Association_Desc__c = 'test';
        verification.Name_Verified__c = 'test';
        verification.Overall_Description__c = 'test';
        verification.Overall_Score__c = '12';
        verification.Phone_Verified__c = 'test';
        verification.TaxId_Verified__c = 'test';
        verification.Zip_Verified__c = 'test';
        insert verification; 
        List<Litle_Risk_Indicator__c> riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
        System.assertEquals(0, riskIndicators.size());
        ResetService service = new ResetService();
    	service.deleteRiskIndicatorOfVerificationResult(verification.Id);
    	riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
        System.assertEquals(0, riskIndicators.size());
    }
    
    static testMethod void deleteRiskIndicatorOfVerificationResult_MultipleRecords(){
    	Litle_Verification_Result__c verification = new Litle_Verification_Result__c();
        verification.Address_Verified__c = 'test';
        verification.City_Verified__c = 'test';
        verification.Name_Address_Phone_Association_Code__c = 'test';
        verification.Name_Address_Phone_Association_Desc__c = 'test';
        verification.Name_Address_TaxId_Association_Code__c = 'test';
        verification.Name_Address_TaxId_Association_Desc__c = 'test';
        verification.Name_Verified__c = 'test';
        verification.Overall_Description__c = 'test';
        verification.Overall_Score__c = '12';
        verification.Phone_Verified__c = 'test';
        verification.TaxId_Verified__c = 'test';
        verification.Zip_Verified__c = 'test';
        insert verification; 
        
        Litle_Risk_Indicator__c principalRisk = new Litle_Risk_Indicator__c();
        principalRisk.Code__c = 'test';
        principalRisk.Description__c = 'test';
        principalRisk.Litle_Verification_Result__c = verification.Id;
        insert principalRisk;
        
        Litle_Risk_Indicator__c businessRisk = new Litle_Risk_Indicator__c();
        businessRisk.Code__c = 'test';
        businessRisk.Description__c = 'test';
        businessRisk.Litle_Verification_Result__c = verification.Id;
        insert businessRisk;
        
        List<Litle_Risk_Indicator__c> riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
        System.assertEquals(2, riskIndicators.size());
        ResetService service = new ResetService();
    	service.deleteRiskIndicatorOfVerificationResult(verification.Id);
    	riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
        System.assertEquals(0, riskIndicators.size());
        
    }
    
    static testMethod void deleteBusinessVerificationResult_NoVerificationRecord(){
    	Litle_Business__c litleBusiness = new Litle_Business__c();
        insert litleBusiness;
        List<Litle_Business__c> business = [select Id, Name from Litle_Business__c];
    	System.assertEquals(1, business.size());
        List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    	ResetService service = new ResetService();
    	service.deleteBusinessVerificationResult(litleBusiness.Id);
    	verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    }
    
    static testMethod void deleteBusinessVerificationResult_VerificationRecordWithNoRiskIndicator(){
    	Litle_Business__c litleBusiness = new Litle_Business__c();
        insert litleBusiness;
        
        Litle_Verification_Result__c verification = new Litle_Verification_Result__c();
        verification.Address_Verified__c = 'test';
        verification.City_Verified__c = 'test';
        verification.Litle_Business__c = litleBusiness.Id;
        verification.Name_Address_Phone_Association_Code__c = 'test';
        verification.Name_Address_Phone_Association_Desc__c = 'test';
        verification.Name_Address_TaxId_Association_Code__c = 'test';
        verification.Name_Address_TaxId_Association_Desc__c = 'test';
        verification.Name_Verified__c = 'test';
        verification.Overall_Description__c = 'test';
        verification.Overall_Score__c = '12';
        verification.Phone_Verified__c = 'test';
        verification.TaxId_Verified__c = 'test';
        verification.Zip_Verified__c = 'test';
        insert verification; 
        
        List<Litle_Business__c> business = [select Id, Name from Litle_Business__c];
    	System.assertEquals(1, business.size());
        List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(1, verificationResults.size());
    	ResetService service = new ResetService();
    	service.deleteBusinessVerificationResult(litleBusiness.Id);
    	verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    	business = [select Id, Name from Litle_Business__c];
    	System.assertEquals(1, business.size());
    }
    
   static testMethod void deleteBusinessVerificationResult_VerificationRecordWithRiskIndicators(){
    	Litle_Business__c litleBusiness = new Litle_Business__c();
        insert litleBusiness;
        
        Litle_Verification_Result__c verification = new Litle_Verification_Result__c();
        verification.Address_Verified__c = 'test';
        verification.City_Verified__c = 'test';
        verification.Litle_Business__c = litleBusiness.Id;
        verification.Name_Address_Phone_Association_Code__c = 'test';
        verification.Name_Address_Phone_Association_Desc__c = 'test';
        verification.Name_Address_TaxId_Association_Code__c = 'test';
        verification.Name_Address_TaxId_Association_Desc__c = 'test';
        verification.Name_Verified__c = 'test';
        verification.Overall_Description__c = 'test';
        verification.Overall_Score__c = '12';
        verification.Phone_Verified__c = 'test';
        verification.TaxId_Verified__c = 'test';
        verification.Zip_Verified__c = 'test';
        insert verification; 
        
        Litle_Risk_Indicator__c principalRisk = new Litle_Risk_Indicator__c();
        principalRisk.Code__c = 'test';
        principalRisk.Description__c = 'test';
        principalRisk.Litle_Verification_Result__c = verification.Id;
        insert principalRisk;
        
        Litle_Risk_Indicator__c businessRisk = new Litle_Risk_Indicator__c();
        businessRisk.Code__c = 'test';
        businessRisk.Description__c = 'test';
        businessRisk.Litle_Verification_Result__c = verification.Id;
        insert businessRisk;
        
        List<Litle_Business__c> business = [select Id, Name from Litle_Business__c];
    	System.assertEquals(1, business.size());
        List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(1, verificationResults.size());
    	List<Litle_Risk_Indicator__c> riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
        System.assertEquals(2, riskIndicators.size());
    	ResetService service = new ResetService();
    	service.deleteBusinessVerificationResult(litleBusiness.Id);
    	verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    	business = [select Id, Name from Litle_Business__c];
    	System.assertEquals(1, business.size());
    	riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
        System.assertEquals(0, riskIndicators.size());
    }
    
    static testMethod void deletePrincipalVerificationResult_NoVerificationRecord(){
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
        insert litlePrincipal;
        List<Litle_Principal__c> principal = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(1, principal.size());
        List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    	ResetService service = new ResetService();
    	service.deletePrincipalVerificationResult(litlePrincipal.Id);
    	verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    }
    
    static testMethod void deletePrincipalVerificationResult_VerificationRecordWithNoRiskIndicator(){
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
        insert litlePrincipal;
        
        Litle_Verification_Result__c verification = new Litle_Verification_Result__c();
        verification.Address_Verified__c = 'test';
        verification.City_Verified__c = 'test';
        verification.Litle_Principal__c = litlePrincipal.Id;
        verification.Name_Address_Phone_Association_Code__c = 'test';
        verification.Name_Address_Phone_Association_Desc__c = 'test';
        verification.Name_Address_TaxId_Association_Code__c = 'test';
        verification.Name_Address_TaxId_Association_Desc__c = 'test';
        verification.Name_Verified__c = 'test';
        verification.Overall_Description__c = 'test';
        verification.Overall_Score__c = '12';
        verification.Phone_Verified__c = 'test';
        verification.TaxId_Verified__c = 'test';
        verification.Zip_Verified__c = 'test';
        insert verification; 
        
        List<Litle_Principal__c> principal = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(1, principal.size());
        List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(1, verificationResults.size());
    	ResetService service = new ResetService();
    	service.deletePrincipalVerificationResult(litlePrincipal.Id);
    	verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    	principal = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(1, principal.size());
    }
    
   static testMethod void deletePrincipalVerificationResult_VerificationRecordWithRiskIndicators(){
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
        insert litlePrincipal;
        
        Litle_Verification_Result__c verification = new Litle_Verification_Result__c();
        verification.Address_Verified__c = 'test';
        verification.City_Verified__c = 'test';
        verification.Litle_Principal__c = litlePrincipal.Id;
        verification.Name_Address_Phone_Association_Code__c = 'test';
        verification.Name_Address_Phone_Association_Desc__c = 'test';
        verification.Name_Address_TaxId_Association_Code__c = 'test';
        verification.Name_Address_TaxId_Association_Desc__c = 'test';
        verification.Name_Verified__c = 'test';
        verification.Overall_Description__c = 'test';
        verification.Overall_Score__c = '12';
        verification.Phone_Verified__c = 'test';
        verification.TaxId_Verified__c = 'test';
        verification.Zip_Verified__c = 'test';
        insert verification; 
        
        Litle_Risk_Indicator__c risk = new Litle_Risk_Indicator__c();
        risk.Code__c = 'test';
        risk.Description__c = 'test';
        risk.Litle_Verification_Result__c = verification.Id;
        insert risk;
        
        Litle_Risk_Indicator__c principalRisk = new Litle_Risk_Indicator__c();
        principalRisk.Code__c = 'test';
        principalRisk.Description__c = 'test';
        principalRisk.Litle_Verification_Result__c = verification.Id;
        insert principalRisk;
        
        List<Litle_Principal__c> principal = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(1, principal.size());
        List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(1, verificationResults.size());
    	List<Litle_Risk_Indicator__c> riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
        System.assertEquals(2, riskIndicators.size());
    	ResetService service = new ResetService();
    	service.deletePrincipalVerificationResult(litlePrincipal.Id);
    	verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());
    	principal = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(1, principal.size());
    	riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
        System.assertEquals(0, riskIndicators.size());
    }    
    
    static testMethod void deleteBusinessOfKYC_NoRecord(){
		Litle_KYC__c litleKYC = new Litle_KYC__c();
    	insert litleKYC;
    	
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	List<Litle_Business__c> businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0,businesses.size());
    	ResetService service = new ResetService();
    	service.deleteBusinessOfKYC(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0,businesses.size());    	    	
    }
    
    static testMethod void deleteBusinessOfKYC_WithRecord_NoVerification(){
		Litle_KYC__c litleKYC = new Litle_KYC__c();
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
        litleBusiness.Litle_KYC__c = litleKYC.Id;
        insert litleBusiness;
        
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	List<Litle_Business__c> businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(1,businesses.size());
    	ResetService service = new ResetService();
    	service.deleteBusinessOfKYC(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0,businesses.size());    	    	
    }    
    
    static testMethod void deleteBusinessOfKYC_WithRecord_WithVerification(){
		Litle_KYC__c litleKYC = new Litle_KYC__c();
    	insert litleKYC;
    	
    	Litle_Business__c litleBusiness = new Litle_Business__c();
        litleBusiness.Litle_KYC__c = litleKYC.Id;
        insert litleBusiness;
        
        Litle_Verification_Result__c verification = new Litle_Verification_Result__c();
        verification.Address_Verified__c = 'test';
        verification.City_Verified__c = 'test';
        verification.Litle_Business__c = litleBusiness.Id;
        verification.Name_Address_Phone_Association_Code__c = 'test';
        verification.Name_Address_Phone_Association_Desc__c = 'test';
        verification.Name_Address_TaxId_Association_Code__c = 'test';
        verification.Name_Address_TaxId_Association_Desc__c = 'test';
        verification.Name_Verified__c = 'test';
        verification.Overall_Description__c = 'test';
        verification.Overall_Score__c = '12';
        verification.Phone_Verified__c = 'test';
        verification.TaxId_Verified__c = 'test';
        verification.Zip_Verified__c = 'test';
        insert verification; 
        
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	List<Litle_Business__c> businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(1,businesses.size());
        List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(1, verificationResults.size());    	
    	
    	ResetService service = new ResetService();
    	service.deleteBusinessOfKYC(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0,businesses.size());    	
		verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());    	    	
    }  
    
    static testMethod void deletePrincipalOfKYC_NoRecord(){
		Litle_KYC__c litleKYC = new Litle_KYC__c();
    	insert litleKYC;
    	
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	List<Litle_Principal__c> principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0,principales.size());
    	ResetService service = new ResetService();
    	service.deletePrincipalOfKYC(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0,principales.size());    	    	
    }
    
    static testMethod void deletePrincipalOfKYC_WithRecord_NoVerification(){
		Litle_KYC__c litleKYC = new Litle_KYC__c();
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
        litlePrincipal.Litle_KYC__c = litleKYC.Id;
        insert litlePrincipal;
        
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	List<Litle_Principal__c> principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(1,principales.size());
    	ResetService service = new ResetService();
    	service.deletePrincipalOfKYC(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0,principales.size());    	    	
    }    
    
    static testMethod void deletePrincipalOfKYC_WithRecord_WithVerification(){
		Litle_KYC__c litleKYC = new Litle_KYC__c();
    	insert litleKYC;
    	
    	Litle_Principal__c litlePrincipal = new Litle_Principal__c();
        litlePrincipal.Litle_KYC__c = litleKYC.Id;
        insert litlePrincipal;
        
        Litle_Verification_Result__c verification = new Litle_Verification_Result__c();
        verification.Address_Verified__c = 'test';
        verification.City_Verified__c = 'test';
        verification.Litle_Principal__c = litlePrincipal.Id;
        verification.Name_Address_Phone_Association_Code__c = 'test';
        verification.Name_Address_Phone_Association_Desc__c = 'test';
        verification.Name_Address_TaxId_Association_Code__c = 'test';
        verification.Name_Address_TaxId_Association_Desc__c = 'test';
        verification.Name_Verified__c = 'test';
        verification.Overall_Description__c = 'test';
        verification.Overall_Score__c = '12';
        verification.Phone_Verified__c = 'test';
        verification.TaxId_Verified__c = 'test';
        verification.Zip_Verified__c = 'test';
        insert verification; 
        
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	List<Litle_Principal__c> principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(1,principales.size());
        List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(1, verificationResults.size());    	
    	
    	ResetService service = new ResetService();
    	service.deletePrincipalOfKYC(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0,principales.size());    	
		verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());    	    	
    } 
    
    static testMethod void deleteAllLitleMappingsSaveLogs_NoRecord(){
    	List<LitleMappingsSaveLog__c> litleMappingsSaveLogs = [select Id, Name from LitleMappingsSaveLog__c];
    	System.assertEquals(0, litleMappingsSaveLogs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleMappingsSaveLogs();
    	litleMappingsSaveLogs = [select Id, Name from LitleMappingsSaveLog__c];
    	System.assertEquals(0, litleMappingsSaveLogs.size());
    }
    
    static testMethod void deleteAllLitleMappingsSaveLogs_WithRecord(){
    	LitleMappingsSaveLog__c litleMappingsSaveLog = new LitleMappingsSaveLog__c();
    	insert litleMappingsSaveLog;
    	List<LitleMappingsSaveLog__c> litleMappingsSaveLogs = [select Id, Name from LitleMappingsSaveLog__c];
    	System.assertEquals(1, litleMappingsSaveLogs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleMappingsSaveLogs();
    	litleMappingsSaveLogs = [select Id, Name from LitleMappingsSaveLog__c];
    	System.assertEquals(0, litleMappingsSaveLogs.size());
    }
    
    static testMethod void deleteAllLitleRequestResponseLog_NoRecord(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Account__c =:account.Id ];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleRequestResponseLogs();
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Account__c =:account.Id ];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    }
    
    static testMethod void deleteAllLitleRequestResponseLog_WithRecord(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	LitleRequestResponseLog__c litleMappingsSaveLog = new LitleRequestResponseLog__c();
    	litleMappingsSaveLog.Account__c = account.Id;
    	insert litleMappingsSaveLog;
    	
    	litleMappingsSaveLog = new LitleRequestResponseLog__c();
    	litleMappingsSaveLog.Opportunity__c = opportunity.Id;
    	insert litleMappingsSaveLog;
    	
    	List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c];
    	System.assertEquals(2, litleRequestResponseLogs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleRequestResponseLogs();
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Account__c =:account.Id];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Opportunity__c =:opportunity.Id];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    }
    
    static testMethod void deleteLitleRequestResponseLogOfOpportunity_NoRecord(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Opportunity__c =:opportunity.Id ];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleRequestResponseLogs();
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Opportunity__c =:opportunity.Id ];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    }
    
    static testMethod void deleteLitleRequestResponseLogOfOpportunity_WithRecord(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	LitleRequestResponseLog__c litleMappingsSaveLog = new LitleRequestResponseLog__c();
    	litleMappingsSaveLog.Account__c = account.Id;
    	insert litleMappingsSaveLog;
    	
    	litleMappingsSaveLog = new LitleRequestResponseLog__c();
    	litleMappingsSaveLog.Opportunity__c = opportunity.Id;
    	insert litleMappingsSaveLog;
    	
    	List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c];
    	System.assertEquals(2, litleRequestResponseLogs.size());
    	ResetService service = new ResetService();
    	service.deleteAllLitleRequestResponseLogs();
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Opportunity__c =:opportunity.Id];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Account__c =:account.Id];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    }
    
    static testMethod void deleteSalesforceMappingsObject_NoRecord(){
    	List<SalesforceLitleMappingsObject__c> mappingObjects = [select Id, Name from SalesforceLitleMappingsObject__c];
    	System.assertEquals(0, mappingObjects.size());
    	ResetService service = new ResetService();
    	service.deleteAllSalesforceLitleMappingsObjects();
    	mappingObjects = [select Id, Name from SalesforceLitleMappingsObject__c];
    	System.assertEquals(0, mappingObjects.size());
    }
    
    static testMethod void deleteSalesforceMappingsObject_OneRecord(){
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.LitleEnvironment__c = 'CERT';
    	insert mappingObject;
    	List<SalesforceLitleMappingsObject__c> mappingObjects = [select Id, Name from SalesforceLitleMappingsObject__c];
    	System.assertEquals(1, mappingObjects.size());
    	ResetService service = new ResetService();
    	service.deleteAllSalesforceLitleMappingsObjects();
    	mappingObjects = [select Id, Name from SalesforceLitleMappingsObject__c];
    	System.assertEquals(0, mappingObjects.size());
    }
    
    static testMethod void deleteAllCasesOfAccount_NoCaseRecords(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	List<Account> accounts = [select Id from Account];
    	System.assertEquals(1, accounts.size());
    	List<Case> cases = [select Id from Case];
    	System.assertEquals(0, cases.size());
    	ResetService service = new ResetService();
    	service.deleteAllCasesOfAccount(account.Id);
    	cases = [select Id from Case];
    	System.assertEquals(0, cases.size());
    	accounts = [select Id from Account];
    	System.assertEquals(1, accounts.size());
    }
    
    static testMethod void deleteAllCasesOfAccount_TwoCaseRecords(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Case case1 = new Case(AccountId = account.Id);
    	insert case1;
    	Case case2 = new Case(AccountId = account.Id);
    	insert case2;
    	List<Account> accounts = [select Id from Account];
    	System.assertEquals(1, accounts.size());
    	List<Case> cases = [select Id from Case];
    	System.assertEquals(2, cases.size());
    	ResetService service = new ResetService();
    	service.deleteAllCasesOfAccount(account.Id);
    	cases = [select Id from Case];
    	System.assertEquals(0, cases.size());
    	accounts = [select Id from Account];
    	System.assertEquals(1, accounts.size());
    }
    
    static testMethod void deleteAllAccounts_NoAccount(){
    	ResetService service = new ResetService();
    	service.deleteAllAccounts();
    	List<Account> accounts = [Select Id From Account];
    	System.assertEquals(0, accounts.size());
    }
    
    static testMethod void deleteAllAccounts_TwoAccount(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	account = new Account(name=ACCOUNT_NAME+'1');
    	insert account;
    	List<Account> accounts = [Select Id From Account];
    	System.assertEquals(2, accounts.size());
    	ResetService service = new ResetService();
    	service.deleteAllAccounts();
    	accounts = [Select Id From Account];
    	System.assertEquals(0, accounts.size());
    }
    
    static testMethod void createDefaultAccount(){
    	ResetService service = new ResetService();
    	service.createDefaultAccount();
    	List<Account> accounts = [Select a.PayFac_Portal_Link__c, 
    								a.Litle_MID__c, a.Website, a.Type, 
    								a.TickerSymbol, a.Sic, a.ShippingStreet, 
    								a.ShippingState, a.ShippingPostalCode, 
    								a.Ownership, a.Rating, 
    								a.ShippingCountry, a.ShippingCity, a.Description,  a.Phone,
    								a.Name, a.Industry, a.Id, a.Fax, 
    								a.BillingStreet, a.BillingState, a.BillingPostalCode, 
    								a.BillingCountry, a.BillingCity, a.AnnualRevenue 
								From Account a];
    	System.assertEquals(1, accounts.size());
    	System.assertEquals(null, accounts.get(0).PayFac_Portal_Link__c);
    	System.assertEquals(null, accounts.get(0).Litle_MID__c);
    	System.assertEquals('http://www.pyramid.com', accounts.get(0).Website);
    	System.assertEquals('Customer - Channel', accounts.get(0).Type);
    	System.assertEquals('PYR', accounts.get(0).TickerSymbol);
    	System.assertEquals('4253', accounts.get(0).Sic);
    	System.assertEquals('900 Chelmsford St', accounts.get(0).ShippingStreet);
    	System.assertEquals('MA', accounts.get(0).ShippingState);
    	System.assertEquals('Lowell', accounts.get(0).ShippingCity);
    	System.assertEquals('01851', accounts.get(0).ShippingPostalCode);
    	System.assertEquals('USA', accounts.get(0).ShippingCountry);
    	System.assertEquals('Private', accounts.get(0).Ownership);
    	System.assertEquals('Warm', accounts.get(0).Rating);
    	System.assertEquals('This is a demo Account', accounts.get(0).Description);
    	System.assertEquals('(014) 427-4427', accounts.get(0).Phone);
    	System.assertEquals('Pyramid Construction Inc', accounts.get(0).Name);
    	System.assertEquals('Construction', accounts.get(0).Industry);
    	System.assertEquals('(014) 427-4428', accounts.get(0).Fax);
    	System.assertEquals('900 Chelmsford St', accounts.get(0).BillingStreet);
    	System.assertEquals('MA', accounts.get(0).BillingState);
    	System.assertEquals('01851', accounts.get(0).BillingPostalCode);
    	System.assertEquals('USA', accounts.get(0).BillingCountry);
    	System.assertEquals('Lowell', accounts.get(0).BillingCity);
    	System.assertEquals(950000000, accounts.get(0).AnnualRevenue);    
    }
    
    static testMethod void deleteAllOpportunities_NoAccount(){
    	ResetService service = new ResetService();
    	service.deleteAllOpportunities();
    	List<Opportunity> opportunities = [Select Id, Name From Opportunity];
    	System.assertEquals(0, opportunities.size());
    }
    
    static testMethod void deleteAllOpportunities_TwoAccount(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Opportunity secondOpportunity = new Opportunity(name=OPPORTUNITY_NAME+'2', stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert secondOpportunity;
    	List<Opportunity> opportunities = [Select Id, Name From Opportunity a];
    	System.assertEquals(2, opportunities.size());
    	ResetService service = new ResetService();
    	service.deleteAllOpportunities();
    	opportunities = [Select Id, Name From Opportunity a];
    	System.assertEquals(0, opportunities.size());
    }
    
     static testMethod void createDefaultOpportunity(){
     	ResetService service = new ResetService();
    	service.createDefaultOpportunity();
    	List<Opportunity> opportunities = [Select o.PayFac_Portal_Link__c, o.Litle_MID__c, 
    							o.Type, o.StageName, o.Probability, o.Name, 
    							o.LeadSource, o.LastModifiedDate,  
    							o.Description, o.CloseDate
								From Opportunity o];
    	System.assertEquals(1, opportunities.size());
    	System.assertEquals(null, opportunities.get(0).PayFac_Portal_Link__c);
    	System.assertEquals(null, opportunities.get(0).Litle_MID__c);
    	System.assertEquals('New Customer', opportunities.get(0).Type);
    	System.assertEquals('Prospecting', opportunities.get(0).StageName);
    	System.assertEquals(10, opportunities.get(0).Probability);
    	System.assertEquals('Pyramid Construction Lowell Branch', opportunities.get(0).Name);
    	System.assertEquals('Web', opportunities.get(0).LeadSource);
    	System.assertEquals('This is a demo Opportunity', opportunities.get(0).Description);
    	System.assertEquals(Date.today(), opportunities.get(0).CloseDate);	
     }
     
     static testMethod void createDefaultOpportunityWithLinkedAccount(){
     	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
     	ResetService service = new ResetService();
    	service.createDefaultOpportunityWithLinkedAccount(account.Id);
    	List<Opportunity> opportunities = [Select o.AccountId, o.PayFac_Portal_Link__c, o.Litle_MID__c,
    							o.Type, o.StageName, o.Probability, o.Name, 
    							o.LeadSource, o.LastModifiedDate,  
    							o.Description, o.CloseDate
								From Opportunity o];
    	System.assertEquals(1, opportunities.size());
    	System.assertEquals(account.Id, opportunities.get(0).AccountId);
    	System.assertEquals(null, opportunities.get(0).PayFac_Portal_Link__c);
    	System.assertEquals(null, opportunities.get(0).Litle_MID__c);
    	System.assertEquals('New Customer', opportunities.get(0).Type);
    	System.assertEquals('Prospecting', opportunities.get(0).StageName);
    	System.assertEquals(10, opportunities.get(0).Probability);
    	System.assertEquals('Pyramid Construction Lowell Branch', opportunities.get(0).Name);
    	System.assertEquals('Web', opportunities.get(0).LeadSource);
    	System.assertEquals('This is a demo Opportunity', opportunities.get(0).Description);
    	System.assertEquals(Date.today(), opportunities.get(0).CloseDate);	
     }
     
      static testMethod void createDefaultOpportunityWithLinkedAccount_Ugly(){
     	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
     	ResetService service = new ResetService();
    	service.createDefaultOpportunityWithLinkedAccount(null);
    	List<Opportunity> opportunities = [Select o.AccountId, o.PayFac_Portal_Link__c, o.Litle_MID__c,
    							o.Type, o.StageName, o.Probability, o.Name, 
    							o.LeadSource, o.LastModifiedDate,  
    							o.Description, o.CloseDate
								From Opportunity o];
    	System.assertEquals(0, opportunities.size());
    	service.createDefaultOpportunityWithLinkedAccount('');
    	 opportunities = [Select o.AccountId, o.PayFac_Portal_Link__c, o.Litle_MID__c, 
    							o.Type, o.StageName, o.Probability, o.Name, 
    							o.LeadSource, o.LastModifiedDate,  
    							o.Description, o.CloseDate
								From Opportunity o];
    	System.assertEquals(0, opportunities.size());
    	service.createDefaultOpportunityWithLinkedAccount('123');
    	 opportunities = [Select o.AccountId, o.PayFac_Portal_Link__c, o.Litle_MID__c, 
    							o.Type, o.StageName, o.Probability, o.Name, 
    							o.LeadSource, o.LastModifiedDate,  
    							o.Description, o.CloseDate
								From Opportunity o];
    	System.assertEquals(0, opportunities.size());
     }
     
     static testMethod void createDefaultMapping(){
     	ResetService service = new ResetService();
    	service.createDefaultMapping();
    	List<SalesforceLitleMappingsObject__c> mapObjects = [select merchantUsername__c ,
																litleEnvironment__c ,
																subMerchantPspMerchantId__c ,
														        subMerchantPspMerchantIdX__c ,
																subMerchantMerchantName__c ,
														        subMerchantMerchantNameX__c ,
														        subMerchantMerchantCategoryCodeD__c ,
														        subMerchantMerchantCategoryCodeX__c ,
														        subMerchantHardCodeBillingDescriptor__c ,
														        subMerchantHardCodeBillingDescriptorX__c ,
																subMerchantCustomerServiceNumber__c ,
														        subMerchantCustomerServiceNumberX__c ,
																subMerchantMaxTransactionAmount__c ,
														        subMerchantMaxTransactionAmountX__c ,
																subMerchantStateProvince__c ,
														        subMerchantStateProvinceX__c ,
														        subMerchantStreetAddress1__c,
														        subMerchantStreetAddress1X__c ,
														        subMerchantCity__c,
														        subMerchantCityX__c ,
														        subMerchantCountryCode__c,
														        subMerchantCountryCodeX__c ,
														        subMerchantPostalCode__c,
														        subMerchantPostalCodeX__c ,
														        legalEntityStateProvince__c,
																legalEntityStateProvinceX__c ,
																legalEntityStreetAddress1__c,
																legalEntityStreetAddress1X__c ,
																legalEntityCity__c,
																legalEntityCityX__c ,
														        legalEntityPostalCode__c,
																legalEntityPostalCodeX__c ,
																legalEntityCountryCode__c,
																legalEntityCountryCodeX__c ,
																legalEntityPrincipalCity__c,
																legalEntityPrincipalCityX__c ,
																legalEntityPrincipalCountryCode__c,
																legalEntityPrincipalCountryCodeX__c ,
																legalEntityPrincipalPostalCode__c,
																legalEntityPrincipalPostalCodeX__c ,
														        legalEntityPrincipalStateProvince__c,
																legalEntityPrincipalStateProvinceX__c ,
																legalEntityPrincipalStreetAddress1__c,
																legalEntityPrincipalStreetAddress1X__c ,
																legalEntityContactPhone__c ,
																legalEntityContactPhoneX__c ,
																legalEntityName__c ,
																legalEntityNameX__c ,
																legalEntityTypeD__c ,
																legalEntityHasAcceptedCreditCardsD__c,
																legalEntityHasAcceptedCreditCardsX__c,
																legalEntityAnnualCreditCardSalesVolume__c ,
																legalEntityAnnualCreditCardSalesVolumeX__c ,
																legalEntityPrincipalContactPhone__c ,
																legalEntityPrincipalContactPhoneX__c ,
																legalEntityPrincipalFirstNameD__c ,
																legalEntityPrincipalFirstNameX__c ,
																legalEntityPrincipalLastNameD__c ,
																legalEntityPrincipalLastNameX__c ,
														        subMerchantFirstNameD__c ,
														        subMerchantFirstNameX__c ,
														        subMerchantLastNameD__c ,
														        subMerchantLastNameX__c ,
														        subMerchantPhone__c ,
														        subMerchantPhoneX__c,
														        subMerchantEmailAddressD__c,
														        subMerchantEmailAddressX__c 
														        from SalesforceLitleMappingsObject__c];
    	/////////////
    	//THE FOLLOWING ASSERTS HAVE ACTUAL AND EXPECTED FLIPPED 
    	System.assertEquals(mapObjects.get(0).merchantUsername__c , 'PSPXMLV8');
		System.assertEquals(mapObjects.get(0).litleEnvironment__c , 'CERT');
		//psp sub merchant id - mapped to sf field
		System.assertEquals(mapObjects.get(0).subMerchantPspMerchantId__c , 'Account.Industry');
        System.assertEquals(mapObjects.get(0).subMerchantPspMerchantIdX__c , true);
		//merchant name - mapped to account name
		System.assertEquals(mapObjects.get(0).subMerchantMerchantName__c , 'Account.Name');
        System.assertEquals(mapObjects.get(0).subMerchantMerchantNameX__c , true);
		//merchant category code mapped to default value
        System.assertEquals(mapObjects.get(0).subMerchantMerchantCategoryCodeD__c , '7997');
        System.assertEquals(mapObjects.get(0).subMerchantMerchantCategoryCodeX__c , false);
		//default billing descriptor mapped to default value
        System.assertEquals(mapObjects.get(0).subMerchantHardCodeBillingDescriptor__c , 'Account.Industry');
        System.assertEquals(mapObjects.get(0).subMerchantHardCodeBillingDescriptorX__c , true);
		//customer service number mapped to account phone number
		System.assertEquals(mapObjects.get(0).subMerchantCustomerServiceNumber__c , 'Account.Phone');
        System.assertEquals(mapObjects.get(0).subMerchantCustomerServiceNumberX__c , true);
		//Max transaction amount mapped to opportunity 
		System.assertEquals(mapObjects.get(0).subMerchantMaxTransactionAmount__c , 'Account.AnnualRevenue');
        System.assertEquals(mapObjects.get(0).subMerchantMaxTransactionAmountX__c , true);
		//addresses mapped to account address
		System.assertEquals(mapObjects.get(0).subMerchantStateProvince__c , 'Account.BillingState');
        System.assertEquals(mapObjects.get(0).subMerchantStateProvinceX__c , true);
        System.assertEquals(mapObjects.get(0).subMerchantStreetAddress1__c, 'Account.BillingStreet');
        System.assertEquals(mapObjects.get(0).subMerchantStreetAddress1X__c , true);
        System.assertEquals(mapObjects.get(0).subMerchantCity__c, 'Account.BillingCity');
        System.assertEquals(mapObjects.get(0).subMerchantCityX__c , true);
        System.assertEquals(mapObjects.get(0).subMerchantCountryCode__c, 'Account.BillingCountry');
        System.assertEquals(mapObjects.get(0).subMerchantCountryCodeX__c , true);
        System.assertEquals(mapObjects.get(0).subMerchantPostalCode__c, 'Account.BillingPostalCode');
        System.assertEquals(mapObjects.get(0).subMerchantPostalCodeX__c , true);
        
        System.assertEquals(mapObjects.get(0).legalEntityStateProvince__c, 'Account.BillingState');
		System.assertEquals(mapObjects.get(0).legalEntityStateProvinceX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityStreetAddress1__c, 'Account.BillingStreet');
		System.assertEquals(mapObjects.get(0).legalEntityStreetAddress1X__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityCity__c, 'Account.BillingCity');
		System.assertEquals(mapObjects.get(0).legalEntityCityX__c , true);
        System.assertEquals(mapObjects.get(0).legalEntityPostalCode__c, 'Account.BillingPostalCode');
		System.assertEquals(mapObjects.get(0).legalEntityPostalCodeX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityCountryCode__c, 'Account.BillingCountry');
		System.assertEquals(mapObjects.get(0).legalEntityCountryCodeX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityHasAcceptedCreditCardsD__c, 'false');
		System.assertEquals(mapObjects.get(0).legalEntityHasAcceptedCreditCardsX__c , false);
		
		
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalCity__c, 'Account.BillingCity');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalCityX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalCountryCode__c, 'Account.BillingCountry');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalCountryCodeX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalPostalCode__c, 'Account.BillingPostalCode');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalPostalCodeX__c , true);
        System.assertEquals(mapObjects.get(0).legalEntityPrincipalStateProvince__c, 'Account.BillingState');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalStateProvinceX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalStreetAddress1__c, 'Account.BillingStreet');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalStreetAddress1X__c , true);
		
		
		System.assertEquals(mapObjects.get(0).legalEntityContactPhone__c , 'Account.Phone');
		System.assertEquals(mapObjects.get(0).legalEntityContactPhoneX__c , true);
		//legal entity name mapped to opportunity name
		System.assertEquals(mapObjects.get(0).legalEntityName__c , 'Account.Name');
		System.assertEquals(mapObjects.get(0).legalEntityNameX__c , true);
		//type individual sole
		System.assertEquals(mapObjects.get(0).legalEntityTypeD__c , 'Individual Sole Proprietorship');
		//annual credit card sales volume mapped to AnnualRevenue
		System.assertEquals(mapObjects.get(0).legalEntityAnnualCreditCardSalesVolume__c , 'Account.AnnualRevenue');
		System.assertEquals(mapObjects.get(0).legalEntityAnnualCreditCardSalesVolumeX__c , true);
		//first name,last name, phone from account
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalContactPhone__c , 'Account.Phone');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalContactPhoneX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalFirstNameD__c , 'John');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalFirstNameX__c , false);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalLastNameD__c , 'Doe');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalLastNameX__c , false);
		
        System.assertEquals(mapObjects.get(0).subMerchantFirstNameD__c , 'John');
        System.assertEquals(mapObjects.get(0).subMerchantFirstNameX__c , false);
        System.assertEquals(mapObjects.get(0).subMerchantLastNameD__c , 'Doe');
        System.assertEquals(mapObjects.get(0).subMerchantLastNameX__c , false);
        System.assertEquals(mapObjects.get(0).subMerchantEmailAddressD__c , 'johnDoe@pyramid.com');
        System.assertEquals(mapObjects.get(0).subMerchantEmailAddressX__c , false);
        System.assertEquals(mapObjects.get(0).subMerchantPhone__c , 'Account.Phone');
        System.assertEquals(mapObjects.get(0).subMerchantPhoneX__c , true);
     }
        
}