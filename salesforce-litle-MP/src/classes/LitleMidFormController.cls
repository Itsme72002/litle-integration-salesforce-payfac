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
public class LitleMidFormController {
    
    public LegalEntityModel legalEntityModel{get; set;}
    public SubMerchantModel subMerchantModel{get; set;}
    public SalesforceLitleMappingsObject__c savedMappings{get; set;}
    public String urlAccountId;
    public String urlOpportunityId;
    public List<SelectOption> legalEntityTypeList{get; set;}
    public SubMerchantResponse subMerchantResponse;
    public String litleMid{get; set;}
    public String submerchantId{get; set;}
    public String payfacUrl{get; set;}
    public List<SelectOption> opportunityOptions{get; set;}
    public String selectedOpportunityId{get; set;}
    public Boolean isOpportunityMappingPresent{get; set;}
    public LitleKYCService kycService;
    public LegalEntityResponseService leResponseService;
    public LegalEntityModelService leModelService;
    public SubMerchantModelService smModelService;
    public HelpTextConstants helpTextConstant{get; set;}
    public List<SelectOption> mccSelectList{get; set;}
    public List < Selectoption > booleanOptions{get; set;}
    private SalesForceSelectOptionsService salesforceSelectOptionService;
    public MccService mccService;
    public LitleRequestResponseLog__c mccLog;
    
    public LitleMidFormController(){
        kycService = new LitleKYCService();
        salesforceSelectOptionService = new SalesForceSelectOptionsService();
        booleanOptions = salesforceSelectOptionService.fetchAllBooleanOption();
        helpTextConstant = new HelpTextConstants();
        leResponseService = new LegalEntityResponseService();
        subMerchantModel = new SubMerchantModel();
        subMerchantResponse = new SubMerchantResponse();
        legalEntityModel = new LegalEntityModel();
        savedMappings = new SalesforceLitleMappingsObject__c();
        savedMappings.litleEnvironment__c = 'CERT'; // default endpoint to hit
        mccService = new MccService();
        mccSelectList = new List<Selectoption>();
        mccSelectList.add(new Selectoption('', '-- Select Option --'));
        isOpportunityMappingPresent = false;
        this.urlAccountId = apexpages.currentpage().getParameters().get('accid');
        this.urlOpportunityId =  apexpages.currentpage().getParameters().get('oppid');
        //check if litle mid is already present
        if(String.isNotEmpty(urlOpportunityId)){
            litleMid = QueryUtil.getOpportunityFieldValue('Litle_MID__c', urlOpportunityId);
        }else if(String.isNotEmpty(urlAccountId)){
            litleMid = QueryUtil.getAccountFieldValue('Litle_MID__c', urlAccountId);
        }
        //populate all opportunities of this account id
        if(String.isNotEmpty(urlAccountId)){
            opportunityOptions = QueryUtil.getOpportunityNameOptions(urlAccountId);
        }else if(String.isNotEmpty(urlOpportunityId)){
        	urlAccountId = QueryUtil.getOpportunityFieldValue('AccountId', urlOpportunityId);
        }
        leModelService = new LegalEntityModelService(urlAccountId, urlOpportunityId);
        smModelService = new SubMerchantModelService(urlAccountId, urlOpportunityId);
        legalEntityTypeList = new List<SelectOption>();
        for (LegalEntityType.LegalEntityTypeEnum s: LegalEntityType.LegalEntityTypeEnum.values()){
            legalEntityTypeList.add(new SelectOption(s.name(), LegalEntityType.stringValue(s.name())));
        }
        setRequiredPciFields();
        populateModelsFromMapping();
        populateMccCodes();
    }
    
    private void setRequiredPciFields(){
    	//setting default values to required pci fields
        legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp('true');
        legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated('true');
        legalEntityModel.getLegalEntityPci().setPciLevel('4');
    }
    
    private void populateMccCodes(){
    	if(String.isEmpty(savedMappings.merchantUsername__c) || String.isEmpty(savedMappings.merchantPassword__c)){
        	ApexPageUtil.addErrorMessage('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.');
        }else{
        	mccLog = new LitleRequestResponseLog__c();
        	mccLog.Log_Source__c = 'Mcc Request';
	        List<Selectoption> mccList = mccService.getMccSelectOptionsForUser(savedMappings.merchantUsername__c, savedMappings.merchantPassword__c, 
	        														LitleEnvironment.getEnvironmentUrl(savedMappings.litleEnvironment__c), mccLog);
	        if(mccList == null){
	        	ApexPageUtil.addErrorMessage('Could not retrieve available Merchant Category Codes. Please contact Litle support.');
	        }else{
	        	for(Selectoption mccOption: mccList){
	        		mccSelectList.add(mccOption);
	        	}
	        }
        }
    }
    
