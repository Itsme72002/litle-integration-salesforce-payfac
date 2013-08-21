public class ResetService {
	
	public void deleteLitleKYCForAccount(String accountId){
		if(String.isNotEmpty(accountId)){
			List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:accountId];
			for(Litle_KYC__c litleKYC : litleKYCs){
				deleteBusiness(litleKYC.Id);
				deletePrincipal(litleKYC.Id);
				delete litleKYC;
			}
		}
	}
	
	public void deleteLitleKYCForOpportunity(String opportunityId){
		if(String.isNotEmpty(opportunityId)){
			List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunityId];
			for(Litle_KYC__c litleKYC : litleKYCs){
				deleteBusiness(litleKYC.Id);
				deletePrincipal(litleKYC.Id);
				delete litleKYC;
			}
		}
	}
	
	public void deleteBusinessVerificationResult(String businessId){
		if(String.isNotEmpty(businessId)){
			List<Litle_Verification_Result__c> verificationResults = [select Id, Name from Litle_Verification_Result__c where Litle_Business__c =:businessId];
			for(Litle_Verification_Result__c verificationResult : verificationResults){
				deleteRiskIndicator(verificationResult.Id);
				delete verificationResult;
			}
		}	
	}
	
	public void deleteRiskIndicator(String verificationResultId){
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
				deleteRiskIndicator(verificationResult.Id);
				delete verificationResult;
			}
		}	
	}
	
	public void deleteBusiness(String litleKYCId){
		if(String.isNotEmpty(litleKYCId)){
			List<Litle_Business__c> businesses = [select Id, Name from Litle_Business__c where Litle_KYC__c =:litleKYCId];
			for(Litle_Business__c business: businesses){
				deleteBusinessVerificationResult(business.Id);
				delete business;
			}
		}
	}
	
	public void deletePrincipal(String litleKYCId){
		if(String.isNotEmpty(litleKYCId)){
			List<Litle_Principal__c> principals = [select Id, Name from Litle_Principal__c where Litle_KYC__c =:litleKYCId];
			for(Litle_Principal__c principal: principals){
				deletePrincipalVerificationResult(principal.Id);
				delete principal;
			}
		}	
	}
	
	public void deleteLitleMappingsSaveLog(){
		List<LitleMappingsSaveLog__c> litleMappingsSaveLogsToBeDeleted = [select Id, Name from LitleMappingsSaveLog__c];
		delete litleMappingsSaveLogsToBeDeleted;		
	}
	
	public void deleteLitleRequestResponseLogOfAccount(String accountId){
		if(String.isNotEmpty(accountId)){
			List<LitleRequestResponseLog__c> LitleRequestResponseLogsToBeDeleted = [select Id, Name from LitleRequestResponseLog__c where Account__c =:accountId];
			delete litleRequestResponseLogsToBeDeleted;
		}
	}
	
	public void deleteLitleRequestResponseLogOfOpportunity(String opportunityId){
		if(String.isNotEmpty(opportunityId)){
			List<LitleRequestResponseLog__c> LitleRequestResponseLogsToBeDeleted = [select Id, Name from LitleRequestResponseLog__c where Opportunity__c =:opportunityId];
			delete litleRequestResponseLogsToBeDeleted;
		}
	}
	
	public void deleteSalesforceLitleMappingsObject(){
		List<SalesforceLitleMappingsObject__c> mappingObjectsToBeDeleted = [select Id, Name from SalesforceLitleMappingsObject__c];
		delete mappingObjectsToBeDeleted;
	}
	
	public void resetAccount(String accountId){
		if(String.isNotEmpty(accountId)){
			List<Account> accountsToBeDeleted = [select Id, Name from Account where Id !=:accountId];
			delete accountsToBeDeleted;
			
			Account account = [Select a.PayFac_Portal_Link__c, 
    								a.Litle_MID__c, a.Website, a.Type, 
    								a.TickerSymbol, a.Sic, a.ShippingStreet, 
    								a.ShippingState, a.ShippingPostalCode, 
    								a.ShippingCountry, a.ShippingCity, a.Phone,
    								a.Name, a.Industry, a.Id, a.Fax, a.Description,
    								a.BillingStreet, a.BillingState, a.BillingPostalCode, 
    								a.BillingCountry, a.BillingCity, a.AnnualRevenue
								From Account a where a.Id =:accountId];
			
			if(account != null){
				account.PayFac_Portal_Link__c = null;
		    	account.Litle_MID__c = null;
		    	account.Website = 'http://www.pyramid.com';
		    	account.Type = 'Customer - Channel';
		    	account.TickerSymbol = 'PYR';
		    	account.Sic = '4253';
				account.ShippingStreet = '2 Place Jussieu';
				account.ShippingState = null;
				account.ShippingCity = 'Paris';
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
				update account;
			}
		}
	}
	
	public void resetOpportunity(String opportunityId){
		if(String.isNotEmpty(opportunityId)){
			List<Opportunity> opportunitiesToBeDeleted = [select Id, Name from Opportunity where Id !=:opportunityId];
			delete opportunitiesToBeDeleted;
			
			Opportunity opportunity = [Select o.PayFac_Portal_Link__c, o.Litle_MID__c, o.DeliveryInstallationStatus__c,
		    							o.Type, o.StageName, o.Probability, o.Name, 
		    							o.LeadSource, o.Description, o.CloseDate
										From Opportunity o where o.Id =:opportunityId];
			
			if(opportunity != null){
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
				update opportunity;
			}
		}
	}

}