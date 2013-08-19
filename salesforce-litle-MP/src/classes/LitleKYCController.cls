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
public class LitleKYCController {
	
	public String urlAccountId {get; set;}
	public String urlOpportunityId {get; set;}
	public Account account {get; set;}
	public Opportunity opportunity {get; set;}
	public Litle_KYC__c litleKYC{get; set;}
	public Litle_Principal__c litlePrincipal{get; set;}
	public Litle_Business__c litleBusiness{get; set;}
	public Litle_Verification_Result__c litleBusinessVerificationResult{get; set;}
	public Litle_Verification_Result__c litlePrincipalVerificationResult{get; set;}
	public List<Litle_Risk_Indicator__c> litlePrincipalRiskIndicators{get; set;}
	public List<Litle_Risk_Indicator__c> litleBusinessRiskIndicators{get; set;}
	
	public LitleKYCController(){
		this.urlAccountId = apexpages.currentpage().getParameters().get('accid');
        this.urlOpportunityId =  apexpages.currentpage().getParameters().get('oppid');
        populateAccountOrOpportunity();
        populateLitleKYC();
        populateLitlePrincipal();
        populateLitleBusiness();
        populateLitleVerificationResult();
        populateRiskIndicators();
	}
	
	private void populateAccountOrOpportunity(){
		if(String.isNotEmpty(urlAccountId)){
        	try{
        		account = [select id, name from Account where id= :urlAccountId];
        	}catch(QueryException e){
        		System.debug('Error fetching account for id:' + urlAccountId + ' '+ e.getMessage());
        	}
        }else if(String.isNotEmpty(urlOpportunityId)){
        	try{
        		opportunity = [select id, name from Opportunity where id= :urlOpportunityId];
        	}catch(QueryException e){
        		System.debug('Error fetching opportunity for id:' + urlOpportunityId + ' '+ e.getMessage());
        	}
        }
	}
	
	private void populateLitleKYC(){
		if(account != null){
			try{
				litleKYC = [select id, name from Litle_KYC__c where Account__c = :account.Id];
			}catch(QueryException e){
        		System.debug('Error fetching Litle KYC for account id:' + account.Id + ' '+ e.getMessage());
        	}
		}else if(opportunity != null){
			try{
				litleKYC = [select id, name from Litle_KYC__c where Opportunity__c = :opportunity.Id];
			}catch(QueryException e){
        		System.debug('Error fetching Litle KYC for opportunity id:' + opportunity.Id + ' '+ e.getMessage());
        	}
		}
	}
	
	private void populateLitlePrincipal(){
		if(litleKYC != null){
			try{
				litlePrincipal = [select First_Name__c, Last_Name__c, Principal_Id__c from Litle_Principal__c where Litle_KYC__c = :litleKYC.Id];
			}catch(QueryException e){
        		System.debug('Error fetching Litle Principal for kyc id:' + litleKYC.Id + ' '+ e.getMessage());
        	}
		}
	}
	
	private void populateLitleBusiness(){
		if(litleKYC != null){
			try{
				litleBusiness = [select id, name from Litle_Business__c where Litle_KYC__c = :litleKYC.Id];
			}catch(QueryException e){
        		System.debug('Error fetching Litle Business for kyc id:' + litleKYC.Id + ' '+ e.getMessage());
        	}
		}
	}
	
	private void populateLitleVerificationResult(){
		if(litlePrincipal != null){
			try{
				litlePrincipalVerificationResult = 
				[select Address_Verified__c,
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
						Zip_Verified__c,
						Ssn_Verified__c,
						Dob_Verified__c 
					from Litle_Verification_Result__c 
					where Litle_Principal__c =:litlePrincipal.Id];
			}catch(QueryException e){
        		System.debug('Error fetching Verification result for Principal for litlePrincipal id:' + litlePrincipal.Id + ' '+ e.getMessage());
        	}
		}
		
		if(litleBusiness != null){
			try{
				litleBusinessVerificationResult 
				= [select Address_Verified__c,
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
						Zip_Verified__c,
						Ssn_Verified__c,
						Dob_Verified__c 
					from Litle_Verification_Result__c 
					where Litle_Business__c =:litleBusiness.Id];
			}catch(QueryException e){
        		System.debug('Error fetching Verification result for Business for litleBusiness id:' + litleBusiness.Id + ' '+ e.getMessage());
        	}
		}
	}
	
	private void populateRiskIndicators(){
		if(litlePrincipalVerificationResult != null){
			litlePrincipalRiskIndicators = [select Code__c, Description__c 
											from Litle_Risk_Indicator__c 
											where Litle_Verification_Result__c =:litlePrincipalVerificationResult.Id];
		}
		
		if(litleBusinessVerificationResult != null){
			litleBusinessRiskIndicators = [select Code__c, Description__c 
											from Litle_Risk_Indicator__c 
											where Litle_Verification_Result__c =:litleBusinessVerificationResult.Id];
		}
	}
	
	public Pagereference cancel(){
	 	if(String.isNotEmpty(urlOpportunityId)){
	 		return new PageReference('/'+urlOpportunityId);
	 	}else if(String.isNotEmpty(urlAccountId)){
	 		return new PageReference('/'+urlAccountId);
	 	}
	 	return null;
	}

}