    private void populateModelsFromMapping(){
    	SalesforceLitleMappingsObject__c mappingRecords = MappingObjectUtil.getCurrentMappings();
        if(mappingRecords != null){
            this.savedMappings =  mappingRecords;
            if(opportunityOptions != null && opportunityOptions.size() > 0){
                this.isOpportunityMappingPresent = MappingObjectUtil.isSobjectTypePresentInMapping(savedMappings, 'Opportunity');
            }
            this.legalEntityModel = leModelService.setLegalEntityModelFromMappingObject(legalEntityModel, savedMappings, selectedOpportunityId);
            this.subMerchantModel = smModelService.setSubMerchantModelFromMappingObject(subMerchantModel, savedMappings, selectedOpportunityId);
        }
    }
    
    public Pagereference logMccRequest(){
    	if(mccLog != null){
	    	try{
				insert mccLog;
			}catch(Dmlexception e){
				System.debug('Error inserting mcc log' + e.getMessage());
			}
    	}
		return null;
    }
    
    public boolean getIsLitleMidAvailable(){
        Boolean isLitleMidAvailable = false;
        if(String.isNotEmpty(litleMid) && Pattern.matches('\\A[0-9]+\\Z', litleMid)){
            isLitleMidAvailable = true;    
        }
        return isLitleMidAvailable;
    }
    
    public Pagereference onChangeOpportunityOptions(){
        legalEntityModel = leModelService.setLegalEntityModelFromMappingObjectOnOpportunityChange
                                                                                (legalEntityModel, savedMappings, selectedOpportunityId);
        subMerchantModel = smModelService.setSubMerchantModelFromMappingObjectOnOpportunityChange
                                                                                (subMerchantModel, savedMappings, selectedOpportunityId);
        return null;
    }
    
