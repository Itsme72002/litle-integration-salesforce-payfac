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
    
    public LitleMidFormController(){
        kycService = new LitleKYCService();
        salesforceSelectOptionService = new SalesForceSelectOptionsService();
        booleanOptions = salesforceSelectOptionService.fetchAllBooleanOption();
        helpTextConstant = new HelpTextConstants();
        leResponseService = new LegalEntityResponseService();
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
        // if the litle mid is an error code, null it back out and proceed
        /*System.debug('Constructor called!!!!');
        if(litleMid != null && !Pattern.matches('\\A[0-9]+\\Z', litleMid)){
            litleMid = null;    
        }*/
        //populate all opportunities of this account id
        if(String.isNotEmpty(urlAccountId)){
            opportunityOptions = QueryUtil.getOpportunityNameOptions(urlAccountId);
        }
        if(String.isEmpty(urlAccountId)){
            // call from opportunity page, fetch account id
            if(String.isNotEmpty(urlOpportunityId)){
                //query for account id
                try{
                    Opportunity opp = [select accountid from opportunity where id=:urlOpportunityId];
                    urlAccountId = opp.accountid;
                }catch(Queryexception e){
                    system.debug('Error fetching account id from opportunity' + e);
                }
            }
        }
        
        leModelService = new LegalEntityModelService(urlAccountId, urlOpportunityId);
        smModelService = new SubMerchantModelService(urlAccountId, urlOpportunityId);
        
        legalEntityTypeList = new List<SelectOption>();
        for (LegalEntityType.LegalEntityTypeEnum s: LegalEntityType.LegalEntityTypeEnum.values()){
            legalEntityTypeList.add(new SelectOption(s.name(), LegalEntityType.stringValue(s.name())));
        }
        savedMappings = new SalesforceLitleMappingsObject__c();
        savedMappings.litleEnvironment__c = 'CERT'; // default endpoint to hit
        legalEntityModel = new LegalEntityModel();
        //setting default values to required pci fields
        legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp('true');
        legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated('true');
        legalEntityModel.getLegalEntityPci().setPciLevel('4');
        
        subMerchantModel = new SubMerchantModel();
        subMerchantResponse = new SubMerchantResponse();
        
        List<SalesforceLitleMappingsObject__c> mappingRecords 
                = [select id, name, litleEnvironment__c, legalEntityAnnualCreditCardSalesVolume__c, legalEntityAnnualCreditCardSalesVolumeD__c, legalEntityAnnualCreditCardSalesVolumeX__c, legalEntityCity__c, legalEntityCityD__c, legalEntityCityX__c, legalEntityContactPhone__c, legalEntityContactPhoneD__c, legalEntityContactPhoneX__c, legalEntityCountryCode__c, legalEntityCountryCodeD__c, legalEntityCountryCodeX__c, legalEntityDateOfBirth__c, legalEntityDateOfBirthX__c, legalEntityDoingBusinessAs__c, legalEntityDoingBusinessAsD__c, legalEntityDoingBusinessAsX__c, legalEntityPrincipalEmailAddress__c, legalEntityPrincipalEmailAddressD__c, legalEntityPrincipalEmailAddressX__c, legalEntityHasAcceptedCreditCards__c, legalEntityHasAcceptedCreditCardsD__c, legalEntityHasAcceptedCreditCardsX__c, legalEntityName__c, legalEntityNameD__c, legalEntityNameX__c, legalEntityPostalCode__c, legalEntityPostalCodeD__c, legalEntityPostalCodeX__c, legalEntityPrincipalDateOfBirth__c, legalEntityPrincipalDateOfBirthD__c, legalEntityPrincipalDateOfBirthX__c, legalEntityPrincipalDriversLicense__c, legalEntityPrincipalDriversLicenseD__c, legalEntityPrincipalDriversLicenseState__c, legalEntityPrincipalDriversLicenseStateD__c, legalEntityPrincipalDriversLicenseStateX__c, legalEntityPrincipalDriversLicenseX__c, legalEntityPrincipalFirstName__c, legalEntityPrincipalFirstNameD__c, legalEntityPrincipalFirstNameX__c, legalEntityPrincipalLastName__c, legalEntityPrincipalLastNameD__c, legalEntityPrincipalLastNameX__c, legalEntityPrincipalSsn__c, legalEntityPrincipalSsnD__c, legalEntityPrincipalSsnX__c, legalEntityStateProvince__c, legalEntityStateProvinceD__c, legalEntityStateProvinceX__c, legalEntityStreetAddress1__c, legalEntityStreetAddress1D__c, legalEntityStreetAddress1X__c, legalEntityStreetAddress2__c, legalEntityStreetAddress2D__c, legalEntityStreetAddress2X__c, legalEntityTaxId__c, legalEntityTaxIdD__c, legalEntityTaxIdX__c, legalEntityType__c, legalEntityTypeD__c, legalEntityTypeX__c, merchantPassword__c, merchantUsername__c, subMerchantAmexMid__c, subMerchantAmexMidD__c, subMerchantAmexMidX__c, subMerchantBankAccountNumber__c, subMerchantBankAccountNumberD__c, subMerchantBankAccountNumberX__c, subMerchantBankRoutingNumber__c, subMerchantBankRoutingNumberD__c, subMerchantBankRoutingNumberX__c, subMerchantCity__c, subMerchantCityD__c, subMerchantCityX__c, subMerchantCountryCode__c, subMerchantCountryCodeD__c, subMerchantCountryCodeX__c, subMerchantCreateCredentials__c, subMerchantCreateCredentialsD__c, subMerchantCreateCredentialsX__c, subMerchantCustomerServiceNumber__c, subMerchantCustomerServiceNumberD__c, subMerchantCustomerServiceNumberX__c, subMerchantDiscoverConveyMid__c, subMerchantDiscoverConveyMidD__c, subMerchantDiscoverConveyMidX__c, subMerchanteCheckBillingDescD__c, subMerchanteCheckBillingDescriptor__c, subMerchanteCheckBillingDescriptorX__c, subMerchanteCheckCompanyName__c, subMerchanteCheckCompanyNameD__c, subMerchanteCheckCompanyNameX__c, subMerchantEmailAddress__c, subMerchantEmailAddressD__c, subMerchantEmailAddressX__c, subMerchantFirstName__c, subMerchantFirstNameD__c, subMerchantFirstNameX__c, subMerchantHardCodeBillingDescD__c, subMerchantHardCodeBillingDescriptor__c, subMerchantHardCodeBillingDescriptorX__c, subMerchantLastName__c, subMerchantLastNameD__c, subMerchantLastNameX__c, subMerchantMaxTransactionAmount__c, subMerchantMaxTransactionAmountD__c, subMerchantMaxTransactionAmountX__c, subMerchantMerchantCategoryCode__c, subMerchantMerchantCategoryCodeD__c, subMerchantMerchantCategoryCodeX__c, subMerchantMerchantName__c, subMerchantMerchantNameD__c, subMerchantMerchantNameX__c, subMerchantPhone__c, subMerchantPhoneD__c, subMerchantPhoneX__c, subMerchantPostalCode__c, subMerchantPostalCodeD__c, subMerchantPostalCodeX__c, subMerchantPspMerchantId__c, subMerchantPspMerchantIdD__c, subMerchantPspMerchantIdX__c, subMerchantStateProvince__c, subMerchantStateProvinceD__c, subMerchantStateProvinceX__c, subMerchantStreetAddress1__c, subMerchantStreetAddress1D__c, subMerchantStreetAddress1X__c, subMerchantStreetAddress2__c, subMerchantStreetAddress2D__c, subMerchantStreetAddress2X__c, subMerchantUrl__c, subMerchantUrlD__c, subMerchantUrlX__c, legalEntityPrincipalContactPhone__c, legalEntityPrincipalContactPhoneD__c, legalEntityPrincipalContactPhoneX__c, legalEntityPrincipalCity__c, legalEntityPrincipalCityD__c, legalEntityPrincipalCityX__c, legalEntityPrincipalCountryCode__c, legalEntityPrincipalCountryCodeD__c, legalEntityPrincipalCountryCodeX__c, legalEntityPrincipalPostalCode__c, legalEntityPrincipalPostalCodeD__c, legalEntityPrincipalPostalCodeX__c, legalEntityPrincipalStateProvince__c, legalEntityPrincipalStateProvinceD__c, legalEntityPrincipalStateProvinceX__c, legalEntityPrincipalStreetAddress1__c, legalEntityPrincipalStreetAddress1D__c, legalEntityPrincipalStreetAddress1X__c, legalEntityPrincipalStreetAddress2__c, legalEntityPrincipalStreetAddress2D__c, legalEntityPrincipalStreetAddress2X__c from SalesforceLitleMappingsObject__c limit 1];
        if(!mappingRecords.isEmpty()){
            this.savedMappings =  mappingRecords.get(0);
            if(opportunityOptions != null && opportunityOptions.size() > 0){
                isOpportunityMappingPresent = MappingObjectUtil.isSobjectTypePresentInMapping(savedMappings, 'Opportunity');
            }
            legalEntityModel = leModelService.setLegalEntityModelFromMappingObject(legalEntityModel, savedMappings, selectedOpportunityId);
            subMerchantModel = smModelService.setSubMerchantModelFromMappingObject(subMerchantModel, savedMappings, selectedOpportunityId);
        }
        
        //check username and password present
        if(String.isEmpty(savedMappings.merchantUsername__c) || String.isEmpty(savedMappings.merchantPassword__c)){
        	ApexPageUtil.addErrorMessage('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.');
        }else{
	        List<Selectoption> mccList = mccService.getMccSelectOptionsForUser(savedMappings.merchantUsername__c, savedMappings.merchantPassword__c, 
	        														LitleEnvironment.getEnvironmentUrl(savedMappings.litleEnvironment__c));
	        if(mccList == null){
	        	ApexPageUtil.addErrorMessage('Could not retrieve available Merchant Category Codes. Please contact Litle support.');
	        }else{
	        	for(Selectoption mccOption: mccList){
	        		mccSelectList.add(mccOption);
	        	}
	        }
        }
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
    	System.debug('!legal entity ' + leModelService.isLegalEntityValid(legalEntityModel, true));
    	System.debug('!sub merchant ' + smModelService.isSubMerchantModelValid(subMerchantModel, true));
        return (leModelService.isLegalEntityValid(legalEntityModel, true) & 
                        smModelService.isSubMerchantModelValid(subMerchantModel, true));
    }
    
    public Boolean areRequiredFieldsFilled(){
       return (leModelService.areRequiredFieldsPresent(legalEntityModel, true) &
                                smModelService.areRequiredFieldsPresent(subMerchantModel, true));        
    }
}