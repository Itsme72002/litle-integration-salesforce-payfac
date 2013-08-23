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
public class ResetService {
	
	public void deleteAllLitleKYC(){
		List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c];
		for(Litle_KYC__c litleKYC : litleKYCs){
			deleteBusinessOfKYC(litleKYC.Id);
			deletePrincipalOfKYC(litleKYC.Id);
			delete litleKYC;
		}
	}
	
	public void deleteBusinessVerificationResult(String businessId){
		if(String.isNotEmpty(businessId)){
			List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c where Litle_Business__c =:businessId];
			for(Litle_Verification_Result__c verificationResult : verificationResults){
				deleteRiskIndicatorOfVerificationResult(verificationResult.Id);
				delete verificationResult;
			}
		}	
	}
	
	public void deleteRiskIndicatorOfVerificationResult(String verificationResultId){
		if(String.isNotEmpty(verificationResultId)){
			List<Litle_Risk_Indicator__c> riskIndicators = [select Id, Name from Litle_Risk_Indicator__c where Litle_Verification_Result__c =:verificationResultId];
			for(Litle_Risk_Indicator__c riskIndicator : riskIndicators){
				delete riskIndicator;
			}
		}
	}
	
	public void deletePrincipalVerificationResult(String principalId){
		if(String.isNotEmpty(principalId)){
			List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c where Litle_Principal__c =:principalId];
			for(Litle_Verification_Result__c verificationResult : verificationResults){
				deleteRiskIndicatorOfVerificationResult(verificationResult.Id);
				delete verificationResult;
			}
		}	
	}
	
	public void deleteBusinessOfKYC(String litleKYCId){
		if(String.isNotEmpty(litleKYCId)){
			List<Litle_Business__c> businesses = [select Id, Name from Litle_Business__c where Litle_KYC__c =:litleKYCId];
			for(Litle_Business__c business: businesses){
				deleteBusinessVerificationResult(business.Id);
				delete business;
			}
		}
	}
	
	public void deletePrincipalOfKYC(String litleKYCId){
		if(String.isNotEmpty(litleKYCId)){
			List<Litle_Principal__c> principals = [select Id, Name from Litle_Principal__c where Litle_KYC__c =:litleKYCId];
			for(Litle_Principal__c principal: principals){
				deletePrincipalVerificationResult(principal.Id);
				delete principal;
			}
		}	
	}
	
	public void deleteAllLitleMappingsSaveLogs(){
		List<LitleMappingsSaveLog__c> litleMappingsSaveLogsToBeDeleted = [select Id, Name from LitleMappingsSaveLog__c];
		delete litleMappingsSaveLogsToBeDeleted;		
	}
	
	public void deleteAllLitleRequestResponseLogs(){
		List<LitleRequestResponseLog__c> LitleRequestResponseLogsToBeDeleted = [select Id, Name from LitleRequestResponseLog__c];
		delete litleRequestResponseLogsToBeDeleted;
	}
	
	public void deleteAllSalesforceLitleMappingsObjects(){
		List<SalesforceLitleMappingsObject__c> mappingObjectsToBeDeleted = [select Id, Name from SalesforceLitleMappingsObject__c];
		delete mappingObjectsToBeDeleted;
	}
	
	public void deleteAllCasesOfAccount(String accountId){
		if(String.isNotEmpty(accountId)){
			List<Case> accountCases = [select Id from Case where AccountId =:accountId];
			delete accountCases;
		}
	}
	
	public void deleteAllAccounts(){
		List<Account> accountsToBeDeleted = [select Id, Name from Account];
		for(Account accountToBeDeleted : accountsToBeDeleted){
			deleteAllCasesOfAccount(accountToBeDeleted.Id);
			delete accountToBeDeleted;
		}
	}
	
	public void deleteAllOpportunities(){
		List<Opportunity> opportunitiesToBeDeleted = [select Id, Name from Opportunity];
		for(Opportunity opportunityToBeDeleted : opportunitiesToBeDeleted){
			delete opportunityToBeDeleted;	
		}
	}
	
	public String createDefaultAccount(){
		Account account = new Account();
		account.PayFac_Portal_Link__c = null;
    	account.Litle_MID__c = null;
    	account.Website = 'http://www.pyramid.com';
    	account.Type = 'Customer - Channel';
    	account.TickerSymbol = 'PYR';
    	account.Sic = '4253';
		account.ShippingStreet = '900 Chelmsford St';
		account.ShippingState = 'MA';
		account.ShippingCity = 'Lowell';
		account.ShippingPostalCode = '01851';
		account.ShippingCountry = 'USA';
		account.Ownership = 'Private';
		account.Rating = 'Warm';
		account.Description = 'This is a demo Account';
		account.Phone = '(014) 427-4427';
		account.Name = 'Pyramid Construction Inc';
		account.Industry = 'Construction';
		account.Fax = '(014) 427-4428';
		account.BillingStreet = '900 Chelmsford St';
		account.BillingState = 'MA';
		account.BillingPostalCode = '01851';
		account.BillingCountry = 'USA';
		account.BillingCity = 'Lowell';
		account.AnnualRevenue = 950000000;
		insert account;
		return account.Id;
	}
	
	public void createDefaultOpportunity(){
		Opportunity opportunity = new Opportunity();
		opportunity.PayFac_Portal_Link__c = null;
    	opportunity.Litle_MID__c = null;
    	opportunity.Type = 'New Customer';
    	opportunity.StageName = 'Prospecting';
    	opportunity.Probability = 10;
    	opportunity.Name = 'Pyramid Construction Lowell Branch';
		opportunity.LeadSource = 'Web';
		opportunity.Description = 'This is a demo Opportunity';
		opportunity.CloseDate = Date.today();
		insert opportunity;
	}
	
	public void createDefaultOpportunityWithLinkedAccount(String accountId){
		if(String.isNotEmpty(accountId)){
			try{
				Opportunity opportunity = new Opportunity();
				opportunity.AccountId = accountId;
				opportunity.PayFac_Portal_Link__c = null;
		    	opportunity.Litle_MID__c = null;
		    	opportunity.Type = 'New Customer';
		    	opportunity.StageName = 'Prospecting';
		    	opportunity.Probability = 10;
		    	opportunity.Name = 'Pyramid Construction Lowell Branch';
				opportunity.LeadSource = 'Web';
				opportunity.Description = 'This is a demo Opportunity';
				opportunity.CloseDate = Date.today();
				insert opportunity;
			}catch(Queryexception e){
				System.debug('Unable to insert opportunity for account id:' + accountId + 'Error: '+ e.getMessage());
			}catch(Stringexception e){
				System.debug('Unable to insert opportunity for account id:' + accountId + 'Error: '+ e.getMessage());
			}
		}
	}
	
	public void createDefaultMapping(){
		SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.merchantUsername__c = 'PSPXMLV8';
		mappingObject.litleEnvironment__c = LitleEnvironment.LitleEnvironmentEnum.CERT.name();
		//psp sub merchant id - mapped to sf field
		mappingObject.subMerchantPspMerchantId__c = 'Account.Industry';
        mappingObject.subMerchantPspMerchantIdX__c = true;
		//merchant name - mapped to account name
		mappingObject.subMerchantMerchantName__c = 'Account.Name';
        mappingObject.subMerchantMerchantNameX__c = true;
		//merchant category code mapped to default value
        mappingObject.subMerchantMerchantCategoryCodeD__c = '7997';
        mappingObject.subMerchantMerchantCategoryCodeX__c = false;
		//default billing descriptor mapped to default value
        mappingObject.subMerchantHardCodeBillingDescriptor__c = 'Account.Industry';
        mappingObject.subMerchantHardCodeBillingDescriptorX__c = true;
		//customer service number mapped to account phone number
		mappingObject.subMerchantCustomerServiceNumber__c = 'Account.Phone';
        mappingObject.subMerchantCustomerServiceNumberX__c = true;
		//Max transaction amount mapped to opportunity 
		mappingObject.subMerchantMaxTransactionAmount__c = 'Account.AnnualRevenue';
        mappingObject.subMerchantMaxTransactionAmountX__c = true;
		//addresses mapped to account address
		mappingObject.subMerchantStateProvince__c = 'Account.BillingState';
        mappingObject.subMerchantStateProvinceX__c = true;
        mappingObject.subMerchantStreetAddress1__c= 'Account.BillingStreet';
        mappingObject.subMerchantStreetAddress1X__c = true;
        mappingObject.subMerchantCity__c= 'Account.BillingCity';
        mappingObject.subMerchantCityX__c = true;
        mappingObject.subMerchantCountryCode__c= 'Account.BillingCountry';
        mappingObject.subMerchantCountryCodeX__c = true;
        mappingObject.subMerchantPostalCode__c= 'Account.BillingPostalCode';
        mappingObject.subMerchantPostalCodeX__c = true;
        
        mappingObject.legalEntityStateProvince__c= 'Account.BillingState';
		mappingObject.legalEntityStateProvinceX__c = true;
		mappingObject.legalEntityStreetAddress1__c= 'Account.BillingStreet';
		mappingObject.legalEntityStreetAddress1X__c = true;
		mappingObject.legalEntityCity__c= 'Account.BillingCity';
		mappingObject.legalEntityCityX__c = true;
        mappingObject.legalEntityPostalCode__c= 'Account.BillingPostalCode';
		mappingObject.legalEntityPostalCodeX__c = true;
		mappingObject.legalEntityCountryCode__c= 'Account.BillingCountry';
		mappingObject.legalEntityCountryCodeX__c = true;
		
		mappingObject.legalEntityPrincipalCity__c= 'Account.BillingCity';
		mappingObject.legalEntityPrincipalCityX__c = true;
		mappingObject.legalEntityPrincipalCountryCode__c= 'Account.BillingCountry';
		mappingObject.legalEntityPrincipalCountryCodeX__c = true;
		mappingObject.legalEntityPrincipalPostalCode__c= 'Account.BillingPostalCode';
		mappingObject.legalEntityPrincipalPostalCodeX__c = true;
        mappingObject.legalEntityPrincipalStateProvince__c= 'Account.BillingState';
		mappingObject.legalEntityPrincipalStateProvinceX__c = true;
		mappingObject.legalEntityPrincipalStreetAddress1__c= 'Account.BillingStreet';
		mappingObject.legalEntityPrincipalStreetAddress1X__c = true;
		
		
		mappingObject.legalEntityContactPhone__c = 'Account.Phone';
		mappingObject.legalEntityContactPhoneX__c = true;
		//legal entity name mapped to opportunity name
		mappingObject.legalEntityName__c = 'Account.Name';
		mappingObject.legalEntityNameX__c = true;
		//type individual sole
		mappingObject.legalEntityTypeD__c = 'Individual Sole Proprietorship';
		mappingObject.legalEntityHasAcceptedCreditCardsD__c = 'false';
		mappingObject.legalEntityHasAcceptedCreditCardsX__c = false;
		//annual credit card sales volume mapped to annual revenue
		mappingObject.legalEntityAnnualCreditCardSalesVolume__c = 'Account.AnnualRevenue';
		mappingObject.legalEntityAnnualCreditCardSalesVolumeX__c = true;
		//first name,last name, phone from accounte
		mappingObject.legalEntityPrincipalContactPhone__c = 'Account.Phone';
		mappingObject.legalEntityPrincipalContactPhoneX__c = true;
		mappingObject.legalEntityPrincipalFirstNameD__c = 'John';
		mappingObject.legalEntityPrincipalFirstNameX__c = false;
		mappingObject.legalEntityPrincipalLastNameD__c = 'Doe';
		mappingObject.legalEntityPrincipalLastNameX__c = false;
		
        mappingObject.subMerchantFirstNameD__c = 'John';
        mappingObject.subMerchantFirstNameX__c = false;
        mappingObject.subMerchantLastNameD__c = 'Doe';
        mappingObject.subMerchantLastNameX__c = false;
        mappingObject.subMerchantEmailAddressD__c = 'johnDoe@pyramid.com';
        mappingObject.subMerchantEmailAddressX__c = false;
        mappingObject.subMerchantPhone__c = 'Account.Phone';
        mappingObject.subMerchantPhoneX__c = true;
		
		insert mappingObject;
	}
}