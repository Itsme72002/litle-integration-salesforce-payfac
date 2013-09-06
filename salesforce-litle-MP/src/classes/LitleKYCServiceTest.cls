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
private class LitleKYCServiceTest {

    public static final String ACCOUNT_NAME = 'Test Account';
    public static final String OPPORTUNITY_NAME = 'Test Opportunity';
    public static final String DEFAULT_STRING = 'ab';
    public static final Date DEFAULT_DATE = Date.today();

    static testMethod void testKYCSaveInAccount_NoPreviousRecords() {
        // TO DO: implement unit test
        Account account = new Account(name=ACCOUNT_NAME);
        insert account;
        List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:account.Id];
        System.assertEquals(0, litleKYCs.size());
        LegalEntityResponse leResponse = mockLegalEntityResponse(DEFAULT_STRING, 2);
        
        LitleKYCService litleService = new LitleKYCService();
        litleService.saveOrUpdateAllKYCObjects(null, account.Id, leResponse);
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:account.Id];
        System.assertEquals(1, litleKYCs.size());
        //check business
        List<Litle_Business__c> litleBusiness = [select Id, Name 
                                                from Litle_Business__c 
                                                where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litleBusiness.size());
        //check business verification
        List<Litle_Verification_Result__c> businessVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Business__c =:litleBusiness.get(0).Id];
        System.assertEquals(1, businessVResults.size());
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Address_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).City_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Litle_Principal__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Overall_Description__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Overall_Score__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Phone_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).TaxId_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Zip_Verified__c);
        
        //check business risk indicators
        List<Litle_Risk_Indicator__c> businessRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:businessVResults.get(0).Id];
        System.assertEquals(2, businessRisks.size());   
        System.assertEquals(DEFAULT_STRING, businessRisks.get(0).Code__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(0).Description__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(1).Code__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(1).Description__c);   
                                                
        List<Litle_Principal__c> litlePrincipal = [select First_Name__c, Last_Name__c, Principal_Id__c, Id, Name 
                                                  from Litle_Principal__c 
                                                  where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litlePrincipal.size());
        //check principal verification
        List<Litle_Verification_Result__c> principalVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Principal__c =:litlePrincipal.get(0).Id];
        System.assertEquals(1, principalVResults.size());
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Address_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).City_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Litle_Business__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Overall_Description__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Overall_Score__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Phone_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).TaxId_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Zip_Verified__c);
        
        //check principal risk indicators
        List<Litle_Risk_Indicator__c> principalRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:principalVResults.get(0).Id];
        System.assertEquals(2, principalRisks.size());  
        System.assertEquals(DEFAULT_STRING, principalRisks.get(0).Code__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(0).Description__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(1).Code__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(1).Description__c);
    }
    
    static testMethod void testKYCSaveInAccount_OnePreviousRecords() {
        //setup custom objects
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
        
        
        List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:account.Id];
        System.assertEquals(1, litleKYCs.size());
        LegalEntityResponse leResponse = mockLegalEntityResponse(DEFAULT_STRING, 2);
        
        LitleKYCService litleService = new LitleKYCService();
        litleService.saveOrUpdateAllKYCObjects(null, account.Id, leResponse);
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:account.Id];
        System.assertEquals(1, litleKYCs.size());
        //check business
        List<Litle_Business__c> litleBusinesses = [select Id, Name 
                                                from Litle_Business__c 
                                                where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litleBusinesses.size());
        //check business verification
        List<Litle_Verification_Result__c> businessVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Business__c =:litleBusinesses.get(0).Id];
        System.assertEquals(1, businessVResults.size());
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Address_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).City_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Litle_Principal__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Overall_Description__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Overall_Score__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Phone_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).TaxId_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Zip_Verified__c);
        
        //check business risk indicators
        List<Litle_Risk_Indicator__c> businessRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:businessVResults.get(0).Id];
        System.assertEquals(2, businessRisks.size());   
        System.assertEquals(DEFAULT_STRING, businessRisks.get(0).Code__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(0).Description__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(1).Code__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(1).Description__c);   
                                                
        List<Litle_Principal__c> litlePrincipals = [select First_Name__c, Last_Name__c, Principal_Id__c, Id, Name 
                                                  from Litle_Principal__c 
                                                  where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litlePrincipals.size());
        //check principal verification
        List<Litle_Verification_Result__c> principalVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Principal__c =:litlePrincipals.get(0).Id];
        System.assertEquals(1, principalVResults.size());
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Address_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).City_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Litle_Business__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Overall_Description__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Overall_Score__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Phone_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).TaxId_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Zip_Verified__c);
        
        //check principal risk indicators
        List<Litle_Risk_Indicator__c> principalRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:principalVResults.get(0).Id];
        System.assertEquals(2, principalRisks.size());  
        System.assertEquals(DEFAULT_STRING, principalRisks.get(0).Code__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(0).Description__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(1).Code__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(1).Description__c);
    }
    
    static testMethod void testKYCSaveInAccount_BlankResponse(){
        Account account = new Account(name=ACCOUNT_NAME);
        insert account;
        List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:account.Id];
        System.assertEquals(0, litleKYCs.size());
        LegalEntityResponse leResponse = new LegalEntityResponse();
        
        LitleKYCService litleService = new LitleKYCService();
        litleService.saveOrUpdateAllKYCObjects(null, account.Id, leResponse);
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:account.Id];
        System.assertEquals(1, litleKYCs.size());
        //check business
        List<Litle_Business__c> litleBusiness = [select Id, Name 
                                                from Litle_Business__c 
                                                where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litleBusiness.size());
        //check business verification
        List<Litle_Verification_Result__c> businessVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Business__c =:litleBusiness.get(0).Id];
        System.assertEquals(1, businessVResults.size());
        System.assertEquals(null, businessVResults.get(0).Address_Verified__c);
        System.assertEquals(null, businessVResults.get(0).City_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Litle_Principal__c);
        System.assertEquals(null, businessVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(null, businessVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(null, businessVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(null, businessVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(null, businessVResults.get(0).Name_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Overall_Description__c);
        System.assertEquals(null, businessVResults.get(0).Overall_Score__c);
        System.assertEquals(null, businessVResults.get(0).Phone_Verified__c);
        System.assertEquals(null, businessVResults.get(0).TaxId_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Zip_Verified__c);
        
        //check business risk indicators
        List<Litle_Risk_Indicator__c> businessRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:businessVResults.get(0).Id];
        System.assertEquals(0, businessRisks.size());   
                                                
        List<Litle_Principal__c> litlePrincipal = [select First_Name__c, Last_Name__c, Principal_Id__c, Id, Name 
                                                  from Litle_Principal__c 
                                                  where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litlePrincipal.size());
        //check principal verification
        List<Litle_Verification_Result__c> principalVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Principal__c =:litlePrincipal.get(0).Id];
        System.assertEquals(1, principalVResults.size());
        System.assertEquals(null, principalVResults.get(0).Address_Verified__c);
        System.assertEquals(null, principalVResults.get(0).City_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Litle_Business__c);
        System.assertEquals(null, principalVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(null, principalVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(null, principalVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(null, principalVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(null, principalVResults.get(0).Name_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Overall_Description__c);
        System.assertEquals(null, principalVResults.get(0).Overall_Score__c);
        System.assertEquals(null, principalVResults.get(0).Phone_Verified__c);
        System.assertEquals(null, principalVResults.get(0).TaxId_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Zip_Verified__c);
        
        //check principal risk indicators
        List<Litle_Risk_Indicator__c> principalRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:principalVResults.get(0).Id];
        System.assertEquals(0, principalRisks.size());  
    }
    
    static testMethod void testKYCSaveInAccount_NullResponse(){
        Account account = new Account(name=ACCOUNT_NAME);
        insert account;
        List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:account.Id];
        System.assertEquals(0, litleKYCs.size());
        LitleKYCService litleService = new LitleKYCService();
        litleService.saveOrUpdateAllKYCObjects(null, account.Id, null);
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:account.Id];
        System.assertEquals(0, litleKYCs.size());
        
        litleService.saveOrUpdateAllKYCObjects(null, null, new LegalEntityResponse());
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:account.Id];
        System.assertEquals(0, litleKYCs.size());
    }
    
    static testMethod void testKYCSaveInOpportunity_NoPreviousRecords() {
        // TO DO: implement unit test
        Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
        insert opportunity;
        List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunity.Id];
        System.assertEquals(0, litleKYCs.size());
        LegalEntityResponse leResponse = mockLegalEntityResponse(DEFAULT_STRING, 2);
        
        LitleKYCService litleService = new LitleKYCService();
        litleService.saveOrUpdateAllKYCObjects(opportunity.Id,null, leResponse);
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunity.Id];
        System.assertEquals(1, litleKYCs.size());
        //check business
        List<Litle_Business__c> litleBusiness = [select Id, Name 
                                                from Litle_Business__c 
                                                where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litleBusiness.size());
        //check business verification
        List<Litle_Verification_Result__c> businessVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Business__c =:litleBusiness.get(0).Id];
        System.assertEquals(1, businessVResults.size());
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Address_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).City_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Litle_Principal__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Overall_Description__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Overall_Score__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Phone_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).TaxId_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Zip_Verified__c);
        
        //check business risk indicators
        List<Litle_Risk_Indicator__c> businessRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:businessVResults.get(0).Id];
        System.assertEquals(2, businessRisks.size());   
        System.assertEquals(DEFAULT_STRING, businessRisks.get(0).Code__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(0).Description__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(1).Code__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(1).Description__c);   
                                                
        List<Litle_Principal__c> litlePrincipal = [select First_Name__c, Last_Name__c, Principal_Id__c, Id, Name 
                                                  from Litle_Principal__c 
                                                  where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litlePrincipal.size());
        //check principal verification
        List<Litle_Verification_Result__c> principalVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Principal__c =:litlePrincipal.get(0).Id];
        System.assertEquals(1, principalVResults.size());
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Address_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).City_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Litle_Business__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Overall_Description__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Overall_Score__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Phone_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).TaxId_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Zip_Verified__c);
        
        //check principal risk indicators
        List<Litle_Risk_Indicator__c> principalRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:principalVResults.get(0).Id];
        System.assertEquals(2, principalRisks.size());  
        System.assertEquals(DEFAULT_STRING, principalRisks.get(0).Code__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(0).Description__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(1).Code__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(1).Description__c);
    }
    
    static testMethod void testKYCSaveInOpportunity_OnePreviousRecords() {
        //setup custom objects
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
        
        
        List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunity.Id];
        System.assertEquals(1, litleKYCs.size());
        LegalEntityResponse leResponse = mockLegalEntityResponse(DEFAULT_STRING, 2);
        
        LitleKYCService litleService = new LitleKYCService();
        litleService.saveOrUpdateAllKYCObjects(opportunity.Id,null, leResponse);
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunity.Id];
        System.assertEquals(1, litleKYCs.size());
        //check business
        List<Litle_Business__c> litleBusinesses = [select Id, Name 
                                                from Litle_Business__c 
                                                where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litleBusinesses.size());
        //check business verification
        List<Litle_Verification_Result__c> businessVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Business__c =:litleBusinesses.get(0).Id];
        System.assertEquals(1, businessVResults.size());
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Address_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).City_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Litle_Principal__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Name_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Overall_Description__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Overall_Score__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Phone_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).TaxId_Verified__c);
        System.assertEquals(DEFAULT_STRING, businessVResults.get(0).Zip_Verified__c);
        
        //check business risk indicators
        List<Litle_Risk_Indicator__c> businessRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:businessVResults.get(0).Id];
        System.assertEquals(2, businessRisks.size());   
        System.assertEquals(DEFAULT_STRING, businessRisks.get(0).Code__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(0).Description__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(1).Code__c);
        System.assertEquals(DEFAULT_STRING, businessRisks.get(1).Description__c);   
                                                
        List<Litle_Principal__c> litlePrincipals = [select First_Name__c, Last_Name__c, Principal_Id__c, Id, Name 
                                                  from Litle_Principal__c 
                                                  where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litlePrincipals.size());
        //check principal verification
        List<Litle_Verification_Result__c> principalVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Principal__c =:litlePrincipals.get(0).Id];
        System.assertEquals(1, principalVResults.size());
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Address_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).City_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Litle_Business__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Name_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Overall_Description__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Overall_Score__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Phone_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).TaxId_Verified__c);
        System.assertEquals(DEFAULT_STRING, principalVResults.get(0).Zip_Verified__c);
        
        //check principal risk indicators
        List<Litle_Risk_Indicator__c> principalRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:principalVResults.get(0).Id];
        System.assertEquals(2, principalRisks.size());  
        System.assertEquals(DEFAULT_STRING, principalRisks.get(0).Code__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(0).Description__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(1).Code__c);
        System.assertEquals(DEFAULT_STRING, principalRisks.get(1).Description__c);
    }
    
    static testMethod void testKYCSaveInOpportunity_BlankResponse(){
        Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
        insert opportunity;
        List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunity.Id];
        System.assertEquals(0, litleKYCs.size());
        LegalEntityResponse leResponse = new LegalEntityResponse();
        
        LitleKYCService litleService = new LitleKYCService();
        litleService.saveOrUpdateAllKYCObjects(opportunity.Id,null, leResponse);
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunity.Id];
        System.assertEquals(1, litleKYCs.size());
        //check business
        List<Litle_Business__c> litleBusiness = [select Id, Name 
                                                from Litle_Business__c 
                                                where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litleBusiness.size());
        //check business verification
        List<Litle_Verification_Result__c> businessVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Business__c =:litleBusiness.get(0).Id];
        System.assertEquals(1, businessVResults.size());
        System.assertEquals(null, businessVResults.get(0).Address_Verified__c);
        System.assertEquals(null, businessVResults.get(0).City_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Litle_Principal__c);
        System.assertEquals(null, businessVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(null, businessVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(null, businessVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(null, businessVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(null, businessVResults.get(0).Name_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Overall_Description__c);
        System.assertEquals(null, businessVResults.get(0).Overall_Score__c);
        System.assertEquals(null, businessVResults.get(0).Phone_Verified__c);
        System.assertEquals(null, businessVResults.get(0).TaxId_Verified__c);
        System.assertEquals(null, businessVResults.get(0).Zip_Verified__c);
        
        //check business risk indicators
        List<Litle_Risk_Indicator__c> businessRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:businessVResults.get(0).Id];
        System.assertEquals(0, businessRisks.size());   
                                                
        List<Litle_Principal__c> litlePrincipal = [select First_Name__c, Last_Name__c, Principal_Id__c, Id, Name 
                                                  from Litle_Principal__c 
                                                  where Litle_KYC__c =:litleKYCs.get(0).Id];
        System.assertEquals(1, litlePrincipal.size());
        //check principal verification
        List<Litle_Verification_Result__c> principalVResults = [select Address_Verified__c,
                                                            City_Verified__c,
                                                            Litle_Business__c,
                                                            Litle_Principal__c,
                                                            Name_Address_Phone_Association_Code__c,
                                                            Name_Address_Phone_Association_Desc__c,
                                                            Name_Address_TaxId_Association_Code__c,
                                                            Name_Address_TaxId_Association_Desc__c,
                                                            Name_Verified__c,
                                                            Overall_Description__c,
                                                            Overall_Score__c,
                                                            Phone_Verified__c,
                                                            TaxId_Verified__c,
                                                            Zip_Verified__c 
                                                            from Litle_Verification_Result__c 
                                                            where Litle_Principal__c =:litlePrincipal.get(0).Id];
        System.assertEquals(1, principalVResults.size());
        System.assertEquals(null, principalVResults.get(0).Address_Verified__c);
        System.assertEquals(null, principalVResults.get(0).City_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Litle_Business__c);
        System.assertEquals(null, principalVResults.get(0).Name_Address_Phone_Association_Code__c);
        System.assertEquals(null, principalVResults.get(0).Name_Address_Phone_Association_Desc__c);
        System.assertEquals(null, principalVResults.get(0).Name_Address_TaxId_Association_Code__c);
        System.assertEquals(null, principalVResults.get(0).Name_Address_TaxId_Association_Desc__c);
        System.assertEquals(null, principalVResults.get(0).Name_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Overall_Description__c);
        System.assertEquals(null, principalVResults.get(0).Overall_Score__c);
        System.assertEquals(null, principalVResults.get(0).Phone_Verified__c);
        System.assertEquals(null, principalVResults.get(0).TaxId_Verified__c);
        System.assertEquals(null, principalVResults.get(0).Zip_Verified__c);
        
        //check principal risk indicators
        List<Litle_Risk_Indicator__c> principalRisks = [select Code__c, Description__c 
                                                        from Litle_Risk_Indicator__c 
                                                        where Litle_Verification_Result__c =:principalVResults.get(0).Id];
        System.assertEquals(0, principalRisks.size());  
    }
    
    static testMethod void testKYCSaveInOpportunity_NullResponse(){
        Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
        insert opportunity;
        List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunity.Id];
        System.assertEquals(0, litleKYCs.size());
        LitleKYCService litleService = new LitleKYCService();
        litleService.saveOrUpdateAllKYCObjects(opportunity.Id,null, null);
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunity.Id];
        System.assertEquals(0, litleKYCs.size());
        
        litleService.saveOrUpdateAllKYCObjects(null, null, new LegalEntityResponse());
        
        //check kyc
        litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunity.Id];
        System.assertEquals(0, litleKYCs.size());
    }
    
    static LegalEntityResponse mockLegalEntityResponse(String defaultValue, Integer risks){
        LegalEntityResponse lr = new LegalEntityResponse();
        lr.getResponsePrincipal().setPrincipalId(defaultValue);
        lr.getResponsePrincipal().setFirstName(defaultValue);
        lr.getResponsePrincipal().setLastName(defaultValue);
        lr.getBusinessVerificationResult().getOverallScore().setCodeOrScore(defaultValue);
        lr.getBusinessVerificationResult().getOverallScore().setDescription(defaultValue);
        lr.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().setCodeOrScore(defaultValue);
        lr.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().setDescription(defaultValue);
        lr.getBusinessVerificationResult().getNameAddressPhoneAssociation().setCodeOrScore(defaultValue);
        lr.getBusinessVerificationResult().getNameAddressPhoneAssociation().setDescription(defaultValue);
        lr.getBusinessVerificationResult().getVerificationIndicator().setAddressVerified(defaultValue);
        lr.getBusinessVerificationResult().getVerificationIndicator().setCityVerified(defaultValue);
        lr.getBusinessVerificationResult().getVerificationIndicator().setNameVerified(defaultValue);
        lr.getBusinessVerificationResult().getVerificationIndicator().setTaxIdVerified(defaultValue);
        lr.getBusinessVerificationResult().getVerificationIndicator().setPhoneVerified(defaultValue);
        lr.getBusinessVerificationResult().getVerificationIndicator().setSsnVerified(defaultValue);
        lr.getBusinessVerificationResult().getVerificationIndicator().setDobVerified(defaultValue);
        lr.getBusinessVerificationResult().getVerificationIndicator().setZipVerified(defaultValue);
        Integer counter = risks;
        while(counter != 0){
            DescriptionDetails details = new DescriptionDetails();
            details.setCodeOrScore(defaultValue);
            details.setDescription(defaultValue);
            lr.getBusinessVerificationResult().getRiskIndicators().add(details);
            counter--;
        }
        
        lr.getPrincipalVerificationResult().getOverallScore().setCodeOrScore(defaultValue);
        lr.getPrincipalVerificationResult().getOverallScore().setDescription(defaultValue);
        lr.getPrincipalVerificationResult().getNameAddressTaxOrSsnIdAssociation().setCodeOrScore(defaultValue);
        lr.getPrincipalVerificationResult().getNameAddressTaxOrSsnIdAssociation().setDescription(defaultValue);
        lr.getPrincipalVerificationResult().getNameAddressPhoneAssociation().setCodeOrScore(defaultValue);
        lr.getPrincipalVerificationResult().getNameAddressPhoneAssociation().setDescription(defaultValue);
        lr.getPrincipalVerificationResult().getVerificationIndicator().setAddressVerified(defaultValue);
        lr.getPrincipalVerificationResult().getVerificationIndicator().setCityVerified(defaultValue);
        lr.getPrincipalVerificationResult().getVerificationIndicator().setNameVerified(defaultValue);
        lr.getPrincipalVerificationResult().getVerificationIndicator().setTaxIdVerified(defaultValue);
        lr.getPrincipalVerificationResult().getVerificationIndicator().setPhoneVerified(defaultValue);
        lr.getPrincipalVerificationResult().getVerificationIndicator().setSsnVerified(defaultValue);
        lr.getPrincipalVerificationResult().getVerificationIndicator().setDobVerified(defaultValue);
        lr.getPrincipalVerificationResult().getVerificationIndicator().setZipVerified(defaultValue);
        counter = risks;
        while(counter != 0){
            DescriptionDetails details = new DescriptionDetails();
            details.setCodeOrScore(defaultValue);
            details.setDescription(defaultValue);
            lr.getPrincipalVerificationResult().getRiskIndicators().add(details);
            counter--;
        }
        return lr;
    }
    
    static testMethod void fetchKycForAccountFromMP_NoAccount(){
    	LitleKYCService litleKYCService = new LitleKYCService();
    	List<litleRequestResponseLog__c> kyclog = [select Id, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size());
    	litleKYCService.fetchKycForAccountFromMP(null);
    	kyclog = [select Id, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size());
    }
    
    static testMethod void fetchKycForAccountFromMP_NoLitleLegalEntity(){
    	LitleKYCService litleKYCService = new LitleKYCService();
 		Account account = new Account(name=ACCOUNT_NAME);
        insert account;
    	List<litleRequestResponseLog__c> kyclog = [select Id, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size());
    	litleKYCService.fetchKycForAccountFromMP(account);
    	kyclog = [select Id, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size());
    }
    
    
    static testMethod void fetchKycForAccountFromMP_NoMapping(){
    	LitleKYCService litleKYCService = new LitleKYCService();
 		Account account = new Account(name=ACCOUNT_NAME, LitleLegalEntityId__c = 'testLitleLegalEntityId__c');
        insert account;
    	List<litleRequestResponseLog__c> kyclog = [select Id, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size());
        try{
     		litleKYCService.fetchKycForAccountFromMP(account);       	
        }catch(Exception e){
        	System.assertEquals('No Mapping record present.',e.getMessage());
        }
        kyclog = [select Id, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size());
    }
    
    static testMethod void fetchKycForAccountFromMP_NoUsernameInMapping(){
    	LitleKYCService litleKYCService = new LitleKYCService();
 		Account account = new Account(name=ACCOUNT_NAME, LitleLegalEntityId__c = 'testLitleLegalEntityId__c');
        insert account;
        SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
        mappingObject.LitleEnvironment__c = 'CERT';
        insert mappingObject;
		List<litleRequestResponseLog__c> kyclog = [select Id, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size());        
        try{
     		litleKYCService.fetchKycForAccountFromMP(account);       	
        }catch(Exception e){
        	System.assertEquals('PayFac Username, Password and Litle Environment are required to get KYC Information. One or more value missing in mappings.',e.getMessage());
        }  
        kyclog = [select Id, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size());          	
    }
    
    static testMethod void fetchKycForAccountFromMP_InvalidUsernameInMapping(){
    	LitleKYCService litleKYCService = new LitleKYCService();
 		Account account = new Account(name=ACCOUNT_NAME, LitleLegalEntityId__c = 'testLitleLegalEntityId__c');
        insert account;
        SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
        mappingObject.MerchantUsername__c = 'testUsername';
        mappingObject.MerchantPassword__c = 'testPassword';
        mappingObject.LitleEnvironment__c = 'CERT';
        insert mappingObject;
		List<litleRequestResponseLog__c> kyclog = [select Id, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size()); 
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));       
 		litleKYCService.fetchKycForAccountFromMP(account);       	
        kyclog = [select Id, createLegalEntityResponseStatusCode__c, createLegalEntityResponseStatusMessage__c, createLegalEntityResponseXml__c, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(1, kyclog.size());
    	System.assertEquals(String.valueOf(LitleErrorResponse.STATUS_CODE), kyclog.get(0).createLegalEntityResponseStatusCode__c);
    	System.assertEquals(LitleErrorResponse.STATUS_MESSAGE, kyclog.get(0).createLegalEntityResponseStatusMessage__c);
    	System.assertEquals(LitleErrorResponse.response, kyclog.get(0).createLegalEntityResponseXml__c);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size());         
        Test.stopTest(); 	   	
    }
    
    static testMethod void fetchKycForAccountFromMP_Success(){
    	LitleKYCService litleKYCService = new LitleKYCService();
 		Account account = new Account(name=ACCOUNT_NAME, LitleLegalEntityId__c = 'testLitleLegalEntityId__c');
        insert account;
        SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
        mappingObject.MerchantUsername__c = 'testUsername';
        mappingObject.MerchantPassword__c = 'testPassword';
        mappingObject.LitleEnvironment__c = 'CERT';
        insert mappingObject;
		List<litleRequestResponseLog__c> kyclog = [select Id, createLegalEntityResponseStatusCode__c, createLegalEntityResponseStatusMessage__c, createLegalEntityResponseXml__c, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(0, kyclog.size());
    	List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(0, litleKYCs.size()); 
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(false), null));       
 		litleKYCService.fetchKycForAccountFromMP(account);       	
        kyclog = [select Id,createLegalEntityResponseStatusCode__c, createLegalEntityResponseStatusMessage__c, createLegalEntityResponseXml__c, name from litleRequestResponseLog__c where Log_Source__c ='KYC Request'];
    	System.assertEquals(1, kyclog.size());
    	System.assertEquals(String.valueOf(LegalEntityApprovedResponse.STATUS_CODE), kyclog.get(0).createLegalEntityResponseStatusCode__c);
    	System.assertEquals(LegalEntityApprovedResponse.STATUS_MESSAGE, kyclog.get(0).createLegalEntityResponseStatusMessage__c);
    	System.assertEquals(LegalEntityApprovedResponse.approvedResponse, kyclog.get(0).createLegalEntityResponseXml__c);
    	litleKYCs = [select Id, Name from Litle_KYC__c];
        System.assertEquals(1, litleKYCs.size());    
        Test.stopTest();   	
    }
}