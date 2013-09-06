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
public class LitleKYCService {
	
	private Litle_KYC__c litleKYC;
    private Litle_Principal__c litlePrincipal;
	private Litle_Business__c litleBusiness;
	private Litle_Verification_Result__c businessVerification;
    private Litle_Verification_Result__c principalVerification;
    
    public void saveOrUpdateAllKYCObjects(String opportunityId, String accountId, LegalEntityResponse leResponse){
    	if(leResponse != null && (String.isNotEmpty(accountId) || String.isNotEmpty(opportunityId))){
    		saveOrUpdateLitleKYCObject(opportunityId, accountId);
    		
    		saveOrUpdateLitleBusinessObject(litleKYC);
    		saveOrUpdateLitlePrincipalObject(litleKYC, leResponse.getResponsePrincipal());
    		
    		saveOrUpdateBusinessVerificationResult(litleBusiness, leResponse.getBusinessVerificationResult());
    		saveOrUpdateRiskIndicators(businessVerification, leResponse.getBusinessVerificationResult().getRiskIndicators());
    		
    		saveOrUpdatePrincipalVerificationResult(litlePrincipal, leResponse.getPrincipalVerificationResult());
    		saveOrUpdateRiskIndicators(principalVerification, leResponse.getPrincipalVerificationResult().getRiskIndicators());
    	}
    }
    
    
	public void saveOrUpdateLitleKYCObject(String opportunityId, String accountId){
        if(String.isNotEmpty(opportunityId)){
            //check litle kyc
            List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Opportunity__c =:opportunityId limit 1];
            if(litleKYCs.isEmpty()){
                //no kyc records present for this account
                litleKYC = new Litle_KYC__c();
                litleKYC.Opportunity__c = opportunityId;     
                insert litleKYC;            
            }else{
                //record already present use it
                litleKYC = litleKYCs.get(0);
            }               
        }else if(String.isNotEmpty(accountId)){
            //check litle kyc
            List<Litle_KYC__c> litleKYCs = [select Id, Name from Litle_KYC__c where Account__c =:accountId limit 1];
            if(litleKYCs.isEmpty()){
                //no kyc records present for this account
                litleKYC = new Litle_KYC__c();
                litleKYC.Account__c = accountId;     
                insert litleKYC;            
            }else{
                //record already present use it
                litleKYC = litleKYCs.get(0);
            }
        }
	}
	
	public void saveOrUpdateLitleBusinessObject(Litle_KYC__c litleKYC){
        if(litleKYC != null){
            //check litle business
            List<Litle_Business__c> litleBusinesses = [select Id, Name from Litle_Business__c where Litle_KYC__c = :litleKYC.Id limit 1];
            if(litleBusinesses.isEmpty()){
                litleBusiness = new Litle_Business__c();
                litleBusiness.Litle_KYC__c = litleKYC.Id;
                insert litleBusiness;                       
            }else{
                //record already present use it
                litleBusiness = litleBusinesses.get(0);
            }
        }
	}
        
    public void saveOrUpdateLitlePrincipalObject(Litle_KYC__c litleKYC, Principal principal){ 
    	if(litleKYC != null){       
            //check litle principal
            List<Litle_Principal__c> litlePrincipals = [select Id, Name from Litle_Principal__c where Litle_KYC__c = :litleKYC.Id limit 1];
            if(litlePrincipals.isEmpty()){
                litlePrincipal = new Litle_Principal__c();
                litlePrincipal.Litle_KYC__c = litleKYC.Id;
                fillPrincipalObjectDetails(litlePrincipal, principal);
                insert litlePrincipal;                      
            }else{
                //record already present use it
                litlePrincipal = litlePrincipals.get(0);
                fillPrincipalObjectDetails(litlePrincipal, principal);
                upsert litlePrincipal;
            }
        }
    }
    
    private void fillPrincipalObjectDetails(Litle_Principal__c litlePrincipal, Principal principal){
    	litlePrincipal.Principal_Id__c = principal.getPrincipalId(); 
        litlePrincipal.First_Name__c = principal.getFirstName();
        litlePrincipal.Last_Name__c = principal.getLastName();
    }
    
    public void saveOrUpdateBusinessVerificationResult(Litle_Business__c litleBusiness, VerificationResult vResult){
        if(litleBusiness != null){
            List<Litle_Verification_Result__c> businessVerifications = 
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
                        where Litle_Business__c =:litleBusiness.Id];
            if(businessVerifications.isEmpty()){
                businessVerification = new Litle_Verification_Result__c();
                businessVerification.Litle_Business__c = litleBusiness.Id;
                fillVerificationDetails(businessVerification, vResult);
                insert businessVerification;
            }else{
                businessVerification = businessVerifications.get(0);
                fillVerificationDetails(businessVerification, vResult);
                upsert businessVerification;
            }
        }
    }
    
    public void saveOrUpdatePrincipalVerificationResult(Litle_Principal__c litlePrincipal, VerificationResult vResult){
        if(litlePrincipal != null){
            List<Litle_Verification_Result__c> principalVerifications = 
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
            if(principalVerifications.isEmpty()){
                principalVerification = new Litle_Verification_Result__c();
                principalVerification.Litle_Principal__c = litlePrincipal.Id;
                fillVerificationDetails(principalVerification, vResult);
                insert principalVerification;
            }else{
                principalVerification = principalVerifications.get(0);
                fillVerificationDetails(principalVerification, vResult);
                upsert principalVerification;
            }
        }
    }
    
    private void fillVerificationDetails(Litle_Verification_Result__c verificationObject, VerificationResult vResult){
    	fillOverallScore(verificationObject, vResult.getOverallScore());
        fillNameAddTaxIdAssn(verificationObject, vResult.getNameAddressTaxOrSsnIdAssociation());
        fillNameAddPhnAssn(verificationObject, vResult.getNameAddressPhoneAssociation());
        fillVerificationIndicators(verificationObject, vResult.getVerificationIndicator());
    }
    
    private void fillOverallScore(Litle_Verification_Result__c verificationObject, DescriptionDetails descDetails){
    	verificationObject.Overall_Score__c = descDetails.getCodeOrScore();
        verificationObject.Overall_Description__c = descDetails.getDescription();
    }
    
    private void fillNameAddTaxIdAssn(Litle_Verification_Result__c verificationObject, DescriptionDetails descDetails){
    	verificationObject.Name_Address_TaxId_Association_Code__c = descDetails.getCodeOrScore();
        verificationObject.Name_Address_TaxId_Association_Desc__c = descDetails.getDescription();
    }
    
    private void fillNameAddPhnAssn(Litle_Verification_Result__c verificationObject, DescriptionDetails descDetails){
    	verificationObject.Name_Address_Phone_Association_Code__c = descDetails.getCodeOrScore();
        verificationObject.Name_Address_Phone_Association_Desc__c = descDetails.getDescription();
    }
    
    private void fillVerificationIndicators(Litle_Verification_Result__c verificationObject, VerificationIndicators vIndicator){
    	verificationObject.Address_Verified__c = vIndicator.getAddressVerified();
        verificationObject.City_Verified__c = vIndicator.getCityVerified();
        verificationObject.Name_Verified__c = vIndicator.getNameVerified();
        verificationObject.Phone_Verified__c = vIndicator.getPhoneVerified();
        verificationObject.TaxId_Verified__c = vIndicator.getTaxIdVerified();
        verificationObject.Zip_Verified__c = vIndicator.getZipVerified();
        verificationObject.Ssn_Verified__c = vIndicator.getSsnVerified();
        verificationObject.Dob_Verified__c =  vIndicator.getDobVerified();
    }
    
    public void saveOrUpdateRiskIndicators(Litle_Verification_Result__c verificationResult, List<DescriptionDetails> riskIndicators){
        if(verificationResult != null){
        	deleteAllRiskIndicatorsOfVerificationResult(verificationResult);
        	insertRiskIndicatorObjects(verificationResult, riskIndicators);
        }
    }
    
    public void deleteAllRiskIndicatorsOfVerificationResult(Litle_Verification_Result__c verificationResult){
		 if(verificationResult != null){
	        List<Litle_Risk_Indicator__c> savedRisks = [select Code__c, Description__c 
	                                                        from Litle_Risk_Indicator__c 
	                                                        where Litle_Verification_Result__c =:verificationResult.Id];
	        for(Litle_Risk_Indicator__c riskIndicator : savedRisks){
                delete riskIndicator;
	        }
		}
    }
    
	public void insertRiskIndicatorObjects(Litle_Verification_Result__c verificationResult, List<DescriptionDetails> riskIndicators){
		 if(verificationResult != null){
	    	for(DescriptionDetails riskIndicator: riskIndicators){
	            Litle_Risk_Indicator__c newRiskIndicator = new Litle_Risk_Indicator__c();
	            newRiskIndicator.Code__c = riskIndicator.getCodeOrScore();
	            newRiskIndicator.Description__c = riskIndicator.getDescription();
	            newRiskIndicator.Litle_Verification_Result__c = verificationResult.Id;
	            insert newRiskIndicator;
	    	}	    
		}
	}
	
	public void fetchKycForAccountFromMP(Account acc){
		if(acc != null && String.isNotEmpty(acc.LitleLegalEntityId__c)){
			SalesforceLitleMappingsObject__c mappingObject = MappingObjectUtil.getCurrentMappings();
			if(mappingObject == null){
				throw new LitleException('No Mapping record present.');
			}
			if(String.isNotEmpty(mappingObject.MerchantUsername__c) && String.isNotEmpty(mappingObject.Merchantpassword__c)
				&& String.isNotEmpty(mappingObject.litleEnvironment__c)){
				String endPoint = LitleEnvironment.getEnvironmentUrl(mappingObject.litleEnvironment__c) 
						                       + LitleConstants.URL_SEPARATOR 
						                       + LitleConstants.LEGAL_ENTITY_URI
						                       + LitleConstants.URL_SEPARATOR 
						                       + acc.LitleLegalEntityId__c;
		       	litleRequestResponseLog__c kycLog = new litleRequestResponseLog__c();
			  	kycLog.Log_Source__c = LitleConstants.LOG_SOURCE_KYC_REQUEST;
			 	Http h = new Http();
				HttpRequest legalEntityRequest = HttpUtil.getLitleMPHttpRequest(LitleConstants.RETRIEVE_HTTP_REQUEST_METHOD, endPoint, 
		                                              HttpUtil.getBasicAuthorizationHeader(mappingObject.MerchantUsername__c, mappingObject.Merchantpassword__c),
		                                              LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE,
		                                              LitleConstants.REQUEST_HEADER_ACCEPT_VALUE, '');									
		      	LoggingUtil.logCreateLegalEntityRequest(legalEntityRequest, kycLog); 
		      	HttpResponse leHttpResponse = new HttpResponse();
		      	try{
		          	leHttpResponse = h.send(legalEntityRequest);
		          	LoggingUtil.logCreateLegalEntityResponse(leHttpResponse, kycLog);
	          	}catch(System.CalloutException e){
		          	System.debug('Legal Entity Request Callout error: '+ e);
		      	}
	          	if(leHttpResponse != null 
	          		&& leHttpResponse.getStatusCode() == LitleConstants.RETRIEVE_LEGAL_ENTITY_SUCCESS_RESPONSE_CODE){
	              	LegalEntityResponse leResponse = new LegalEntityResponse();
	              	LegalEntityResponseService leService = new LegalEntityResponseService();
	              	leResponse = leService.populateLegalEntityResponse(leResponse, leHttpResponse.getBody(), false);
	              	saveOrUpdateAllKYCObjects(null, acc.Id, leResponse);
	          	}
		      	LoggingUtil.logSObjectDetails(acc.Id, null, kycLog);
		      	try{
		          	insert kycLog;					
		      	}catch(DMLException e){
		          	System.debug('Error inserting kyc log for account id: '+ acc.Id);
		      	}
			}else{
				throw new LitleException('PayFac Username, Password and Litle Environment are required to get KYC Information. One or more value missing in mappings.');
			}
		}
	}
}