    public Pagereference submit(){
        if(areRequiredFieldsFilled()){
            if(isInputDataValid()){
                // Check if username and password are available
                if(String.isEmpty(savedMappings.merchantUsername__c) || String.isEmpty(savedMappings.merchantPassword__c)){
                    ApexPageUtil.addErrorMessage('Merchant Username or Password are not set in the Mappings page. Request Failed.');
                } else {
                    LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
                    litleRequestResponseLog.Log_Source__c = LitleConstants.LOG_SOURCE_GET_LITLE_MID;
                    // Get the request
                    Httprequest createLegalEntityRequest = LitleRequestXml.getCreateLegalEntityRequest(savedMappings.merchantUsername__c, savedMappings.merchantPassword__c,legalEntityModel, false, savedMappings.litleEnvironment__c);
                    // create masked entity request
                    Httprequest maskedLegalEntityRequest = LitleRequestXml.getCreateLegalEntityRequest(savedMappings.merchantUsername__c, savedMappings.merchantPassword__c,legalEntityModel, true, savedMappings.litleEnvironment__c);
                    //Log request
                    LoggingUtil.logCreateLegalEntityRequest(maskedLegalEntityRequest, litleRequestResponseLog); 
                    // Make Legal entity request 
                    if(createLegalEntityRequest != null){
                        LegalEntityResponse legalEntityResponse = makeCreateLegalEntityRequest(litleRequestResponseLog, createLegalEntityRequest);
                        //check if legal entity id is populated
                        if(String.isNotEmpty(legalEntityResponse.getLegalEntityId())){
                            Httprequest createSubMerchantRequest = LitleRequestXml.getCreateSubMerchantRequest(savedMappings.merchantUsername__c, 
                                                                                savedMappings.merchantPassword__c ,legalEntityResponse.getLegalEntityId()
                                                                                ,subMerchantModel, savedMappings.litleEnvironment__c);
                            //Log Sub Merchant request
                            LoggingUtil.logCreateSubMerchantRequest(createSubMerchantRequest, litleRequestResponseLog);
                            if(String.isNotEmpty(legalEntityResponse.getResponseCode())
                                && legalEntityResponse.getResponseCode().equals(LitleConstants.RESPONSE_APPROVED)){
                                    // make sub merchant request
                                    makeCreateSubMerchantRequest(litleRequestResponseLog, createSubMerchantRequest,legalEntityResponse.getLegalEntityId());
                            }
                                try{
                                        kycService.saveOrUpdateAllKYCObjects(urlOpportunityId, urlAccountId, legalEntityResponse);
                                        ApexPageUtil.addConfirmMessage('Your KYC Information has been successfully recorded. You can view it by clicking on the \'Litle KYC Information\' button.');
                                }catch(DmlException e){
                                        ApexPageUtil.addErrorMessage('There was an error saving KYC Information.');
                                        System.debug('Error saving KYC' + e.getMessage());
                                }
                        }
                    }
                    
                    LoggingUtil.logSObjectDetails(urlAccountId, urlOpportunityId, litleRequestResponseLog);
                    //Insert Litle Mid
                    if(String.isNotEmpty(urlOpportunityId)){
                        try{
                            Opportunity thisOpportunity = [select id, Litle_MID__c, PayFac_Portal_Link__c from Opportunity where id=:urlOpportunityId];
                            thisOpportunity.Litle_MID__c = litleMid;
                            thisOpportunity.PayFac_Portal_Link__c = payfacUrl;
                            upsert thisOpportunity;
                        }catch (Queryexception e){
                            System.debug('Error selecting litle mid value and payface link in opportunity'+ e);
                        }catch (Dmlexception e){
                            System.debug('Error inserting litle mid value in opportunity'+ e);
                        }
                    }else if(String.isNotEmpty(urlAccountId)){
                        try{
                            Account thisAccount = [select id, Litle_MID__c, PayFac_Portal_Link__c from Account where id=:urlAccountId];
                            thisAccount.Litle_MID__c = litleMid;
                            thisAccount.PayFac_Portal_Link__c = payfacUrl;
                            upsert thisAccount;
                        }catch (Queryexception e){
                            System.debug('Error selecting litle mid value and payface link in account'+ e);
                        }catch (Dmlexception e){
                            System.debug('Error inserting litle mid value in account'+ e);
                        } 
                    }
                    //insert log details in custom object
                    try{
                        insert litleRequestResponseLog;
                    }catch(DmlException e){
                        System.debug('Error Saving Request Response Object ' + e);
                    }
                }
            }
        }
        return null;
        
    }
    
    public LegalEntityResponse makeCreateLegalEntityRequest(LitleRequestResponseLog__c litleRequestResponseLog, Httprequest createLegalEntityRequest){
        Http h = new Http();
        Httpresponse lEResponse = new Httpresponse();
        LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
        try{
            lEResponse = h.send(createLegalEntityRequest); 
            //Log response
            LoggingUtil.logCreateLegalEntityResponse(lEResponse, litleRequestResponseLog);
            if(lEResponse.getStatusCode() == LitleConstants.LEGAL_ENTITY_SUCCESS_RESPONSE_CODE){
                //get response code, transaction id and response description
                if(String.isNotEmpty(XmlUtil.extractAttributeValue(lEResponse, 'legalEntityCreateResponse', 'duplicate')) 
                    &&  XmlUtil.extractAttributeValue(lEResponse, 'legalEntityCreateResponse', 'duplicate').equals('true')
                    && XmlUtil.elementExists(lEResponse, 'originalLegalEntity')){
                    //duplicate response, extract from original entity
                    legalEntityResponse = leResponseService.populateLegalEntityResponse(legalEntityResponse, lEResponse.getBody(), true);
                }else{
                    legalEntityResponse = leResponseService.populateLegalEntityResponse(legalEntityResponse, lEResponse.getBody(), false);
                }
                litleMid = legalEntityResponse.getResponseCode() + ' : ' + legalEntityResponse.getResponseDespcription();
                //Log response codes and legal entity id
                litleRequestResponseLog.legalEntityResponseCode__c = legalEntityResponse.getResponseCode();
                litleRequestResponseLog.legalEntityId__c = legalEntityResponse.getLegalEntityId();
                // Show error message if not approved
                if(!legalEntityResponse.getResponseCode().equals(LitleConstants.RESPONSE_APPROVED)){
                    ApexPageUtil.addInfoMessage(LitleConstants.getResponseMessage(legalEntityResponse.getResponseCode()));
                }
            }else{
                //reset the legal entity id
                legalEntityResponse.setLegalEntityId(null);
                legalEntityResponse.setResponseCode(String.valueOf(lEResponse.getStatusCode()));
                legalEntityResponse.setResponseDespcription(lEResponse.getStatus());
                generateErrorMessages(lEResponse);
                litleMid = String.valueOf(lEResponse.getStatusCode()) + ' : ' + lEResponse.getStatus();
            }
        }catch(System.CalloutException e){
            System.debug('Legal Entity Request Callout error: '+ e);
            System.debug(lEResponse.toString());
            ApexPageUtil.addErrorMessage('Error in making API request for Legal Entity.' + e.getMessage());
        }
        
        return legalEntityResponse;
    }
    
