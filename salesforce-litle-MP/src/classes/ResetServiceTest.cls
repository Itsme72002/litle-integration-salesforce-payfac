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
private class ResetServiceTest {
	public static final String ACCOUNT_NAME = 'Test Account';
	public static final String OPPORTUNITY_NAME = 'Test Opportunity';
	public static final String DEFAULT_STRING = 'Default String';
	public static final Date DEFAULT_DATE = Date.today();

    static testMethod void deleteKYCForAccount_NoKYCRecords(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	List<Litle_KYC__c> accountKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, accountKYCs.size());
    	ResetService service = new ResetService();
    	service.deleteLitleKYCForAccount(account.Id);
    	accountKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, accountKYCs.size());
    }
    
    static testMethod void deleteKYCForAccount_WithKYCRecord(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Litle_KYC__c litleKYC = new Litle_KYC__c();
    	litleKYC.Account__c = account.Id;
    	insert litleKYC;
    	List<Litle_KYC__c> accountKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1, accountKYCs.size());
    	ResetService service = new ResetService();
    	service.deleteLitleKYCForAccount(account.Id);
    	accountKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(0, accountKYCs.size());
    }
    
    static testMethod void deleteKYCForAccount_WithKYCDetails(){
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
    	service.deleteLitleKYCForAccount(account.Id);
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
    	service.deleteLitleKYCForOpportunity(opportunity.Id);
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
    	service.deleteLitleKYCForOpportunity(opportunity.Id);
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
    	service.deleteLitleKYCForOpportunity(opportunity.Id);
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
    
    static testMethod void deleteRiskIndicator_NoRecords(){
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
    	service.deleteRiskIndicator(verification.Id);
    	riskIndicators = [select Id, Name from Litle_Risk_Indicator__c];
        System.assertEquals(0, riskIndicators.size());
    }
    
    static testMethod void deleteRiskIndicator_MultipleRecords(){
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
    	service.deleteRiskIndicator(verification.Id);
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
    
    static testMethod void deleteBusiness_NoRecord(){
		Litle_KYC__c litleKYC = new Litle_KYC__c();
    	insert litleKYC;
    	
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	List<Litle_Business__c> businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0,businesses.size());
    	ResetService service = new ResetService();
    	service.deleteBusiness(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0,businesses.size());    	    	
    }
    
    static testMethod void deleteBusiness_WithRecord_NoVerification(){
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
    	service.deleteBusiness(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0,businesses.size());    	    	
    }    
    
    static testMethod void deleteBusiness_WithRecord_WithVerification(){
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
    	service.deleteBusiness(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	businesses = [select Id, Name from Litle_Business__c];
    	System.assertEquals(0,businesses.size());    	
		verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());    	    	
    }  
    
    static testMethod void deletePrincipal_NoRecord(){
		Litle_KYC__c litleKYC = new Litle_KYC__c();
    	insert litleKYC;
    	
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	List<Litle_Principal__c> principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0,principales.size());
    	ResetService service = new ResetService();
    	service.deletePrincipal(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0,principales.size());    	    	
    }
    
    static testMethod void deletePrincipal_WithRecord_NoVerification(){
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
    	service.deletePrincipal(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0,principales.size());    	    	
    }    
    
    static testMethod void deletePrincipal_WithRecord_WithVerification(){
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
    	service.deletePrincipal(litleKYC.Id);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
    	System.assertEquals(1,litleKYCs.size());
    	principales = [select Id, Name from Litle_Principal__c];
    	System.assertEquals(0,principales.size());    	
		verificationResults = [select Id, Name from Litle_Verification_Result__c];
    	System.assertEquals(0, verificationResults.size());    	    	
    } 
    
    static testMethod void deleteLitleMappingsSaveLog_NoRecord(){
    	List<LitleMappingsSaveLog__c> litleMappingsSaveLogs = [select Id, Name from LitleMappingsSaveLog__c];
    	System.assertEquals(0, litleMappingsSaveLogs.size());
    	ResetService service = new ResetService();
    	service.deleteLitleMappingsSaveLog();
    	litleMappingsSaveLogs = [select Id, Name from LitleMappingsSaveLog__c];
    	System.assertEquals(0, litleMappingsSaveLogs.size());
    }
    
    static testMethod void deleteLitleMappingsSaveLog_WithRecord(){
    	LitleMappingsSaveLog__c litleMappingsSaveLog = new LitleMappingsSaveLog__c();
    	insert litleMappingsSaveLog;
    	List<LitleMappingsSaveLog__c> litleMappingsSaveLogs = [select Id, Name from LitleMappingsSaveLog__c];
    	System.assertEquals(1, litleMappingsSaveLogs.size());
    	ResetService service = new ResetService();
    	service.deleteLitleMappingsSaveLog();
    	litleMappingsSaveLogs = [select Id, Name from LitleMappingsSaveLog__c];
    	System.assertEquals(0, litleMappingsSaveLogs.size());
    }
    
    static testMethod void deleteLitleRequestResponseLogOfAccount_NoRecord(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Account__c =:account.Id ];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    	ResetService service = new ResetService();
    	service.deleteLitleRequestResponseLogOfAccount(account.Id);
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Account__c =:account.Id ];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    }
    
    static testMethod void deleteLitleRequestResponseLogOfAccount_WithRecord(){
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
    	service.deleteLitleRequestResponseLogOfAccount(account.Id);
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Account__c =:account.Id];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Opportunity__c =:opportunity.Id];
    	System.assertEquals(1, litleRequestResponseLogs.size());
    }
    
    static testMethod void deleteLitleRequestResponseLogOfOpportunity_NoRecord(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	List<LitleRequestResponseLog__c> litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Opportunity__c =:opportunity.Id ];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    	ResetService service = new ResetService();
    	service.deleteLitleRequestResponseLogOfOpportunity(opportunity.Id);
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
    	service.deleteLitleRequestResponseLogOfOpportunity(opportunity.Id);
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Opportunity__c =:opportunity.Id];
    	System.assertEquals(0, litleRequestResponseLogs.size());
    	litleRequestResponseLogs = [select Id, Name from LitleRequestResponseLog__c where Account__c =:account.Id];
    	System.assertEquals(1, litleRequestResponseLogs.size());
    }
    
    static testMethod void deleteSalesforceMappingsObject_NoRecord(){
    	List<SalesforceLitleMappingsObject__c> mappingObjects = [select Id, Name from SalesforceLitleMappingsObject__c];
    	System.assertEquals(0, mappingObjects.size());
    	ResetService service = new ResetService();
    	service.deleteSalesforceLitleMappingsObject();
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
    	service.deleteSalesforceLitleMappingsObject();
    	mappingObjects = [select Id, Name from SalesforceLitleMappingsObject__c];
    	System.assertEquals(0, mappingObjects.size());
    }
    
    static testMethod void resetAccount_SingleAccountRecord(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	List<Account> accounts = [Select Id, Name From Account a];
    	System.assertEquals(1, accounts.size());
    	ResetService service = new ResetService();
    	service.resetAccount(account.Id);
    	accounts = [Select a.PayFac_Portal_Link__c, 
    								a.Litle_MID__c, a.Website, a.Type, 
    								a.TickerSymbol, a.Sic, a.ShippingStreet, 
    								a.ShippingState, a.ShippingPostalCode, 
    								a.ShippingCountry, a.ShippingCity, a.Description, a.Phone,
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
    	System.assertEquals('2 Place Jussieu', accounts.get(0).ShippingStreet);
    	System.assertEquals(null, accounts.get(0).ShippingState);
    	System.assertEquals('Paris', accounts.get(0).ShippingCity);
    	System.assertEquals('This is a demo Account', accounts.get(0).Description);
    	System.assertEquals('(014) 427-4427', accounts.get(0).Phone);
    	System.assertEquals('Pyramid Construction Inc', accounts.get(0).Name);
    	System.assertEquals('Construction', accounts.get(0).Industry);
    	System.assertEquals('(014) 427-4428', accounts.get(0).Fax);
    	System.assertEquals('2 Place Jussieu', accounts.get(0).BillingStreet);
    	System.assertEquals(null, accounts.get(0).BillingState);
    	System.assertEquals('75251', accounts.get(0).BillingPostalCode);
    	System.assertEquals('France', accounts.get(0).BillingCountry);
    	System.assertEquals('Paris', accounts.get(0).BillingCity);
    	System.assertEquals(950000000, accounts.get(0).AnnualRevenue);
    }
    
    static testMethod void resetAccount_TwoAccountRecords(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	Account secondAccount = new Account(name=ACCOUNT_NAME);
    	insert secondAccount;
    	
    	List<Account> accounts = [Select Id, Name From Account a];
    	System.assertEquals(2, accounts.size());
    	ResetService service = new ResetService();
    	service.resetAccount(account.Id);
    	accounts = [Select a.PayFac_Portal_Link__c, 
    								a.Litle_MID__c, a.Website, a.Type, 
    								a.TickerSymbol, a.Sic, a.ShippingStreet, 
    								a.ShippingState, a.ShippingPostalCode, 
    								a.ShippingCountry, a.ShippingCity, a.Description,  a.Phone,
    								a.Name, a.Industry, a.Id, a.Fax, 
    								a.BillingStreet, a.BillingState, a.BillingPostalCode, 
    								a.BillingCountry, a.BillingCity, a.AnnualRevenue 
								From Account a];
    	System.assertEquals(1, accounts.size());
    	System.assertEquals(account.ID, accounts.get(0).Id);
    	System.assertEquals(null, accounts.get(0).PayFac_Portal_Link__c);
    	System.assertEquals(null, accounts.get(0).Litle_MID__c);
    	System.assertEquals('http://www.pyramid.com', accounts.get(0).Website);
    	System.assertEquals('Customer - Channel', accounts.get(0).Type);
    	System.assertEquals('PYR', accounts.get(0).TickerSymbol);
    	System.assertEquals('4253', accounts.get(0).Sic);
    	System.assertEquals('2 Place Jussieu', accounts.get(0).ShippingStreet);
    	System.assertEquals(null, accounts.get(0).ShippingState);
    	System.assertEquals('Paris', accounts.get(0).ShippingCity);
    	System.assertEquals('This is a demo Account', accounts.get(0).Description);
    	System.assertEquals('(014) 427-4427', accounts.get(0).Phone);
    	System.assertEquals('Pyramid Construction Inc', accounts.get(0).Name);
    	System.assertEquals('Construction', accounts.get(0).Industry);
    	System.assertEquals('(014) 427-4428', accounts.get(0).Fax);
    	System.assertEquals('2 Place Jussieu', accounts.get(0).BillingStreet);
    	System.assertEquals(null, accounts.get(0).BillingState);
    	System.assertEquals('75251', accounts.get(0).BillingPostalCode);
    	System.assertEquals('France', accounts.get(0).BillingCountry);
    	System.assertEquals('Paris', accounts.get(0).BillingCity);
    	System.assertEquals(950000000, accounts.get(0).AnnualRevenue);    	
    }
    
    static testMethod void resetOpportunity_SingleOpportunityRecord(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	List<Opportunity> opportunities = [Select Id, Name From Opportunity a];
    	System.assertEquals(1, opportunities.size());
    	ResetService service = new ResetService();
    	service.resetOpportunity(opportunity.Id);
    	opportunities = [Select o.PayFac_Portal_Link__c, o.Litle_MID__c, o.DeliveryInstallationStatus__c,
    							o.Type, o.StageName, o.Probability, o.Name, 
    							o.LeadSource, o.LastModifiedDate, 
    							o.Description, o.CloseDate
								From Opportunity o];
    	System.assertEquals(1, opportunities.size());
    	System.assertEquals(null, opportunities.get(0).PayFac_Portal_Link__c);
    	System.assertEquals(null, opportunities.get(0).Litle_MID__c);
    	System.assertEquals('In progress', opportunities.get(0).DeliveryInstallationStatus__c);
    	System.assertEquals('New Customer', opportunities.get(0).Type);
    	System.assertEquals('Prospecting', opportunities.get(0).StageName);
    	System.assertEquals(10, opportunities.get(0).Probability);
    	System.assertEquals('Pyramid Construction Lowell Branch', opportunities.get(0).Name);
    	System.assertEquals('Web', opportunities.get(0).LeadSource);
    	System.assertEquals('This is a demo Opportunity', opportunities.get(0).Description);
    	System.assertEquals(Date.today(), opportunities.get(0).CloseDate);
    }
    
    static testMethod void resetOpportunity_TwoOpportunityRecords(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	Opportunity secondOpportunity = new Opportunity(name=OPPORTUNITY_NAME+'2', stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert secondOpportunity;
    	
    	List<Opportunity> opportunities = [Select Id, Name From Opportunity a];
    	System.assertEquals(2, opportunities.size());
    	ResetService service = new ResetService();
    	service.resetOpportunity(opportunity.Id);
    	opportunities = [Select o.PayFac_Portal_Link__c, o.Litle_MID__c, o.DeliveryInstallationStatus__c,
    							o.Type, o.StageName, o.Probability, o.Name, 
    							o.LeadSource, o.LastModifiedDate,  
    							o.Description, o.CloseDate
								From Opportunity o];
    	System.assertEquals(1, opportunities.size());
    	System.assertEquals(null, opportunities.get(0).PayFac_Portal_Link__c);
    	System.assertEquals(null, opportunities.get(0).Litle_MID__c);
    	System.assertEquals('In progress', opportunities.get(0).DeliveryInstallationStatus__c);
    	System.assertEquals('New Customer', opportunities.get(0).Type);
    	System.assertEquals('Prospecting', opportunities.get(0).StageName);
    	System.assertEquals(10, opportunities.get(0).Probability);
    	System.assertEquals('Pyramid Construction Lowell Branch', opportunities.get(0).Name);
    	System.assertEquals('Web', opportunities.get(0).LeadSource);
    	System.assertEquals('This is a demo Opportunity', opportunities.get(0).Description);
    	System.assertEquals(Date.today(), opportunities.get(0).CloseDate);	
    }
        
}