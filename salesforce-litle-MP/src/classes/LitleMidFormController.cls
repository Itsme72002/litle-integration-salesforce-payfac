public class LitleMidFormController {
    
    public LegalEntityModel legalEntityModel{get; set;}
    public SubMerchantModel subMerchantModel{get; set;}
    public SalesforceLitleMappingsObject__c savedMappings {get; set;}
    public String urlAccountId {get; set;}
    public String urlOpportunityId {get; set;}
    public List<SelectOption> legalEntityTypeList{get; set;}
    public List<SelectOption> submerchantMccList{get; set;}
    public SubMerchantResponse subMerchantResponse {get; set;}
    // stores litle mid / error information
    public String litleMid{get; set;}
    public String submerchantId;
    public List<SelectOption> opportunityOptions {get; set;}
    public String selectedOpportunityId {get; set;}
    public Boolean isOpportunityMappingPresent{get; set;}
    public LitleKYCService kycService;
    public LegalEntityResponseService leResponseService;
    public MappingSobjectService mappingService;
    
    
    public String payfacUrl;
    
    public LitleMidFormController(){
    	kycService = new LitleKYCService();
    	leResponseService = new LegalEntityResponseService();
        isOpportunityMappingPresent = false;
        this.urlAccountId = apexpages.currentpage().getParameters().get('accid');
        this.urlOpportunityId =  apexpages.currentpage().getParameters().get('oppid');
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
        
        mappingService = new MappingSobjectService(urlAccountId, urlOpportunityId);
        
        // if the litle mid is non null on the account in question
        litleMid = QueryUtil.getAccountFieldValue('Litle_MID__c', urlAccountId);
        // if the litle mid is an error code, null it back out and proceed
        if(litleMid != null && !Pattern.matches('\\A[0-9]+\\Z', litleMid)){
            litleMid = null;    
        }
        
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
                = [select id, name, litleEnvironment__c, legalEntityAnnualCreditCardSalesVolume__c, legalEntityAnnualCreditCardSalesVolumeD__c, legalEntityAnnualCreditCardSalesVolumeX__c, legalEntityCity__c, legalEntityCityD__c, legalEntityCityX__c, legalEntityContactPhone__c, legalEntityContactPhoneD__c, legalEntityContactPhoneX__c, legalEntityCountryCode__c, legalEntityCountryCodeD__c, legalEntityCountryCodeX__c, legalEntityDateOfBirth__c, legalEntityDateOfBirthX__c, legalEntityDoingBusinessAs__c, legalEntityDoingBusinessAsD__c, legalEntityDoingBusinessAsX__c, legalEntityPrincipalEmailAddress__c, legalEntityPrincipalEmailAddressD__c, legalEntityPrincipalEmailAddressX__c, legalEntityFirstName__c, legalEntityFirstNameD__c, legalEntityFirstNameX__c, legalEntityHasAcceptedCreditCards__c, legalEntityHasAcceptedCreditCardsD__c, legalEntityHasAcceptedCreditCardsX__c, legalEntityLastName__c, legalEntityLastNameD__c, legalEntityLastNameX__c, legalEntityName__c, legalEntityNameD__c, legalEntityNameX__c, legalEntityPostalCode__c, legalEntityPostalCodeD__c, legalEntityPostalCodeX__c, legalEntityPrincipalDateOfBirth__c, legalEntityPrincipalDateOfBirthD__c, legalEntityPrincipalDateOfBirthX__c, legalEntityPrincipalDriversLicense__c, legalEntityPrincipalDriversLicenseD__c, legalEntityPrincipalDriversLicenseState__c, legalEntityPrincipalDriversLicenseStateD__c, legalEntityPrincipalDriversLicenseStateX__c, legalEntityPrincipalDriversLicenseX__c, legalEntityPrincipalFirstName__c, legalEntityPrincipalFirstNameD__c, legalEntityPrincipalFirstNameX__c, legalEntityPrincipalLastName__c, legalEntityPrincipalLastNameD__c, legalEntityPrincipalLastNameX__c, legalEntityPrincipalSsn__c, legalEntityPrincipalSsnD__c, legalEntityPrincipalSsnX__c, legalEntityStateProvince__c, legalEntityStateProvinceD__c, legalEntityStateProvinceX__c, legalEntityStreetAddress1__c, legalEntityStreetAddress1D__c, legalEntityStreetAddress1X__c, legalEntityStreetAddress2__c, legalEntityStreetAddress2D__c, legalEntityStreetAddress2X__c, legalEntityTaxId__c, legalEntityTaxIdD__c, legalEntityTaxIdX__c, legalEntityType__c, legalEntityTypeD__c, legalEntityTypeX__c, merchantPassword__c, merchantUsername__c, subMerchantAmexMid__c, subMerchantAmexMidD__c, subMerchantAmexMidX__c, subMerchantBankAccountNumber__c, subMerchantBankAccountNumberD__c, subMerchantBankAccountNumberX__c, subMerchantBankRoutingNumber__c, subMerchantBankRoutingNumberD__c, subMerchantBankRoutingNumberX__c, subMerchantCity__c, subMerchantCityD__c, subMerchantCityX__c, subMerchantCountryCode__c, subMerchantCountryCodeD__c, subMerchantCountryCodeX__c, subMerchantCreateCredentials__c, subMerchantCreateCredentialsD__c, subMerchantCreateCredentialsX__c, subMerchantCustomerServiceNumber__c, subMerchantCustomerServiceNumberD__c, subMerchantCustomerServiceNumberX__c, subMerchantDiscoverConveyMid__c, subMerchantDiscoverConveyMidD__c, subMerchantDiscoverConveyMidX__c, subMerchanteCheckBillingDescD__c, subMerchanteCheckBillingDescriptor__c, subMerchanteCheckBillingDescriptorX__c, subMerchanteCheckCompanyName__c, subMerchanteCheckCompanyNameD__c, subMerchanteCheckCompanyNameX__c, subMerchantEmailAddress__c, subMerchantEmailAddressD__c, subMerchantEmailAddressX__c, subMerchantFirstName__c, subMerchantFirstNameD__c, subMerchantFirstNameX__c, subMerchantHardCodeBillingDescD__c, subMerchantHardCodeBillingDescriptor__c, subMerchantHardCodeBillingDescriptorX__c, subMerchantLastName__c, subMerchantLastNameD__c, subMerchantLastNameX__c, subMerchantMaxTransactionAmount__c, subMerchantMaxTransactionAmountD__c, subMerchantMaxTransactionAmountX__c, subMerchantMerchantCategoryCode__c, subMerchantMerchantCategoryCodeD__c, subMerchantMerchantCategoryCodeX__c, subMerchantMerchantName__c, subMerchantMerchantNameD__c, subMerchantMerchantNameX__c, subMerchantPhone__c, subMerchantPhoneD__c, subMerchantPhoneX__c, subMerchantPostalCode__c, subMerchantPostalCodeD__c, subMerchantPostalCodeX__c, subMerchantPspMerchantId__c, subMerchantPspMerchantIdD__c, subMerchantPspMerchantIdX__c, subMerchantStateProvince__c, subMerchantStateProvinceD__c, subMerchantStateProvinceX__c, subMerchantStreetAddress1__c, subMerchantStreetAddress1D__c, subMerchantStreetAddress1X__c, subMerchantStreetAddress2__c, subMerchantStreetAddress2D__c, subMerchantStreetAddress2X__c, subMerchantUrl__c, subMerchantUrlD__c, subMerchantUrlX__c, legalEntityPrincipalContactPhone__c, legalEntityPrincipalContactPhoneD__c, legalEntityPrincipalContactPhoneX__c, legalEntityPrincipalCity__c, legalEntityPrincipalCityD__c, legalEntityPrincipalCityX__c, legalEntityPrincipalCountryCode__c, legalEntityPrincipalCountryCodeD__c, legalEntityPrincipalCountryCodeX__c, legalEntityPrincipalPostalCode__c, legalEntityPrincipalPostalCodeD__c, legalEntityPrincipalPostalCodeX__c, legalEntityPrincipalStateProvince__c, legalEntityPrincipalStateProvinceD__c, legalEntityPrincipalStateProvinceX__c, legalEntityPrincipalStreetAddress1__c, legalEntityPrincipalStreetAddress1D__c, legalEntityPrincipalStreetAddress1X__c, legalEntityPrincipalStreetAddress2__c, legalEntityPrincipalStreetAddress2D__c, legalEntityPrincipalStreetAddress2X__c from SalesforceLitleMappingsObject__c limit 1];
        if(!mappingRecords.isEmpty()){
            this.savedMappings =  mappingRecords.get(0);
            if(opportunityOptions != null && opportunityOptions.size() > 0){
                isOpportunityMappingPresent = MappingObjectUtil.isSobjectTypePresentInMapping(savedMappings, 'Opportunity');
            }
            populateFields();
        }
    }
    
    
    public Pagereference onChangeOpportunityOptions(){
        if(String.isNotEmpty(selectedOpportunityId)){
            if(subMerchantModel.getIsSubMerchanteCheckCompanyNameFromOpportunity()){
                populateSMeCheckCompanyName();
            }
            
            if(subMerchantModel.getIsSubMerchanteCheckBillingDescriptorFromOpportunity()){
                populateSMeCheckBillingDescriptor();
            }
            
            if(subMerchantModel.getIsSubMerchantUrlFromOpportunity()){
                populateSMUrl();
            }
            
            if(subMerchantModel.getIsSubMerchantPspMerchantIdFromOpportunity()){
                populateSMPspMerchantId();
            }
            
            if(subMerchantModel.getSubMerchantPrimaryContact().getIsPhoneFromOpportunity()){
                populateSMPhone();
            }
            
            if(subMerchantModel.getSubMerchantPrimaryContact().getIsEmailAddressFromOpportunity()){
                populateSMEmailAddress();
            }
            
            if(subMerchantModel.getSubMerchantPrimaryContact().getIsLastNameFromOpportunity()){
                populateSMLastName();
            }
            
            if(subMerchantModel.getSubMerchantPrimaryContact().getIsFirstNameFromOpportunity()){
                populateSMFirstName();
            }
            if(subMerchantModel.getIsSubMerchantMerchantNameFromOpportunity()){
                populateSMMerchantName();
            }
            
            if(subMerchantModel.getIsSubMerchantMerchantCategoryCodeFromOpportunity()){
                populateSMMerchantCategoryCode();
            }
            
            if(subMerchantModel.getIsSubMerchantMaxTransactionAmountFromOpportunity()){
                populateSMMaxTransactionAmount();
            }
            
            if(subMerchantModel.getIsSubMerchantHardCodeBillingDescriptorFromOpportunity()){
                populateSMHardCodeBillingDescriptor();
            }
            
            if(subMerchantModel.getIsSubMerchantDiscoverConveyMidFromOpportunity()){
                populateSMDiscoverConveyMid();
            }
            
            if(subMerchantModel.getIsSubMerchantCustomerServiceNumberFromOpportunity()){
                populateSMCustomerServiceNumber();
            }
            
            if(subMerchantModel.getIsSubMerchantCreateCredentialsFromOpportunity()){
                populateSMCreateCredentials();
            }
            
            if(subMerchantModel.getIsSubMerchantBankRoutingNumberFromOpportunity()){
                populateSMBankRoutingNumber();
            }
            
            if(subMerchantModel.getIsSubMerchantBankAccountNumberFromOpportunity()){
                populateSMBankAccountNumber();
            }
            
            if(subMerchantModel.getIsSubMerchantAmexMidFromOpportunity()){
                populateSMAmexMid();
            }
            
            if(subMerchantModel.getSubMerchantAddress().getIsCountryCodeFromOpportunity()){
                populateSMCountryCode();
            }
            
            if(subMerchantModel.getSubMerchantAddress().getIsPostalCodeFromOpportunity()){
                populateSMPostalCode();
            }
            
            if(subMerchantModel.getSubMerchantAddress().getIsStateProvinceFromOpportunity()){
                populateSMStateProvince();
            }
            
            if(subMerchantModel.getSubMerchantAddress().getIsCityFromOpportunity()){
                populateSMCity();
            }
            
            if(subMerchantModel.getSubMerchantAddress().getIsStreetAddress2FromOpportunity()){
                populateSMStreetAddress2();
            }
            
            if(subMerchantModel.getSubMerchantAddress().getIsStreetAddress1FromOpportunity()){
                populateSMStreetAddress1();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getAddress().getIsCountryCodeFromOpportunity()){
                populateLEPrincipalCountryCode();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getAddress().getIsPostalCodeFromOpportunity()){
                populateLEPrincipalPostalCode();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getAddress().getIsStateProvinceFromOpportunity()){
                populateLEPrincipalStateProvince();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getAddress().getIsCityFromOpportunity()){
                populateLEPrincipalCity();
            }
            
            
            if(legalEntityModel.getLegalEntityPrincipal().getAddress().getIsStreetAddress2FromOpportunity()){
                populateLEPrincipalAddress2();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getAddress().getIsStreetAddress1FromOpportunity()){
                populateLEPrincipalAddress1();
            }
            
            if(legalEntityModel.getIsHasAcceptedCreditCardsFromOpportunity()){
                populateLEHasAcceptedCreditCards();
            }
            
            if(legalEntityModel.getIsAnnualCreditCardSalesVolumeFromOpportunity()){
                populateLEAnnualCreditCardSalesVolume();
            }
            
            if(legalEntityModel.getIsTaxIdFromOpportunity()){
                populateLETaxId();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getIsSsnFromOpportunity()){
                populateLEPrincipalSsn();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getIsDriversLicenseStateFromOpportunity()){
                populateLEPrincipalDriversLicenseState();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getIsDriversLicenseFromOpportunity()){
                populateLEPrincipalDriversLicense();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getIsDateOfBirthFromOpportunity()){
                populateLEPrincipalDateOfBirth();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getIsContactPhoneFromOpportunity()){
                populateLEPrincipalContactPhone();
            }
            
            if(legalEntityModel.getIsContactPhoneFromOpportunity()){
                populateLEContactPhone();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getIsEmailAddressFromOpportunity()){
                populateLEPrincipalEmailAddress();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getIsLastNameFromOpportunity()){
                populateLEPrincipalLastName();
            }
            
            if(legalEntityModel.getLegalEntityPrincipal().getIsFirstNameFromOpportunity()){
                populateLEPrincipalFirstName();
            }
            
            if(legalEntityModel.getLegalEntityAddress().getIsCountryCodeFromOpportunity()){
                populateLECountryCode();
            }
            
            if(legalEntityModel.getLegalEntityAddress().getIsPostalCodeFromOpportunity()){
                populateLEPostalCode();
            }
            
            if(legalEntityModel.getLegalEntityAddress().getIsStateProvinceFromOpportunity()){
                populateLEStateProvince();
            }
            
            if(legalEntityModel.getLegalEntityAddress().getIsCityFromOpportunity()){
                populateLECity();
            }
            
            if(legalEntityModel.getLegalEntityAddress().getIsStreetAddress2FromOpportunity()){
                populateLEAddress2();
            }
            
            if(legalEntityModel.getLegalEntityAddress().getIsStreetAddress1FromOpportunity()){
                populateLEAddress1();
            }
            
            if(legalEntityModel.getIsDoingBusinessAsFromOpportunity()){
                populateLEDoingBusinessAs();
            }
            
            if(legalEntityModel.getIsNameFromOpportunity()){
                populateLEName();
            }
            
                        
        }
        return null;
    }
    
    
    public void populateFields(){
        populateLEName();
        populateLEType();
        populateLEDoingBusinessAs();
        populateLEAddress1();
        populateLEAddress2();
        populateLECity();
        populateLEStateProvince();
        populateLEPostalCode();
        populateLECountryCode();
        populateLEPrincipalAddress1();
        populateLEPrincipalAddress2();
        populateLEPrincipalCity();
        populateLEPrincipalStateProvince();
        populateLEPrincipalPostalCode();
        populateLEPrincipalCountryCode();
        populateLEPrincipalFirstName();
        populateLEPrincipalLastName();
        populateLEPrincipalEmailAddress();
        populateLEContactPhone();
        populateLEPrincipalContactPhone();
        populateLEPrincipalDateOfBirth();
        populateLEPrincipalDriversLicense();
        populateLEPrincipalDriversLicenseState();
        populateLEPrincipalSsn();
        populateLETaxId();
        populateLEAnnualCreditCardSalesVolume();
        populateLEHasAcceptedCreditCards();
        populateSMStreetAddress1();
        populateSMStreetAddress2();
        populateSMCity();
        populateSMStateProvince();
        populateSMPostalCode();
        populateSMCountryCode();
        populateSMAmexMid();
        populateSMBankAccountNumber();
        populateSMBankRoutingNumber();
        populateSMCreateCredentials();
        populateSMCustomerServiceNumber();
        populateSMDiscoverConveyMid();
        populateSMHardCodeBillingDescriptor();
        populateSMMaxTransactionAmount();
        populateSMMerchantCategoryCode();
        populateSMMerchantName();
        populateSMFirstName();
        populateSMLastName();
        populateSMEmailAddress();
        populateSMPhone();
        populateSMPspMerchantId();
        populateSMUrl();
        populateSMeCheckBillingDescriptor();
        populateSMeCheckCompanyName();
    }
    
    public List<String> splitSObjectNameAndField(String concatenatedSring){
        List<String> customObjectFieldParts = new List<String>();
        if(String.isNotEmpty(concatenatedSring)){
            customObjectFieldParts = concatenatedSring.split('\\.', 2);
        }
        return customObjectFieldParts;
    }
    
    public void populateLEName(){
    	legalEntityModel.setLegalEntityName(mappingService.fetchMappedValue(savedMappings.legalEntityName__c, savedMappings.legalEntityNameD__c, savedMappings.legalEntityNameX__c, selectedOpportunityId));
		legalEntityModel.setIsNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount (savedMappings.legalEntityName__c, savedMappings.legalEntityNameX__c));
    }
    
    public void populateLEType(){
        legalEntityModel.setLegalEntityType(savedMappings.legalEntityTypeD__c);
    }
    
    public void populateLEDoingBusinessAs(){
    	legalEntityModel.setLegalEntityDoingBusinessAs(mappingService.fetchMappedValue(savedMappings.legalEntityDoingBusinessAs__c,savedMappings.legalEntityDoingBusinessAsD__c,savedMappings.legalEntityDoingBusinessAsX__c,selectedOpportunityId));
		legalEntityModel.setIsDoingBusinessAsFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityDoingBusinessAs__c,savedMappings.legalEntityDoingBusinessAsX__c));
    }
    
    public void populateLEAddress1(){
        legalEntityModel.getLegalEntityAddress().setStreetAddress1(mappingService.fetchMappedValue(savedMappings.legalEntityStreetAddress1__c,savedMappings.legalEntityStreetAddress1D__c,savedMappings.legalEntityStreetAddress1X__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityAddress().setIsStreetAddress1FromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityStreetAddress1__c,savedMappings.legalEntityStreetAddress1X__c));
	}
    
    public void populateLEAddress2(){
    	legalEntityModel.getLegalEntityAddress().setStreetAddress2(mappingService.fetchMappedValue(savedMappings.legalEntityStreetAddress2__c,savedMappings.legalEntityStreetAddress2D__c,savedMappings.legalEntityStreetAddress2X__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityAddress().setIsStreetAddress2FromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityStreetAddress2__c,savedMappings.legalEntityStreetAddress2X__c));
	}
    
    public void populateLECity(){
    	legalEntityModel.getLegalEntityAddress().setCity(mappingService.fetchMappedValue(savedMappings.legalEntityCity__c,savedMappings.legalEntityCityD__c,savedMappings.legalEntityCityX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityAddress().setIsCityFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityCity__c,savedMappings.legalEntityCityX__c));
	}
	
    public void populateLEStateProvince(){
    	legalEntityModel.getLegalEntityAddress().setStateProvince(mappingService.fetchMappedValue(savedMappings.legalEntityStateProvince__c,savedMappings.legalEntityStateProvinceD__c,savedMappings.legalEntityStateProvinceX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityAddress().setIsStateProvinceFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityStateProvince__c,savedMappings.legalEntityStateProvinceX__c));
	}
	
    public void populateLECountryCode(){
    	legalEntityModel.getLegalEntityAddress().setCountryCode(mappingService.fetchMappedValue(savedMappings.legalEntityCountryCode__c,savedMappings.legalEntityCountryCodeD__c,savedMappings.legalEntityCountryCodeX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityAddress().setIsCountryCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityCountryCode__c,savedMappings.legalEntityCountryCodeX__c));
	}
	
    public void populateLEPostalCode(){
    	legalEntityModel.getLegalEntityAddress().setPostalCode(mappingService.fetchMappedValue(savedMappings.legalEntityPostalCode__c,savedMappings.legalEntityPostalCodeD__c,savedMappings.legalEntityPostalCodeX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityAddress().setIsPostalCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPostalCode__c,savedMappings.legalEntityPostalCodeX__c));
	}
    
    public void populateLETaxId(){
    	legalEntityModel.setLegalEntityTaxId(mappingService.fetchMappedValue(savedMappings.legalEntityTaxId__c,savedMappings.legalEntityTaxIdD__c,savedMappings.legalEntityTaxIdX__c,selectedOpportunityId));
		legalEntityModel.setIsTaxIdFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityTaxId__c,savedMappings.legalEntityTaxIdX__c));
	}
	
    public void populateLEAnnualCreditCardSalesVolume(){
    	legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(mappingService.fetchMappedValue(savedMappings.legalEntityAnnualCreditCardSalesVolume__c,savedMappings.legalEntityAnnualCreditCardSalesVolumeD__c,savedMappings.legalEntityAnnualCreditCardSalesVolumeX__c,selectedOpportunityId));
		legalEntityModel.setIsAnnualCreditCardSalesVolumeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityAnnualCreditCardSalesVolume__c,savedMappings.legalEntityAnnualCreditCardSalesVolumeX__c));
	}
    
    public void populateLEHasAcceptedCreditCards(){
    	legalEntityModel.setLegalEntityHasAcceptedCreditCards(mappingService.fetchMappedValue(savedMappings.legalEntityHasAcceptedCreditCards__c,savedMappings.legalEntityHasAcceptedCreditCardsD__c,savedMappings.legalEntityHasAcceptedCreditCardsX__c,selectedOpportunityId));
		legalEntityModel.setIsHasAcceptedCreditCardsFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityHasAcceptedCreditCards__c,savedMappings.legalEntityHasAcceptedCreditCardsX__c));
	}
	
	public void populateLEContactPhone(){
		legalEntityModel.setLegalEntityContactPhone(mappingService.fetchMappedValue(savedMappings.legalEntityContactPhone__c,savedMappings.legalEntityContactPhoneD__c,savedMappings.legalEntityContactPhoneX__c,selectedOpportunityId));
		legalEntityModel.setIsContactPhoneFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityContactPhone__c,savedMappings.legalEntityContactPhoneX__c));
	}
	
    public void populateLEPrincipalFirstName(){
    	legalEntityModel.getLegalEntityPrincipal().setFirstName(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalFirstName__c,savedMappings.legalEntityPrincipalFirstNameD__c,savedMappings.legalEntityPrincipalFirstNameX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().setIsFirstNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalFirstName__c,savedMappings.legalEntityPrincipalFirstNameX__c));
	}
	
	public void populateLEPrincipalLastName(){
    	legalEntityModel.getLegalEntityPrincipal().setLastName(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalLastName__c,savedMappings.legalEntityPrincipalLastNameD__c,savedMappings.legalEntityPrincipalLastNameX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().setIsLastNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalLastName__c,savedMappings.legalEntityPrincipalLastNameX__c));
	}
	
	public void populateLEPrincipalEmailAddress(){
    	legalEntityModel.getLegalEntityPrincipal().setEmailAddress(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalEmailAddress__c,savedMappings.legalEntityPrincipalEmailAddressD__c,savedMappings.legalEntityPrincipalEmailAddressX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().setIsEmailAddressFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalEmailAddress__c,savedMappings.legalEntityPrincipalEmailAddressX__c));
	}
	
	public void populateLEPrincipalContactPhone(){
    	legalEntityModel.getLegalEntityPrincipal().setContactPhone(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalContactPhone__c,savedMappings.legalEntityPrincipalContactPhoneD__c,savedMappings.legalEntityPrincipalContactPhoneX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().setIsContactPhoneFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalContactPhone__c,savedMappings.legalEntityPrincipalContactPhoneX__c));
	}
	
	public void populateLEPrincipalDateOfBirth(){
    	legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalDateOfBirth__c,savedMappings.legalEntityPrincipalDateOfBirthD__c,savedMappings.legalEntityPrincipalDateOfBirthX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().setIsDateOfBirthFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalDateOfBirth__c,savedMappings.legalEntityPrincipalDateOfBirthX__c));
	}
	
	public void populateLEPrincipalDriversLicense(){
    	legalEntityModel.getLegalEntityPrincipal().setDriversLicense(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalDriversLicense__c,savedMappings.legalEntityPrincipalDriversLicenseD__c,savedMappings.legalEntityPrincipalDriversLicenseX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().setIsDriversLicenseFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalDriversLicense__c,savedMappings.legalEntityPrincipalDriversLicenseX__c));
	}
	
	public void populateLEPrincipalDriversLicenseState(){
    	legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalDriversLicenseState__c,savedMappings.legalEntityPrincipalDriversLicenseStateD__c,savedMappings.legalEntityPrincipalDriversLicenseStateX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().setIsDriversLicenseStateFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalDriversLicenseState__c,savedMappings.legalEntityPrincipalDriversLicenseStateX__c));
	}
	
	public void populateLEPrincipalSsn(){
    	legalEntityModel.getLegalEntityPrincipal().setSsn(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalSsn__c,savedMappings.legalEntityPrincipalSsnD__c,savedMappings.legalEntityPrincipalSsnX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().setIsSsnFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalSsn__c,savedMappings.legalEntityPrincipalSsnX__c));
	}
	
    public void populateLEPrincipalAddress1(){
    	legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress1(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalStreetAddress1__c,savedMappings.legalEntityPrincipalStreetAddress1D__c,savedMappings.legalEntityPrincipalStreetAddress1X__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().getAddress().setIsStreetAddress1FromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalStreetAddress1__c,savedMappings.legalEntityPrincipalStreetAddress1X__c));
	}
	
	public void populateLEPrincipalAddress2(){
    	legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress2(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalStreetAddress2__c,savedMappings.legalEntityPrincipalStreetAddress2D__c,savedMappings.legalEntityPrincipalStreetAddress2X__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().getAddress().setIsStreetAddress2FromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalStreetAddress2__c,savedMappings.legalEntityPrincipalStreetAddress2X__c));
	}
	
	public void populateLEPrincipalCity(){
    	legalEntityModel.getLegalEntityPrincipal().getAddress().setCity(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalCity__c,savedMappings.legalEntityPrincipalCityD__c,savedMappings.legalEntityPrincipalCityX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().getAddress().setIsCityFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalCity__c,savedMappings.legalEntityPrincipalCityX__c));
	}
	
	public void populateLEPrincipalStateProvince(){
    	legalEntityModel.getLegalEntityPrincipal().getAddress().setStateProvince(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalStateProvince__c,savedMappings.legalEntityPrincipalStateProvinceD__c,savedMappings.legalEntityPrincipalStateProvinceX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().getAddress().setIsStateProvinceFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalStateProvince__c,savedMappings.legalEntityPrincipalStateProvinceX__c));
	}
	
	public void populateLEPrincipalPostalCode(){
    	legalEntityModel.getLegalEntityPrincipal().getAddress().setPostalCode(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalPostalCode__c,savedMappings.legalEntityPrincipalPostalCodeD__c,savedMappings.legalEntityPrincipalPostalCodeX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().getAddress().setIsPostalCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalPostalCode__c,savedMappings.legalEntityPrincipalPostalCodeX__c));
	}
	
	public void populateLEPrincipalCountryCode(){
    	legalEntityModel.getLegalEntityPrincipal().getAddress().setCountryCode(mappingService.fetchMappedValue(savedMappings.legalEntityPrincipalCountryCode__c,savedMappings.legalEntityPrincipalCountryCodeD__c,savedMappings.legalEntityPrincipalCountryCodeX__c,selectedOpportunityId));
		legalEntityModel.getLegalEntityPrincipal().getAddress().setIsCountryCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.legalEntityPrincipalCountryCode__c,savedMappings.legalEntityPrincipalCountryCodeX__c));
	}
    
    public void populateSMStreetAddress1(){
    	subMerchantModel.getSubMerchantAddress().setStreetAddress1(mappingService.fetchMappedValue(savedMappings.subMerchantStreetAddress1__c,savedMappings.subMerchantStreetAddress1D__c,savedMappings.subMerchantStreetAddress1X__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantAddress().setIsStreetAddress1FromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantStreetAddress1__c,savedMappings.subMerchantStreetAddress1X__c));
	}
	
	public void populateSMStreetAddress2(){
    	subMerchantModel.getSubMerchantAddress().setStreetAddress2(mappingService.fetchMappedValue(savedMappings.subMerchantStreetAddress2__c,savedMappings.subMerchantStreetAddress2D__c,savedMappings.subMerchantStreetAddress2X__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantAddress().setIsStreetAddress2FromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantStreetAddress2__c,savedMappings.subMerchantStreetAddress2X__c));
	}
	
	public void populateSMCity(){
    	subMerchantModel.getSubMerchantAddress().setCity(mappingService.fetchMappedValue(savedMappings.subMerchantCity__c,savedMappings.subMerchantCityD__c,savedMappings.subMerchantCityX__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantAddress().setIsCityFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantCity__c,savedMappings.subMerchantCityX__c));
	}
	
	public void populateSMStateProvince(){
    	subMerchantModel.getSubMerchantAddress().setStateProvince(mappingService.fetchMappedValue(savedMappings.subMerchantStateProvince__c,savedMappings.subMerchantStateProvinceD__c,savedMappings.subMerchantStateProvinceX__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantAddress().setIsStateProvinceFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantStateProvince__c,savedMappings.subMerchantStateProvinceX__c));
	}
	
	public void populateSMCountryCode(){
    	subMerchantModel.getSubMerchantAddress().setCountryCode(mappingService.fetchMappedValue(savedMappings.subMerchantCountryCode__c,savedMappings.subMerchantCountryCodeD__c,savedMappings.subMerchantCountryCodeX__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantAddress().setIsCountryCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantCountryCode__c,savedMappings.subMerchantCountryCodeX__c));
	}
	
	public void populateSMPostalCode(){
    	subMerchantModel.getSubMerchantAddress().setPostalCode(mappingService.fetchMappedValue(savedMappings.subMerchantPostalCode__c,savedMappings.subMerchantPostalCodeD__c,savedMappings.subMerchantPostalCodeX__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantAddress().setIsPostalCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantPostalCode__c,savedMappings.subMerchantPostalCodeX__c));
	}
    
    public void populateSMAmexMid(){
    	subMerchantModel.setsubMerchantAmexMid(mappingService.fetchMappedValue(savedMappings.subMerchantAmexMid__c,savedMappings.subMerchantAmexMidD__c,savedMappings.subMerchantAmexMidX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantAmexMidFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantAmexMid__c,savedMappings.subMerchantAmexMidX__c));
	}
	
	public void populateSMBankAccountNumber(){
    	subMerchantModel.setsubMerchantBankAccountNumber(mappingService.fetchMappedValue(savedMappings.subMerchantBankAccountNumber__c,savedMappings.subMerchantBankAccountNumberD__c,savedMappings.subMerchantBankAccountNumberX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantBankAccountNumberFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantBankAccountNumber__c,savedMappings.subMerchantBankAccountNumberX__c));
	}
	
	public void populateSMBankRoutingNumber(){
    	subMerchantModel.setsubMerchantBankRoutingNumber(mappingService.fetchMappedValue(savedMappings.subMerchantBankRoutingNumber__c,savedMappings.subMerchantBankRoutingNumberD__c,savedMappings.subMerchantBankRoutingNumberX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantBankRoutingNumberFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantBankRoutingNumber__c,savedMappings.subMerchantBankRoutingNumberX__c));
	}
	
	public void populateSMCreateCredentials(){
    	subMerchantModel.setsubMerchantCreateCredentials(mappingService.fetchMappedValue(savedMappings.subMerchantCreateCredentials__c,savedMappings.subMerchantCreateCredentialsD__c,savedMappings.subMerchantCreateCredentialsX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantCreateCredentialsFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantCreateCredentials__c,savedMappings.subMerchantCreateCredentialsX__c));
	}
	
	public void populateSMCustomerServiceNumber(){
    	subMerchantModel.setsubMerchantCustomerServiceNumber(mappingService.fetchMappedValue(savedMappings.subMerchantCustomerServiceNumber__c,savedMappings.subMerchantCustomerServiceNumberD__c,savedMappings.subMerchantCustomerServiceNumberX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantCustomerServiceNumberFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantCustomerServiceNumber__c,savedMappings.subMerchantCustomerServiceNumberX__c));
	}
	
	public void populateSMDiscoverConveyMid(){
    	subMerchantModel.setsubMerchantDiscoverConveyMid(mappingService.fetchMappedValue(savedMappings.subMerchantDiscoverConveyMid__c,savedMappings.subMerchantDiscoverConveyMidD__c,savedMappings.subMerchantDiscoverConveyMidX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantDiscoverConveyMidFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantDiscoverConveyMid__c,savedMappings.subMerchantDiscoverConveyMidX__c));
	}
	
	public void populateSMHardCodeBillingDescriptor(){
    	subMerchantModel.setsubMerchantHardCodeBillingDescriptor(mappingService.fetchMappedValue(savedMappings.subMerchantHardCodeBillingDescriptor__c,savedMappings.subMerchantHardCodeBillingDescD__c,savedMappings.subMerchantHardCodeBillingDescriptorX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantHardCodeBillingDescriptorFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantHardCodeBillingDescriptor__c,savedMappings.subMerchantHardCodeBillingDescriptorX__c));
	}
	
	public void populateSMMaxTransactionAmount(){
    	subMerchantModel.setsubMerchantMaxTransactionAmount(mappingService.fetchMappedValue(savedMappings.subMerchantMaxTransactionAmount__c,savedMappings.subMerchantMaxTransactionAmountD__c,savedMappings.subMerchantMaxTransactionAmountX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantMaxTransactionAmountFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantMaxTransactionAmount__c,savedMappings.subMerchantMaxTransactionAmountX__c));
	}
	
	public void populateSMMerchantCategoryCode(){
    	subMerchantModel.setsubMerchantMerchantCategoryCode(mappingService.fetchMappedValue(savedMappings.subMerchantMerchantCategoryCode__c,savedMappings.subMerchantMerchantCategoryCodeD__c,savedMappings.subMerchantMerchantCategoryCodeX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantMerchantCategoryCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantMerchantCategoryCode__c,savedMappings.subMerchantMerchantCategoryCodeX__c));
	}
	
	public void populateSMMerchantName(){
    	subMerchantModel.setsubMerchantMerchantName(mappingService.fetchMappedValue(savedMappings.subMerchantMerchantName__c,savedMappings.subMerchantMerchantNameD__c,savedMappings.subMerchantMerchantNameX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantMerchantNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantMerchantName__c,savedMappings.subMerchantMerchantNameX__c));
	}
	
	public void populateSMPspMerchantId(){
    	subMerchantModel.setsubMerchantPspMerchantId(mappingService.fetchMappedValue(savedMappings.subMerchantPspMerchantId__c,savedMappings.subMerchantPspMerchantIdD__c,savedMappings.subMerchantPspMerchantIdX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantPspMerchantIdFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantPspMerchantId__c,savedMappings.subMerchantPspMerchantIdX__c));
	}
	
	public void populateSMUrl(){
    	subMerchantModel.setsubMerchantUrl(mappingService.fetchMappedValue(savedMappings.subMerchantUrl__c,savedMappings.subMerchantUrlD__c,savedMappings.subMerchantUrlX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantUrlFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantUrl__c,savedMappings.subMerchantUrlX__c));
	}
	
	public void populateSMeCheckBillingDescriptor(){
    	subMerchantModel.setsubMerchanteCheckBillingDescriptor(mappingService.fetchMappedValue(savedMappings.subMerchanteCheckBillingDescriptor__c,savedMappings.subMerchanteCheckBillingDescD__c,savedMappings.subMerchanteCheckBillingDescriptorX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchanteCheckBillingDescriptorFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchanteCheckBillingDescriptor__c,savedMappings.subMerchanteCheckBillingDescriptorX__c));
	}
	
	public void populateSMeCheckCompanyName(){
    	subMerchantModel.setsubMerchanteCheckCompanyName(mappingService.fetchMappedValue(savedMappings.subMerchanteCheckCompanyName__c,savedMappings.subMerchanteCheckCompanyNameD__c,savedMappings.subMerchanteCheckCompanyNameX__c,selectedOpportunityId));
		subMerchantModel.setIsSubMerchanteCheckCompanyNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchanteCheckCompanyName__c,savedMappings.subMerchanteCheckCompanyNameX__c));
	}
    
    public void populateSMFirstName(){
    	subMerchantModel.getSubMerchantPrimaryContact().setFirstName(mappingService.fetchMappedValue(savedMappings.subMerchantFirstName__c,savedMappings.subMerchantFirstNameD__c,savedMappings.subMerchantFirstNameX__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantPrimaryContact().setIsFirstNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantFirstName__c,savedMappings.subMerchantFirstNameX__c));
	}
	
	public void populateSMLastName(){
    	subMerchantModel.getSubMerchantPrimaryContact().setLastName(mappingService.fetchMappedValue(savedMappings.subMerchantLastName__c,savedMappings.subMerchantLastNameD__c,savedMappings.subMerchantLastNameX__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantPrimaryContact().setIsLastNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantLastName__c,savedMappings.subMerchantLastNameX__c));
	}
	
	public void populateSMEmailAddress(){
    	subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(mappingService.fetchMappedValue(savedMappings.subMerchantEmailAddress__c,savedMappings.subMerchantEmailAddressD__c,savedMappings.subMerchantEmailAddressX__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantPrimaryContact().setIsEmailAddressFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantEmailAddress__c,savedMappings.subMerchantEmailAddressX__c));
	}
	
	public void populateSMPhone(){
    	subMerchantModel.getSubMerchantPrimaryContact().setPhone(mappingService.fetchMappedValue(savedMappings.subMerchantPhone__c,savedMappings.subMerchantPhoneD__c,savedMappings.subMerchantPhoneX__c,selectedOpportunityId));
		subMerchantModel.getSubMerchantPrimaryContact().setIsPhoneFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(savedMappings.subMerchantPhone__c,savedMappings.subMerchantPhoneX__c));
	}
    
    public Pagereference submit(){
        if(areRequiredFieldsFilled()){
            if(isInputDataValid()){
                // Check if username and password are available
                if(String.isEmpty(savedMappings.merchantUsername__c) || String.isEmpty(savedMappings.merchantPassword__c)){
                    ApexPageUtil.addErrorMessage('Merchant Username or Password are not set in the Mappings page. Request Failed.');
                } else {
                    //Make API call 
                    LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
                    // Get the request
                    Httprequest createLegalEntityRequest = LitleRequestXml.getCreateLegalEntityRequest(savedMappings.merchantUsername__c, savedMappings.merchantPassword__c,legalEntityModel, false, savedMappings.litleEnvironment__c);
                    //Log request
                    // create masked entity request
                    Httprequest maskedLegalEntityRequest = LitleRequestXml.getCreateLegalEntityRequest(savedMappings.merchantUsername__c, savedMappings.merchantPassword__c,legalEntityModel, true, savedMappings.litleEnvironment__c);
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
                        }
                        try{
                        	kycService.saveOrUpdateAllKYCObjects(urlOpportunityId, urlAccountId, legalEntityResponse);
                        	ApexPageUtil.addConfirmMessage('Your KYC Information has been successfully recorded. You can view it by clicking on the \'Litle KYC Information\' button.');
                        }catch(DmlException e){
                        	ApexPageUtil.addErrorMessage('There was an error saving KYC Information.');
                        	System.debug('Error saving KYC' + e.getMessage());
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
                
                
                ApexPageUtil.addConfirmMessage(LitleConstants.getResponseMessage(LitleConstants.RESPONSE_APPROVED));    
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
            return new PageReference('/'+urlOpportunityId);
        }else if(String.isNotEmpty(urlAccountId)){
            return new PageReference('/'+urlAccountId);
        }
        return null;
    }
    
    public Boolean isInputDataValid(){
        Boolean isInputValid = true;
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityName())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityName(), 60)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s Name cannot exceed 60 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityDoingBusinessAs())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityDoingBusinessAs(), 60)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Doing Business As cannot exceed 60 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress1())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStreetAddress1(), 60)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s Street Address 1 cannot exceed 60 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress2())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStreetAddress2(), 60)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s Street Address 2 cannot exceed 60 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getCity())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getCity(), 20)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s City cannot exceed 20 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStateProvince())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStateProvince(), 2)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s State/Province cannot exceed 2 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getPostalCode())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getPostalCode(), 5)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s Postal Code cannot exceed 5 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getCountryCode())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getCountryCode(), 3)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s Country Code cannot exceed 3 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getFirstName())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getFirstName(), 20)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Company Representative\'s First Name cannot exceed 20 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getLastName())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getLastName(), 20)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Company Representative\'s Last Name cannot exceed 20 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getEmailAddress())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getEmailAddress(), 100)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Company Representative\'s Email Address cannot exceed 100 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getContactPhone())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getContactPhone(), 10)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Company Representative\'s Contact Phone cannot exceed 10 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDateOfBirth())){
            if(!ValidationUtil.validateDate(legalEntityModel.getLegalEntityPrincipal().getDateOfBirth())){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Company Representative\'s Date of Birth is not in yyyy-mm-dd format');
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDriversLicense())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getDriversLicense(), 25)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Company Representative\'s Drivers License cannot exceed 25 characters');
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState(), 2)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Company Representative\'s Drivers License State cannot exceed 2 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getSsn())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getSsn(), 9)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Company Representative\'s SSN cannot exceed 9 characters');
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityTaxId())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityTaxId(), 9)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s Tax ID cannot exceed 9 characters');
            }
        }
        
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())){
            if(!ValidationUtil.validateInteger(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s Annual Credit Card Sales Volume should be integer');
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
            if(!ValidationUtil.validateBoolean(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Legal Entity\'s Accepted Credit Cards in the Past should be either true or false');
            }
        }
        //subMerchant Validations
        
        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getStreetAddress1())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getStreetAddress1(), 60)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Street Address 1 cannot exceed 60 characters');
            }
        }
        
        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getStreetAddress2())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getStreetAddress2(), 60)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Street Address 2 cannot exceed 60 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getCity())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getCity(), 20)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s City cannot exceed 20 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getStateProvince())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getStateProvince(), 2)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s State/Province cannot exceed 2 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getPostalCode())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getPostalCode(), 5)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Postal Code cannot exceed 5 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getCountryCode())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getCountryCode(), 3)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Country Code cannot exceed 3 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAmexMid())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAmexMid(), 15)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Amex Merchant ID cannot exceed 15 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantBankAccountNumber())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantBankAccountNumber(), 50)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Bank Account Number cannot exceed 50 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantBankRoutingNumber())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantBankRoutingNumber(), 50)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Bank Routing Number cannot exceed 50 characters');
            }
        }
        
        if(String.isNotEmpty(subMerchantModel.getSubMerchantCreateCredentials())){
            if(!ValidationUtil.validateBoolean(subMerchantModel.getSubMerchantCreateCredentials())){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Create Connectivity Credentials should be either true or false');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantCustomerServiceNumber())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantCustomerServiceNumber(), 13)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Customer Service Number cannot exceed 13 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantDiscoverConveyMid())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantDiscoverConveyMid(), 15)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Discover Merchant ID cannot exceed 15 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantHardCodeBillingDescriptor())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantHardCodeBillingDescriptor(), 25)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Default Billing Descriptor cannot exceed 25 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantMaxTransactionAmount())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMaxTransactionAmount(), 19)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Max Transaction Amount cannot exceed 19 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantMerchantCategoryCode())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMerchantCategoryCode(), 4)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Merchant Category Code cannot exceed 4 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantMerchantName())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMerchantName(), 50)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Merchant Name cannot exceed 50 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getFirstName())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getFirstName(), 20)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Primary Contact\'s First Name cannot exceed 20 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getLastName())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getLastName(), 20)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Primary Contact\'s Last Name cannot exceed 20 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress(), 100)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Primary Contact\'s Email Address cannot exceed 100 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getPhone())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getPhone(), 13)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Primary Contact\'s Phone cannot exceed 13 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPspMerchantId())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPspMerchantId(), 32)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('PayFac Sub-Merchant ID cannot exceed 32 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantUrl())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantUrl(), 120)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s URL cannot exceed 120 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchanteCheckBillingDescriptor())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckBillingDescriptor(), 10)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s eCheck Billing Descriptor cannot exceed 10 characters');
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchanteCheckCompanyName())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckCompanyName(), 16)){
                isInputValid = false;
                ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s eCheck Company Name cannot exceed 16 characters');
            }
        }
        
        return isInputValid;
    }
    
    public Boolean areRequiredFieldsFilled(){
        Boolean isAllRequiredFieldsPresent = true;
        if(String.isEmpty(legalEntityModel.getLegalEntityName())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Legal Entity Name is Required');
    
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress1())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Legal Entity\'s Street Address 1 is Required');
    
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getCountryCode())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Legal Entity\'s Country Code is Required');
    
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getLastName())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Company Representative\'s Last Name is Required');
    
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getFirstName())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Company Representative\'s First Name is Required');
    
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityType())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Legal Entity Type is Required');
        }else{
            if(legalEntityModel.getLegalEntityType().equalsIgnoreCase(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name())){
                if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getCity())){
                    isAllRequiredFieldsPresent = false;
                    ApexPageUtil.addErrorMessage('Legal Entity\'s City is Required');
        
                }
                if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getStateProvince())){
                    isAllRequiredFieldsPresent = false;
                    ApexPageUtil.addErrorMessage('Legal Entity\'s State/Province is Required');
        
                }
                if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getPostalCode())){
                    isAllRequiredFieldsPresent = false;
                    ApexPageUtil.addErrorMessage('Legal Entity\'s Postal Code is Required');
        
                }
                if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getSsn())){
                    isAllRequiredFieldsPresent = false;
                    ApexPageUtil.addErrorMessage('Company Representative\'s SSN is Required');
        
                }
            }else{
                if(String.isEmpty(legalEntityModel.getLegalEntityTaxId())){
                    isAllRequiredFieldsPresent = false;
                    ApexPageUtil.addErrorMessage('Legal Entity\'s Tax ID is Required');
        
                }
            }
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Annual Credit Card Sales Volume is Required');
    
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Accepted Credit Cards in the Past is Required');
    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getCountryCode())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Country Code is Required');
    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantBankAccountNumber())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Bank Account Number is Required');
    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantBankRoutingNumber())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Bank Routing Number is Required');
    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantCustomerServiceNumber())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Customer Service Number is Required');
    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantHardCodeBillingDescriptor())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Default Billing Descriptor is Required');
    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantMaxTransactionAmount())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Max Transaction Amount is Required');
    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantMerchantCategoryCode())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Merchant Category Code is Required');
    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantMerchantName())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Merchant Name is Required');
    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantPspMerchantId())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('PayFac Sub-Merchant ID is Required');
    
        }
        
        // new required fields as per the api
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getStreetAddress1())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Street Address 1 is Required');
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getCity())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s City is Required');
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getPostalCode())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Postal Code is Required');
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getStateProvince())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s State/Province is Required');
        }
        
        if(String.isEmpty(subMerchantModel.getSubMerchantPrimaryContact().getFirstName())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Primary Contact\'s First Name is Required');
        }
        
        if(String.isEmpty(subMerchantModel.getSubMerchantPrimaryContact().getLastName())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Primary Contact\'s Last Name is Required');
        }
        
        if(String.isEmpty(subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Primary Contact\'s Email Address is Required');
        }
        
        if(String.isEmpty(subMerchantModel.getSubMerchantPrimaryContact().getPhone())){
            isAllRequiredFieldsPresent = false;
            ApexPageUtil.addErrorMessage('Primary Contact\'s Phone is Required');
        }
        
        return isAllRequiredFieldsPresent;      
        
    }
}