    public void generateErrorMessages(Httpresponse response){
        List<String> errorList = XmlUtil.extractListOfTagText(response, 'errors', 'error');
        for(String error : errorList){
            ApexPageUtil.addErrorMessage(error);    
        }       
    }
    
    public void makeCreateSubMerchantRequest(LitleRequestResponseLog__c litleRequestResponseLog, Httprequest createSubMerchantRequest, String legalEntityId){
        Http h = new Http();
        Httpresponse sMResponse = new Httpresponse();
        try{
            sMResponse = h.send(createSubMerchantRequest); 
            //Log response
            LoggingUtil.logCreateSubMerchantResponse(sMResponse, litleRequestResponseLog);
            if(sMResponse.getStatusCode() == LitleConstants.SUB_MERCHANT_SUCCESS_RESPONSE_CODE){
                //get litle mid
                litleMid = XmlUtil.extractXmlTagText(sMResponse, LitleConstants.XML_TAG_MERCHANT_IDENT_STRING);
                submerchantId = XmlUtil.extractXmlTagText(sMResponse, LitleConstants.XML_TAG_SUBMERCHANT_ID);
                payfacUrl = LitleEnvironment.getEnvironmentUrl(savedMappings.litleEnvironment__c) + LitleConstants.URL_SEPARATOR 
                    + LitleConstants.PAY_FAC_PORTAL_URI + LitleConstants.URL_SEPARATOR + LitleConstants.LEGAL_ENTITY_META_UI_URI + LitleConstants.URL_SEPARATOR 
                    + legalEntityId + LitleConstants.URL_SEPARATOR + LitleConstants.SUBMERCHANT_META_UI_URI
                    + LitleConstants.URL_SEPARATOR + submerchantId + LitleConstants.PAY_FAC_PORTAL_QUERY_STRING + subMerchantModel.getSubMerchantPspMerchantId(); 
                //ApexPageUtil.addConfirmMessage(LitleConstants.getResponseMessage(LitleConstants.RESPONSE_APPROVED));    
            }else{
                //set litle mid with the error description
                litleMid = String.valueOf(sMResponse.getStatusCode()) +' : ' + sMResponse.getStatus();
                ApexPageUtil.addErrorMessage(String.valueOf(String.valueOf(sMResponse.getStatusCode())+
                                                        ' : '+XmlUtil.extractXmlTagText(sMResponse,LitleConstants.XML_TAG_ERROR))); 
            }
        }catch(System.CalloutException e){
            System.debug('Sub Merchant Request Callout error: '+ e);
            System.debug(sMResponse.toString());
            ApexPageUtil.addErrorMessage('Error in making API request for Sub-Merchant.');
        }
    }
    
    public Pagereference cancel(){
        if(String.isNotEmpty(urlOpportunityId)){
                return new PageReference(LitleConstants.URL_SEPARATOR + urlOpportunityId);
        }else if(String.isNotEmpty(urlAccountId)){
            return new PageReference(LitleConstants.URL_SEPARATOR + urlAccountId);
        }
        return null;
    }
    
    public Boolean isInputDataValid(){
        return (leModelService.isLegalEntityValid(legalEntityModel, true) & 
                        smModelService.isSubMerchantModelValid(subMerchantModel, true));
    }
    
    public Boolean areRequiredFieldsFilled(){
       return (leModelService.areRequiredFieldsPresent(legalEntityModel, true) &
                                smModelService.areRequiredFieldsPresent(subMerchantModel, true));        
    }
}