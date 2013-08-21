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
	
	public void createDefaultAccount(){
		Account account = new Account();
		account.PayFac_Portal_Link__c = null;
    	account.Litle_MID__c = null;
    	account.Website = 'http://www.pyramid.com';
    	account.Type = 'Customer - Channel';
    	account.TickerSymbol = 'PYR';
    	account.Sic = '4253';
		account.ShippingStreet = '2 Place Jussieu';
		account.ShippingState = null;
		account.ShippingCity = 'Paris';
		account.ShippingPostalCode = '75251';
		account.ShippingCountry = 'France';
		account.Ownership = 'Private';
		account.Rating = 'Warm';
		account.Active__c = 'Yes';
		account.SLAExpirationDate__c = Date.today();
		account.UpsellOpportunity__c = 'Maybe';
		account.SLA__c = 'Silver';
		account.Description = 'This is a demo Account';
		account.Phone = '(014) 427-4427';
		account.Name = 'Pyramid Construction Inc';
		account.Industry = 'Construction';
		account.Fax = '(014) 427-4428';
		account.BillingStreet = '2 Place Jussieu';
		account.BillingState = null;
		account.BillingPostalCode = '75251';
		account.BillingCountry = 'France';
		account.BillingCity = 'Paris';
		account.AnnualRevenue = 950000000;
		insert account;
	}
	
	public void createDefaultOpportunity(){
		Opportunity opportunity = new Opportunity();
		opportunity.PayFac_Portal_Link__c = null;
    	opportunity.Litle_MID__c = null;
    	opportunity.DeliveryInstallationStatus__c = 'In progress';
    	opportunity.Type = 'New Customer';
    	opportunity.StageName = 'Prospecting';
    	opportunity.Probability = 10;
    	opportunity.Name = 'Pyramid Construction Lowell Branch';
		opportunity.LeadSource = 'Web';
		opportunity.Description = 'This is a demo Opportunity';
		opportunity.CloseDate = Date.today();
		insert opportunity;
	}
}