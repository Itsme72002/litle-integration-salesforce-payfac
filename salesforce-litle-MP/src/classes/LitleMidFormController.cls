public class LitleMidFormController {
	
	public LegalEntityModel legalEntityModel{get; set;}
	public SubMerchantModel subMerchantModel{get; set;}
	public SalesforceLitleMappingsObject__c savedMappings {get; set;}
	public String urlAccountId {get; set;}
	public String urlOpportunityId {get; set;}
	public List<SelectOption> legalEntityTypeList{get; set;}
	
	public LegalEntityResponse legalEntityResponse {get; set;}
	public SubMerchantResponse subMerchantResponse {get; set;}
	// stores litle mid / error information
	public String litleMid;
	public List<SelectOption> opportunityOptions {get; set;}
	public String selectedOpportunityId {get; set;}
	public Boolean isOpportunityMappingPresent{get; set;}
	
	public LitleMidFormController(){
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
        
        legalEntityTypeList = new List<SelectOption>();
        for (LegalEntityType.LegalEntityTypeEnum s: LegalEntityType.LegalEntityTypeEnum.values()){
        	legalEntityTypeList.add(new SelectOption(s.name(), LegalEntityType.stringValue(s.name())));
        }
        savedMappings = new SalesforceLitleMappingsObject__c();
		legalEntityModel = new LegalEntityModel();
		subMerchantModel = new SubMerchantModel();
		legalEntityResponse = new LegalEntityResponse();
		List<SalesforceLitleMappingsObject__c> mappingRecords 
    			= [select id, name, legalEntityAnnualCreditCardSalesVolume__c, legalEntityAnnualCreditCardSalesVolumeD__c, legalEntityAnnualCreditCardSalesVolumeX__c, legalEntityCity__c, legalEntityCityD__c, legalEntityCityX__c, legalEntityContactPhone__c, legalEntityContactPhoneD__c, legalEntityContactPhoneX__c, legalEntityCountryCode__c, legalEntityCountryCodeD__c, legalEntityCountryCodeX__c, legalEntityDateOfBirth__c, legalEntityDateOfBirthX__c, legalEntityDoingBusinessAs__c, legalEntityDoingBusinessAsD__c, legalEntityDoingBusinessAsX__c, legalEntityDriversLicense__c, legalEntityDriversLicenseD__c, legalEntityDriversLicenseState__c, legalEntityDriversLicenseStateD__c, legalEntityDriversLicenseStateX__c, legalEntityDriversLicenseX__c, legalEntityPrincipalEmailAddress__c, legalEntityPrincipalEmailAddressD__c, legalEntityPrincipalEmailAddressX__c, legalEntityFirstName__c, legalEntityFirstNameD__c, legalEntityFirstNameX__c, legalEntityHasAcceptedCreditCards__c, legalEntityHasAcceptedCreditCardsD__c, legalEntityHasAcceptedCreditCardsX__c, legalEntityIsExclusiveToPsp__c, legalEntityIsExclusiveToPspD__c, legalEntityIsExclusiveToPspX__c, legalEntityIsPciComplianceValidated__c, legalEntityIsPciComplianceValidatedD__c, legalEntityIsPciComplianceValidatedX__c, legalEntityLastName__c, legalEntityLastNameD__c, legalEntityLastNameX__c, legalEntityMostRecentlyPassedScan__c, legalEntityMostRecentlyPassedScanD__c, legalEntityMostRecentlyPassedScanX__c, legalEntityName__c, legalEntityNameD__c, legalEntityNameX__c, legalEntityPciLevel__c, legalEntityPciLevelD__c, legalEntityPciLevelX__c, legalEntityPostalCode__c, legalEntityPostalCodeD__c, legalEntityPostalCodeX__c, legalEntityPrincipalDateOfBirth__c, legalEntityPrincipalDateOfBirthD__c, legalEntityPrincipalDateOfBirthX__c, legalEntityPrincipalDriversLicense__c, legalEntityPrincipalDriversLicenseD__c, legalEntityPrincipalDriversLicenseState__c, legalEntityPrincipalDriversLicenseStateD__c, legalEntityPrincipalDriversLicenseStateX__c, legalEntityPrincipalDriversLicenseX__c, legalEntityPrincipalFirstName__c, legalEntityPrincipalFirstNameD__c, legalEntityPrincipalFirstNameX__c, legalEntityPrincipalLastName__c, legalEntityPrincipalLastNameD__c, legalEntityPrincipalLastNameX__c, legalEntityPrincipalSsn__c, legalEntityPrincipalSsnD__c, legalEntityPrincipalSsnX__c, legalEntityQualifiedSecurityAssessor__c, legalEntityQualifiedSecurityAssessorD__c, legalEntityQualifiedSecurityAssessorX__c, legalEntityReportOnCompliance__c, legalEntityReportOnComplianceD__c, legalEntityReportOnComplianceX__c, legalEntityScanningVendor__c, legalEntityScanningVendorD__c, legalEntityScanningVendorX__c, legalEntitySsn__c, legalEntitySsnD__c, legalEntitySsnX__c, legalEntityStateProvince__c, legalEntityStateProvinceD__c, legalEntityStateProvinceX__c, legalEntityStreetAddress1__c, legalEntityStreetAddress1D__c, legalEntityStreetAddress1X__c, legalEntityStreetAddress2__c, legalEntityStreetAddress2D__c, legalEntityStreetAddress2X__c, legalEntityTaxId__c, legalEntityTaxIdD__c, legalEntityTaxIdX__c, legalEntityType__c, legalEntityTypeD__c, legalEntityTypeX__c, merchantPassword__c, merchantUsername__c, subMerchantAmexMid__c, subMerchantAmexMidD__c, subMerchantAmexMidX__c, subMerchantBankAccountNumber__c, subMerchantBankAccountNumberD__c, subMerchantBankAccountNumberX__c, subMerchantBankRoutingNumber__c, subMerchantBankRoutingNumberD__c, subMerchantBankRoutingNumberX__c, subMerchantCity__c, subMerchantCityD__c, subMerchantCityX__c, subMerchantCountryCode__c, subMerchantCountryCodeD__c, subMerchantCountryCodeX__c, subMerchantCreateCredentials__c, subMerchantCreateCredentialsD__c, subMerchantCreateCredentialsX__c, subMerchantCustomerServiceNumber__c, subMerchantCustomerServiceNumberD__c, subMerchantCustomerServiceNumberX__c, subMerchantDiscoverConveyMid__c, subMerchantDiscoverConveyMidD__c, subMerchantDiscoverConveyMidX__c, subMerchanteCheckBillingDescD__c, subMerchanteCheckBillingDescriptor__c, subMerchanteCheckBillingDescriptorX__c, subMerchanteCheckCompanyName__c, subMerchanteCheckCompanyNameD__c, subMerchanteCheckCompanyNameX__c, subMerchantEmailAddress__c, subMerchantEmailAddressD__c, subMerchantEmailAddressX__c, subMerchantFirstName__c, subMerchantFirstNameD__c, subMerchantFirstNameX__c, subMerchantHardCodeBillingDescD__c, subMerchantHardCodeBillingDescriptor__c, subMerchantHardCodeBillingDescriptorX__c, subMerchantLastName__c, subMerchantLastNameD__c, subMerchantLastNameX__c, subMerchantMaxTransactionAmount__c, subMerchantMaxTransactionAmountD__c, subMerchantMaxTransactionAmountX__c, subMerchantMerchantCategoryCode__c, subMerchantMerchantCategoryCodeD__c, subMerchantMerchantCategoryCodeX__c, subMerchantMerchantName__c, subMerchantMerchantNameD__c, subMerchantMerchantNameX__c, subMerchantPhone__c, subMerchantPhoneD__c, subMerchantPhoneX__c, subMerchantPostalCode__c, subMerchantPostalCodeD__c, subMerchantPostalCodeX__c, subMerchantPspMerchantId__c, subMerchantPspMerchantIdD__c, subMerchantPspMerchantIdX__c, subMerchantStateProvince__c, subMerchantStateProvinceD__c, subMerchantStateProvinceX__c, subMerchantStreetAddress1__c, subMerchantStreetAddress1D__c, subMerchantStreetAddress1X__c, subMerchantStreetAddress2__c, subMerchantStreetAddress2D__c, subMerchantStreetAddress2X__c, subMerchantUrl__c, subMerchantUrlD__c, subMerchantUrlX__c, legalEntityPrincipalContactPhone__c, legalEntityPrincipalContactPhoneD__c, legalEntityPrincipalContactPhoneX__c, legalEntityPrincipalCity__c, legalEntityPrincipalCityD__c, legalEntityPrincipalCityX__c, legalEntityPrincipalCountryCode__c, legalEntityPrincipalCountryCodeD__c, legalEntityPrincipalCountryCodeX__c, legalEntityPrincipalPostalCode__c, legalEntityPrincipalPostalCodeD__c, legalEntityPrincipalPostalCodeX__c, legalEntityPrincipalStateProvince__c, legalEntityPrincipalStateProvinceD__c, legalEntityPrincipalStateProvinceX__c, legalEntityPrincipalStreetAddress1__c, legalEntityPrincipalStreetAddress1D__c, legalEntityPrincipalStreetAddress1X__c, legalEntityPrincipalStreetAddress2__c, legalEntityPrincipalStreetAddress2D__c, legalEntityPrincipalStreetAddress2X__c from SalesforceLitleMappingsObject__c limit 1];
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
			system.debug('!why: ' + subMerchantModel.getIsSubMerchantMerchantNameFromOpportunity());
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
			
			if(legalEntityModel.getLegalEntityPci().getIsReportOnComplianceFromOpportunity()){
				populateLEReportOnCompliance();
			}
			
			if(legalEntityModel.getLegalEntityPci().getIsMostRecentlyPassedScanFromOpportunity()){
				populateLEMostRecentlyPassedScan();
			}
			
			if(legalEntityModel.getLegalEntityPci().getIsQualifiedSecurityAssessorFromOpportunity()){
				populateLEQualifiedSecurityAssessor();
			}
			
			if(legalEntityModel.getLegalEntityPci().getIsScanningVendorFromOpportunity()){
				populateLEScanningVendor();
			}
			
			if(legalEntityModel.getLegalEntityPci().getIsPciLevelFromOpportunity()){
				populateLEPciLevel();
			}
			
			if(legalEntityModel.getLegalEntityPci().getIsIsPciComplianceValidatedFromOpportunity()){
				populateLEIsPciComplianceValidated();
			}
			
			if(legalEntityModel.getLegalEntityPci().getIsIsExclusiveToPspFromOpportunity()){
				populateLEIsExclusiveToPsp();
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
	//Returns the select option list from the given list of string values
	// starting from the given default value e.g '-- Select Option --'
	/*public List<Selectoption> getSelectOptionList(List<String> values, String defaultValue){
		List<SelectOption> optionList = new List<SelectOption>();
		if(values != null && !values.isEmpty()){
			optionList.add(new Selectoption('', defaultValue));
			for(String value: values){
				optionList.add(new Selectoption(value, value));
			}
		}
		return optionList;
	}*/
	
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
		populateLEIsExclusiveToPsp();
		populateLEIsPciComplianceValidated();
		populateLEPciLevel();
		populateLEScanningVendor();
		populateLEQualifiedSecurityAssessor();
		populateLEMostRecentlyPassedScan();
		populateLEReportOnCompliance();
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
		if(!savedMappings.legalEntityNameX__c){
			legalEntityModel.setLegalEntityName(savedMappings.legalEntityNameD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityName__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.setLegalEntityName(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.setLegalEntityName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.setIsNameFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.setLegalEntityName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEType(){
		legalEntityModel.setLegalEntityType(savedMappings.legalEntityTypeD__c);
	}
	
	public void populateLEDoingBusinessAs(){
		if(!savedMappings.legalEntityDoingBusinessAsX__c){
			legalEntityModel.setLegalEntityDoingBusinessAs(savedMappings.legalEntityDoingBusinessAsD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityDoingBusinessAs__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.setLegalEntityDoingBusinessAs(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.setLegalEntityDoingBusinessAs(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.setIsDoingBusinessAsFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.setLegalEntityDoingBusinessAs(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEAddress1(){
		if(!savedMappings.legalEntityStreetAddress1X__c){
			legalEntityModel.getLegalEntityAddress().setStreetAddress1(savedMappings.legalEntityStreetAddress1D__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityStreetAddress1__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setStreetAddress1(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setStreetAddress1(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityAddress().setIsStreetAddress1FromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityAddress().setStreetAddress1(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEAddress2(){
		if(!savedMappings.legalEntityStreetAddress2X__c){
			legalEntityModel.getLegalEntityAddress().setStreetAddress2(savedMappings.legalEntityStreetAddress2D__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityStreetAddress2__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setStreetAddress2(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setStreetAddress2(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityAddress().setIsStreetAddress2FromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityAddress().setStreetAddress2(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLECity(){
		if(!savedMappings.legalEntityCityX__c){
			legalEntityModel.getLegalEntityAddress().setCity(savedMappings.legalEntityCityD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityCity__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setCity(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setCity(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityAddress().setIsCityFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityAddress().setCity(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	/////////////////////////////////////////////////////////////
	public void populateLEStateProvince(){
		if(!savedMappings.legalEntityStateProvinceX__c){
			legalEntityModel.getLegalEntityAddress().setStateProvince(savedMappings.legalEntityStateProvinceD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityStateProvince__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setStateProvince(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setStateProvince(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityAddress().setIsStateProvinceFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityAddress().setStateProvince(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPostalCode(){
		if(!savedMappings.legalEntityPostalCodeX__c){
			legalEntityModel.getLegalEntityAddress().setPostalCode(savedMappings.legalEntityPostalCodeD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPostalCode__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setPostalCode(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setPostalCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityAddress().setIsPostalCodeFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityAddress().setPostalCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLECountryCode(){
		if(!savedMappings.legalEntityCountryCodeX__c){
			legalEntityModel.getLegalEntityAddress().setCountryCode(savedMappings.legalEntityCountryCodeD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityCountryCode__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setCountryCode(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityAddress().setCountryCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityAddress().setIsCountryCodeFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityAddress().setCountryCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalFirstName(){
		if(!savedMappings.legalEntityPrincipalFirstNameX__c){
			legalEntityModel.getLegalEntityPrincipal().setFirstName(savedMappings.legalEntityPrincipalFirstNameD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalFirstName__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setFirstName(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setFirstName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().setIsFirstNameFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().setFirstName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalLastName(){
		if(!savedMappings.legalEntityPrincipalLastNameX__c){
			legalEntityModel.getLegalEntityPrincipal().setLastName(savedMappings.legalEntityPrincipalLastNameD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalLastName__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setLastName(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setLastName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().setIsLastNameFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().setLastName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalEmailAddress(){
		if(!savedMappings.legalEntityPrincipalEmailAddressX__c){
			legalEntityModel.getLegalEntityPrincipal().setEmailAddress(savedMappings.legalEntityPrincipalEmailAddressD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalEmailAddress__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setEmailAddress(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setEmailAddress(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().setIsEmailAddressFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().setEmailAddress(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEContactPhone(){
		if(!savedMappings.legalEntityContactPhoneX__c){
			legalEntityModel.setLegalEntityContactPhone(savedMappings.legalEntityContactPhoneD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityContactPhone__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.setLegalEntityContactPhone(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.setLegalEntityContactPhone(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.setIsContactPhoneFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.setLegalEntityContactPhone(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalContactPhone(){
		if(!savedMappings.legalEntityPrincipalContactPhoneX__c){
			legalEntityModel.getLegalEntityPrincipal().setContactPhone(savedMappings.legalEntityPrincipalContactPhoneD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalContactPhone__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setContactPhone(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setContactPhone(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().setIsContactPhoneFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().setContactPhone(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalDateOfBirth(){
		if(!savedMappings.legalEntityPrincipalDateOfBirthX__c){
			legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(savedMappings.legalEntityPrincipalDateOfBirthD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalDateOfBirth__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().setIsDateOfBirthFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalDriversLicense(){
		if(!savedMappings.legalEntityPrincipalDriversLicenseX__c){
			legalEntityModel.getLegalEntityPrincipal().setDriversLicense(savedMappings.legalEntityPrincipalDriversLicenseD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalDriversLicense__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setDriversLicense(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setDriversLicense(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().setIsDriversLicenseFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().setDriversLicense(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalDriversLicenseState(){
		if(!savedMappings.legalEntityPrincipalDriversLicenseStateX__c){
			legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(savedMappings.legalEntityPrincipalDriversLicenseStateD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalDriversLicenseState__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().setIsDriversLicenseStateFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalSsn(){
		if(!savedMappings.legalEntityPrincipalSsnX__c){
			legalEntityModel.getLegalEntityPrincipal().setSsn(savedMappings.legalEntityPrincipalSsnD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalSsn__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setSsn(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().setSsn(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().setIsSsnFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().setSsn(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLETaxId(){
		if(!savedMappings.legalEntityTaxIdX__c){
			legalEntityModel.setLegalEntityTaxId(savedMappings.legalEntityTaxIdD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityTaxId__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.setLegalEntityTaxId(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.setLegalEntityTaxId(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.setIsTaxIdFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.setLegalEntityTaxId(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEIsExclusiveToPsp(){
		if(!savedMappings.legalEntityIsExclusiveToPspX__c){
			legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(savedMappings.legalEntityIsExclusiveToPspD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityIsExclusiveToPsp__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPci().setIsIsExclusiveToPspFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEIsPciComplianceValidated(){
		if(!savedMappings.legalEntityIsPciComplianceValidatedX__c){
			legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(savedMappings.legalEntityIsPciComplianceValidatedD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityIsPciComplianceValidated__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPci().setIsIsPciComplianceValidatedFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPciLevel(){
		if(!savedMappings.legalEntityPciLevelX__c){
			legalEntityModel.getLegalEntityPci().setPciLevel(savedMappings.legalEntityPciLevelD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPciLevel__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setPciLevel(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setPciLevel(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPci().setIsPciLevelFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPci().setPciLevel(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEScanningVendor(){
		if(!savedMappings.legalEntityScanningVendorX__c){
			legalEntityModel.getLegalEntityPci().setScanningVendor(savedMappings.legalEntityScanningVendorD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityScanningVendor__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setScanningVendor(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setScanningVendor(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPci().setIsScanningVendorFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPci().setScanningVendor(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEQualifiedSecurityAssessor(){
		if(!savedMappings.legalEntityQualifiedSecurityAssessorX__c){
			legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(savedMappings.legalEntityQualifiedSecurityAssessorD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityQualifiedSecurityAssessor__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPci().setIsQualifiedSecurityAssessorFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEMostRecentlyPassedScan(){
		if(!savedMappings.legalEntityMostRecentlyPassedScanX__c){
			legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(savedMappings.legalEntityMostRecentlyPassedScanD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityMostRecentlyPassedScan__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPci().setIsMostRecentlyPassedScanFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEReportOnCompliance(){
		if(!savedMappings.legalEntityReportOnComplianceX__c){
			legalEntityModel.getLegalEntityPci().setReportOnCompliance(savedMappings.legalEntityReportOnComplianceD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityReportOnCompliance__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setReportOnCompliance(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPci().setReportOnCompliance(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPci().setIsReportOnComplianceFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPci().setReportOnCompliance(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEAnnualCreditCardSalesVolume(){
		if(!savedMappings.legalEntityAnnualCreditCardSalesVolumeX__c){
			legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(savedMappings.legalEntityAnnualCreditCardSalesVolumeD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityAnnualCreditCardSalesVolume__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.setIsAnnualCreditCardSalesVolumeFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEHasAcceptedCreditCards(){
		if(!savedMappings.legalEntityHasAcceptedCreditCardsX__c){
			legalEntityModel.setLegalEntityHasAcceptedCreditCards(savedMappings.legalEntityHasAcceptedCreditCardsD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityHasAcceptedCreditCards__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.setLegalEntityHasAcceptedCreditCards(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.setLegalEntityHasAcceptedCreditCards(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.setIsHasAcceptedCreditCardsFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.setLegalEntityHasAcceptedCreditCards(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalAddress1(){
		if(!savedMappings.legalEntityPrincipalStreetAddress1X__c){
			legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress1(savedMappings.legalEntityPrincipalStreetAddress1D__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalStreetAddress1__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress1(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress1(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().getAddress().setIsStreetAddress1FromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress1(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalAddress2(){
		if(!savedMappings.legalEntityPrincipalStreetAddress2X__c){
			legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress2(savedMappings.legalEntityPrincipalStreetAddress2D__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalStreetAddress2__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress2(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress2(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().getAddress().setIsStreetAddress2FromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().getAddress().setStreetAddress2(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalCity(){
		if(!savedMappings.legalEntityPrincipalCityX__c){
			legalEntityModel.getLegalEntityPrincipal().getAddress().setCity(savedMappings.legalEntityPrincipalCityD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalCity__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setCity(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setCity(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().getAddress().setIsCityFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().getAddress().setCity(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalStateProvince(){
		if(!savedMappings.legalEntityPrincipalStateProvinceX__c){
			legalEntityModel.getLegalEntityPrincipal().getAddress().setStateProvince(savedMappings.legalEntityPrincipalStateProvinceD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalStateProvince__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setStateProvince(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setStateProvince(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().getAddress().setIsStateProvinceFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().getAddress().setStateProvince(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalPostalCode(){
		if(!savedMappings.legalEntityPrincipalPostalCodeX__c){
			legalEntityModel.getLegalEntityPrincipal().getAddress().setPostalCode(savedMappings.legalEntityPrincipalPostalCodeD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalPostalCode__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setPostalCode(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setPostalCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().getAddress().setIsPostalCodeFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().getAddress().setPostalCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateLEPrincipalCountryCode(){
		if(!savedMappings.legalEntityPrincipalCountryCodeX__c){
			legalEntityModel.getLegalEntityPrincipal().getAddress().setCountryCode(savedMappings.legalEntityPrincipalCountryCodeD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.legalEntityPrincipalCountryCode__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setCountryCode(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						legalEntityModel.getLegalEntityPrincipal().getAddress().setCountryCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						legalEntityModel.getLegalEntityPrincipal().getAddress().setIsCountryCodeFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							legalEntityModel.getLegalEntityPrincipal().getAddress().setCountryCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMStreetAddress1(){
		if(!savedMappings.subMerchantStreetAddress1X__c){
			subMerchantModel.getSubMerchantAddress().setStreetAddress1(savedMappings.subMerchantStreetAddress1D__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantStreetAddress1__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setStreetAddress1(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setStreetAddress1(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantAddress().setIsStreetAddress1FromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantAddress().setStreetAddress1(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMStreetAddress2(){
		if(!savedMappings.subMerchantStreetAddress2X__c){
			subMerchantModel.getSubMerchantAddress().setStreetAddress2(savedMappings.subMerchantStreetAddress2D__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantStreetAddress2__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setStreetAddress2(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setStreetAddress2(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantAddress().setIsStreetAddress2FromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantAddress().setStreetAddress2(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMCity(){
		if(!savedMappings.subMerchantCityX__c){
			subMerchantModel.getSubMerchantAddress().setCity(savedMappings.subMerchantCityD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantCity__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setCity(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setCity(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantAddress().setIsCityFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantAddress().setCity(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMStateProvince(){
		if(!savedMappings.subMerchantStateProvinceX__c){
			subMerchantModel.getSubMerchantAddress().setStateProvince(savedMappings.subMerchantStateProvinceD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantStateProvince__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setStateProvince(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setStateProvince(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantAddress().setIsStateProvinceFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantAddress().setStateProvince(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMPostalCode(){
		if(!savedMappings.subMerchantPostalCodeX__c){
			subMerchantModel.getSubMerchantAddress().setPostalCode(savedMappings.subMerchantPostalCodeD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantPostalCode__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setPostalCode(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setPostalCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantAddress().setIsPostalCodeFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantAddress().setPostalCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMCountryCode(){
		if(!savedMappings.subMerchantCountryCodeX__c){
			subMerchantModel.getSubMerchantAddress().setCountryCode(savedMappings.subMerchantCountryCodeD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantCountryCode__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setCountryCode(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantAddress().setCountryCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantAddress().setIsCountryCodeFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantAddress().setCountryCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMAmexMid(){
		if(!savedMappings.subMerchantAmexMidX__c){
			subMerchantModel.setsubMerchantAmexMid(savedMappings.subMerchantAmexMidD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantAmexMid__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantAmexMid(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantAmexMid(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantAmexMidFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantAmexMid(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMBankAccountNumber(){
		if(!savedMappings.subMerchantBankAccountNumberX__c){
			subMerchantModel.setsubMerchantBankAccountNumber(savedMappings.subMerchantBankAccountNumberD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantBankAccountNumber__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantBankAccountNumber(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantBankAccountNumber(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantBankAccountNumberFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantBankAccountNumber(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMBankRoutingNumber(){
		if(!savedMappings.subMerchantBankRoutingNumberX__c){
			subMerchantModel.setsubMerchantBankRoutingNumber(savedMappings.subMerchantBankRoutingNumberD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantBankRoutingNumber__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantBankRoutingNumber(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantBankRoutingNumber(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantBankRoutingNumberFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantBankRoutingNumber(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMCreateCredentials(){
		if(!savedMappings.subMerchantCreateCredentialsX__c){
			subMerchantModel.setsubMerchantCreateCredentials(savedMappings.subMerchantCreateCredentialsD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantCreateCredentials__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantCreateCredentials(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantCreateCredentials(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantCreateCredentialsFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantCreateCredentials(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMCustomerServiceNumber(){
		if(!savedMappings.subMerchantCustomerServiceNumberX__c){
			subMerchantModel.setsubMerchantCustomerServiceNumber(savedMappings.subMerchantCustomerServiceNumberD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantCustomerServiceNumber__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantCustomerServiceNumber(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantCustomerServiceNumber(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantCustomerServiceNumberFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantCustomerServiceNumber(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMDiscoverConveyMid(){
		if(!savedMappings.subMerchantDiscoverConveyMidX__c){
			subMerchantModel.setsubMerchantDiscoverConveyMid(savedMappings.subMerchantDiscoverConveyMidD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantDiscoverConveyMid__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantDiscoverConveyMid(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantDiscoverConveyMid(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantDiscoverConveyMidFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantDiscoverConveyMid(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMHardCodeBillingDescriptor(){
		if(!savedMappings.subMerchantHardCodeBillingDescriptorX__c){
			subMerchantModel.setsubMerchantHardCodeBillingDescriptor(savedMappings.subMerchantHardCodeBillingDescD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantHardCodeBillingDescriptor__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantHardCodeBillingDescriptor(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantHardCodeBillingDescriptor(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantHardCodeBillingDescriptorFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantHardCodeBillingDescriptor(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMMaxTransactionAmount(){
		if(!savedMappings.subMerchantMaxTransactionAmountX__c){
			subMerchantModel.setsubMerchantMaxTransactionAmount(savedMappings.subMerchantMaxTransactionAmountD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantMaxTransactionAmount__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantMaxTransactionAmount(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantMaxTransactionAmount(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantMaxTransactionAmountFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantMaxTransactionAmount(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMMerchantCategoryCode(){
		if(!savedMappings.subMerchantMerchantCategoryCodeX__c){
			subMerchantModel.setsubMerchantMerchantCategoryCode(savedMappings.subMerchantMerchantCategoryCodeD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantMerchantCategoryCode__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantMerchantCategoryCode(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantMerchantCategoryCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantMerchantCategoryCodeFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantMerchantCategoryCode(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMMerchantName(){
		if(!savedMappings.subMerchantMerchantNameX__c){
			subMerchantModel.setsubMerchantMerchantName(savedMappings.subMerchantMerchantNameD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantMerchantName__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantMerchantName(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantMerchantName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantMerchantNameFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantMerchantName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMFirstName(){
		if(!savedMappings.subMerchantFirstNameX__c){
			subMerchantModel.getSubMerchantPrimaryContact().setFirstName(savedMappings.subMerchantFirstNameD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantFirstName__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantPrimaryContact().setFirstName(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantPrimaryContact().setFirstName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantPrimaryContact().setIsFirstNameFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantPrimaryContact().setFirstName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMLastName(){
		if(!savedMappings.subMerchantLastNameX__c){
			subMerchantModel.getSubMerchantPrimaryContact().setLastName(savedMappings.subMerchantLastNameD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantLastName__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantPrimaryContact().setLastName(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantPrimaryContact().setLastName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantPrimaryContact().setIsLastNameFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantPrimaryContact().setLastName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMEmailAddress(){
		if(!savedMappings.subMerchantEmailAddressX__c){
			subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(savedMappings.subMerchantEmailAddressD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantEmailAddress__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantPrimaryContact().setIsEmailAddressFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMPhone(){
		if(!savedMappings.subMerchantPhoneX__c){
			subMerchantModel.getSubMerchantPrimaryContact().setPhone(savedMappings.subMerchantPhoneD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantPhone__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.getSubMerchantPrimaryContact().setPhone(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.getSubMerchantPrimaryContact().setPhone(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.getSubMerchantPrimaryContact().setIsPhoneFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.getSubMerchantPrimaryContact().setPhone(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMPspMerchantId(){
		if(!savedMappings.subMerchantPspMerchantIdX__c){
			subMerchantModel.setsubMerchantPspMerchantId(savedMappings.subMerchantPspMerchantIdD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantPspMerchantId__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantPspMerchantId(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantPspMerchantId(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantPspMerchantIdFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantPspMerchantId(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMUrl(){
		if(!savedMappings.subMerchantUrlX__c){
			subMerchantModel.setsubMerchantUrl(savedMappings.subMerchantUrlD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchantUrl__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchantUrl(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchantUrl(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchantUrlFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchantUrl(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMeCheckBillingDescriptor(){
		if(!savedMappings.subMerchanteCheckBillingDescriptorX__c){
			subMerchantModel.setsubMerchanteCheckBillingDescriptor(savedMappings.subMerchanteCheckBillingDescD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchanteCheckBillingDescriptor__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchanteCheckBillingDescriptor(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchanteCheckBillingDescriptor(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchanteCheckBillingDescriptorFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchanteCheckBillingDescriptor(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public void populateSMeCheckCompanyName(){
		if(!savedMappings.subMerchanteCheckCompanyNameX__c){
			subMerchantModel.setsubMerchanteCheckCompanyName(savedMappings.subMerchanteCheckCompanyNameD__c);
		}else{
			String sObjectName, sObjectFieldName;
			//split saved mapping to get sobject type and its field name
			List<String> customObjectFieldParts = splitSObjectNameAndField(savedMappings.subMerchanteCheckCompanyName__c);
			if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
				sObjectName = customObjectFieldParts.get(0);
				sObjectFieldName = customObjectFieldParts.get(1);
			}
			if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
				if(sObjectName.equalsIgnoreCase('Account')){
					if(String.isNotEmpty(urlAccountId)){
						// we have account id, get the field value
						// set it as legal entity name
						subMerchantModel.setsubMerchanteCheckCompanyName(QueryUtil.getAccountFieldValue(sObjectFieldName, urlAccountId));	
					}
				}else if(sObjectName.equalsIgnoreCase('Opportunity')){
					if(String.isNotEmpty(urlOpportunityId)){
						//request from opportunity page, and we have the opportunity id
						// set it as legal entity name
						subMerchantModel.setsubMerchanteCheckCompanyName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, urlOpportunityId));
					}else if(String.isNotEmpty(urlAccountId)){
						subMerchantModel.setIsSubMerchanteCheckCompanyNameFromOpportunity(true);
						if(String.isNotEmpty(selectedOpportunityId)){
							subMerchantModel.setsubMerchanteCheckCompanyName(QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId));
						}
					}
				}	 
			}
		}
	}
	
	public Pagereference submit(){
		if(areRequiredFieldsFilled()){
			if(isInputDataValid()){
				// Check if username and password are available
				if(String.isEmpty(savedMappings.merchantUsername__c) || String.isEmpty(savedMappings.merchantPassword__c)){
		        	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Merchant Username or Password are not set in the Mappings page. Request Failed.'));
		        } else {
		        	//Make API call	
		        	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		        	LitleRequestXml litleRequestXml = new LitleRequestXml(legalEntityModel, subMerchantModel);
		        	// Get the request
		        	Httprequest createLegalEntityRequest = litleRequestXml.getCreateLegalEntityRequest(savedMappings.merchantUsername__c, savedMappings.merchantPassword__c);
		        	//Log request
    				LoggingUtil.logCreateLegalEntityRequest(createLegalEntityRequest, litleRequestResponseLog);	
		        	// Make Legal entity request 
		        	if(createLegalEntityRequest != null){
		        		makeCreateLegalEntityRequest(litleRequestResponseLog, createLegalEntityRequest);
		        	}
		        	
					//check if legal entity id is populated
					if(String.isNotEmpty(legalEntityResponse.getLegalEntityId())){
						Httprequest createSubMerchantRequest = litleRequestXml.getCreateSubMerchantRequest(savedMappings.merchantUsername__c, savedMappings.merchantPassword__c
		        																					,legalEntityResponse.getLegalEntityId());
						//Log Sub Merchant request
						LoggingUtil.logCreateSubMerchantRequest(createSubMerchantRequest, litleRequestResponseLog);
                		if(String.isNotEmpty(legalEntityResponse.getResponseCode())
							&& legalEntityResponse.getResponseCode().equals(LitleConstants.RESPONSE_APPROVED)){
								// make sub merchant request
								makeCreateSubMerchantRequest(litleRequestResponseLog, createSubMerchantRequest);
							}
					}
					LoggingUtil.logSObjectDetails(urlAccountId, urlOpportunityId, litleRequestResponseLog);
					//Insert Litle Mid
					if(String.isNotEmpty(urlOpportunityId)){
						try{
							Opportunity thisOpportunity = [select id, Litle_MID__c from Opportunity where id=:urlOpportunityId];
							thisOpportunity.Litle_MID__c = litleMid;
							upsert thisOpportunity;
						}catch (Queryexception e){
							System.debug('Error inserting litle mid value in opportunity'+ e);
						}
					}else if(String.isNotEmpty(urlAccountId)){
						try{
							Account thisAccount = [select id, Litle_MID__c from Account where id=:urlAccountId];
							thisAccount.Litle_MID__c = litleMid;
							upsert thisAccount;
						}catch (Queryexception e){
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
	
	/*To be deleted */
	/*public Httpresponse mockManualReview(){
		String STATUS_MESSAGE = 'Success';
	    Integer STATUS_CODE = 201;
	    String RESPONSE_CODE = '20';
	    String RESPONSE_DESCRIPTION = 'Manual Review';
	    String TRANSACTION_ID = '82821536819527712';
	    String LEGAL_ENTITY_ID = '82821536565085998';
		HttpResponse res = new HttpResponse();
    	String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
						 + '<legalEntityCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard">'
						 + '<transactionId>'+TRANSACTION_ID+'</transactionId>'
						 + '<legalEntityId>'+LEGAL_ENTITY_ID+'</legalEntityId>'
						 + '<principals>'
						 + '<principal>'
						 + '<principalId>1</principalId>'
						 + '<firstName>p first</firstName>'
						 + '<lastName>p last</lastName>'
						 + '</principal>'
						 + '</principals>'
						 + '<responseCode>'+RESPONSE_CODE+'</responseCode>'
						 + '<responseDescription>'+RESPONSE_DESCRIPTION+'</responseDescription>'
						 + '<backgroundCheckResults>'
						 + '<business>'
						 + '<verificationResult>'
						 + '<overallScore>'
						 + '<score>50</score>'
						 + '<description>Business is verified on multiple sources with no contradictory findings</description>'
						 + '</overallScore>'
						 + '<nameAddressTaxIdAssociation/>'
						 + '<nameAddressPhoneAssociation/>'
						 + '<verificationIndicators>'
						 + '<nameVerified>false</nameVerified>'
						 + '<addressVerified>false</addressVerified>'
						 + '<cityVerified>false</cityVerified>'
						 + '<stateVerified>false</stateVerified>'
						 + '<zipVerified>false</zipVerified>'
						 + '<phoneVerified>false</phoneVerified>'
						 + '<taxIdVerified>false</taxIdVerified>'
						 + '</verificationIndicators>'
						 + '<riskIndicators>'
						 + '<riskIndicator>'
						 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
						 + '<description>The input zip code belongs to a post office box</description>'
						 + '</riskIndicator>'
						 + '</riskIndicators>'
						 + '</verificationResult>'
						 + '</business>'
						 + '<principal>'
						 + '<verificationResult>'
						 + '<overallScore>'
						 + '<score>50</score>'
						 + '<description>Full name, address, phone , SSN verified</description>'
						 + '</overallScore>'
						 + '<nameAddressSsnAssociation/>'
						 + '<nameAddressPhoneAssociation/>'
						 + '<verificationIndicators>'
						 + '<nameVerified>false</nameVerified>'
						 + '<addressVerified>false</addressVerified>'
						 + '<phoneVerified>false</phoneVerified>'
						 + '<ssnVerified>false</ssnVerified>'
						 + '<dobVerified>false</dobVerified>'
						 + '</verificationIndicators>'
						 + '<riskIndicators>'
						 + '<riskIndicator>'
						 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
						 + '<description>The input zip code belongs to a post office box</description>'
						 + '</riskIndicator>'
						 + '</riskIndicators>'
						 + '</verificationResult>'
						 + '</principal>'
						 + '<businessToPrincipalAssociation>'
						 + '<score>50</score>'
						 + '<description>Association found between the person and the company in the Company Contacts data</description>'
						 + '</businessToPrincipalAssociation>'
						 + '</backgroundCheckResults>'
						 + '</legalEntityCreateResponse>';
    	res.setBody(response);
    	res.setStatusCode(STATUS_CODE);
    	res.setStatus(STATUS_MESSAGE);
    	return res;
	} */
	
	public void makeCreateLegalEntityRequest(LitleRequestResponseLog__c litleRequestResponseLog, Httprequest createLegalEntityRequest){
		Http h = new Http();
        Httpresponse lEResponse = new Httpresponse();
        try{
        	lEResponse = h.send(createLegalEntityRequest); 
        	//lEResponse = mockManualReview();
        	//Log response
        	LoggingUtil.logCreateLegalEntityResponse(lEResponse, litleRequestResponseLog);
        	if(lEResponse.getStatusCode() == LitleConstants.LEGAL_ENTITY_SUCCESS_RESPONSE_CODE){
        		//get response code, transaction id and response description
        		legalEntityResponse.setTransactionId(XmlUtil.extractXmlTagText(lEResponse, 'transactionId'));
        		legalEntityResponse.setResponseCode(XmlUtil.extractXmlTagText(lEResponse, 'responseCode'));
        		legalEntityResponse.setResponseDespcription(XmlUtil.extractXmlTagText(lEResponse, 'responseDescription'));
        		litleMid = legalEntityResponse.getResponseCode() + ' : ' + legalEntityResponse.getResponseDespcription();
        		legalEntityResponse.setLegalEntityId(XmlUtil.extractXmlTagText(lEResponse, 'legalEntityId'));
        		//Log response codes and legal entity id
        		litleRequestResponseLog.legalEntityResponseCode__c = legalEntityResponse.getResponseCode();
        		litleRequestResponseLog.legalEntityId__c = legalEntityResponse.getLegalEntityId();
        		// Show error message if not approved
        		if(!legalEntityResponse.getResponseCode().equals(LitleConstants.RESPONSE_APPROVED)){
        			ApexPages.addmessage(new ApexPages.message
        			(ApexPages.severity.ERROR,String.valueOf(legalEntityResponse.getResponseCode()+
        												': '+legalEntityResponse.getResponseDespcription())));
        		}
        		/*//check response code
        		if(String.isNotEmpty(legalEntityResponse.getResponseCode())){
        			//decide based on response codes
        			//For approved response
        			if(legalEntityResponse.getResponseCode().equals(ResponseCode.codeValue(ResponseCode.ResponseCodeEnum.APPROVED.name()))){
        				//approved, get legal entity id
        				legalEntityResponse.setLegalEntityId(XmlUtil.extractXmlTagText(lEResponse, 'legalEntityId'));
        			}else{
	        			//TODO for other response codes
	        			legalEntityResponse.setLegalEntityId(null);
        			}
        		}*/
        	}else{
        		//reset the legal entity id
        		legalEntityResponse.setLegalEntityId(null);
        		legalEntityResponse.setResponseCode(String.valueOf(lEResponse.getStatusCode()));
        		legalEntityResponse.setResponseDespcription(XmlUtil.extractXmlTagText(lEResponse,'error'));
        		litleMid = legalEntityResponse.getResponseCode() + ' : ' + legalEntityResponse.getResponseDespcription();
        		ApexPages.addmessage(new ApexPages.message
        			(ApexPages.severity.ERROR,String.valueOf(legalEntityResponse.getResponseCode()+
        												': '+legalEntityResponse.getResponseDespcription())));	
        	}
        }catch(System.CalloutException e){
        	System.debug('Legal Entity Request Callout error: '+ e);
        	System.debug(lEResponse.toString());
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Error in making API request.'));
        }
	}
	
	
	
	/*public void extractResponse(Httpresponse response){
		if(response != null){
			//check response code 10
			String responseCode = XmlUtil.extractXmlTagText(response, 'responseCode');
			if(String.isNotEmpty(responseCode)){
				if(responseCode.trim().equals('10')){
					//Approved
					//Extract legal entity id
				}else{
					//Not approved
					//set legal entity id to null
					legalEntityModel.setLegalEntityId(null);
					//Extract response description
					String responseDescription = XmlUtil.extractXmlTagText(response, 'responseDescription');
					//store in custom object
				}
				//set legal entity id
				//else
				//set error message in custom field
			}else{
				// for null response code
				legalEntityModel.setLegalEntityId(null);
			}
		}
	}*/
	
	public void makeCreateSubMerchantRequest(LitleRequestResponseLog__c litleRequestResponseLog, Httprequest createSubMerchantRequest){
		Http h = new Http();
        Httpresponse sMResponse = new Httpresponse();
        try{
        	sMResponse = h.send(createSubMerchantRequest); 
        	//Log response
        	LoggingUtil.logCreateSubMerchantResponse(sMResponse, litleRequestResponseLog);
        	//TODO Handle sub merchant response
        	if(sMResponse.getStatusCode() == LitleConstants.SUB_MERCHANT_SUCCESS_RESPONSE_CODE){
        		//get litle mid
        		litleMid = XmlUtil.extractXmlTagText(sMResponse, 'subMerchantId');
        		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Request Approved. Litle MID: '+litleMid));	
        	}else{
        		//set litle mid with the error description
        		litleMid = String.valueOf(sMResponse.getStatusCode()) +' : ' + XmlUtil.extractXmlTagText(sMResponse,'error');
        		ApexPages.addmessage(new ApexPages.message
        			(ApexPages.severity.ERROR,String.valueOf(String.valueOf(sMResponse.getStatusCode())+
        												': '+XmlUtil.extractXmlTagText(sMResponse,'error'))));	
        	}
        }catch(System.CalloutException e){
        	System.debug('Sub Merchant Request Callout error: '+ e);
        	System.debug(sMResponse.toString());
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Error in making API request.'));
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
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityName());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityName())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityName(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Name cannot exceed 60 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityDoingBusinessAs());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityDoingBusinessAs())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityDoingBusinessAs(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Doing Business As cannot exceed 60 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityStreetAddress1());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress1())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStreetAddress1(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Street Address 1 cannot exceed 60 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getStreetAddress2());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress2())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStreetAddress2(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Street Address 2 cannot exceed 60 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getCity());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getCity())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getCity(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s City cannot exceed 20 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getStateProvince());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStateProvince())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStateProvince(), 2)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s State/Province cannot exceed 2 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getPostalCode());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getPostalCode())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getPostalCode(), 5)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Postal Code cannot exceed 5 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getCountryCode());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getCountryCode())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getCountryCode(), 3)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Country Code cannot exceed 3 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getFirstName());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getFirstName())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getFirstName(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s First Name cannot exceed 20 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getLastName());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getLastName())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getLastName(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s Last Name cannot exceed 20 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getEmailAddress())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getEmailAddress(), 100)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s Email Address cannot exceed 100 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getContactPhone());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getContactPhone())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getContactPhone(), 10)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s Contact Phone cannot exceed 10 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDateOfBirth())){
			if(!ValidationUtil.validateDate(legalEntityModel.getLegalEntityPrincipal().getDateOfBirth())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s Date of Birth is not in yyyy-mm-dd format'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDriversLicense())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getDriversLicense(), 25)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s Drivers License cannot exceed 25 characters'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState(), 2)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s Drivers License State cannot exceed 2 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getSsn());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getSsn())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getSsn(), 9)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s SSN cannot exceed 9 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityTaxId());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityTaxId())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityTaxId(), 9)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Tax ID cannot exceed 9 characters'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp())){
			if(!ValidationUtil.validateBoolean(legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Is Exclusive to PSP should be either true or false'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated())){
			if(!ValidationUtil.validateBoolean(legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Is PCI Compliance Validated should be either true or false'));
			}
		}
		
		//System.debug('!!!levels'+pciLevels.get(0));
		//System.debug('!!!'+legalEntityModel.getLegalEntityPci().getPciLevel());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPci().getPciLevel())){
			if(!ValidationUtil.validateIntegerValue(legalEntityModel.getLegalEntityPci().getPciLevel(), LitleConstants.PCI_LEVELS)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'PCI Levels should be either 1,2,3 or 4'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPci().getScanningVendor());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPci().getScanningVendor())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPci().getScanningVendor(), 9)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Scanning Vendor cannot exceed 9 characters'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPci().getQualifiedSecurityAssessor());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPci().getQualifiedSecurityAssessor())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPci().getQualifiedSecurityAssessor(), 50)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Qualified Security Assessor cannot exceed 50 characters'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPci().getMostRecentlyPassedScan());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPci().getMostRecentlyPassedScan())){
			if(!ValidationUtil.validateDate(legalEntityModel.getLegalEntityPci().getMostRecentlyPassedScan())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Most Recently Passed Scan is not in yyyy-mm-dd format'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPci().getReportOnCompliance());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPci().getReportOnCompliance())){
			if(!ValidationUtil.validateDate(legalEntityModel.getLegalEntityPci().getReportOnCompliance())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Report On Compliance is not in yyyy-mm-dd format'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())){
			if(!ValidationUtil.validateInteger(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Annual Credit Card Sales Volume should be integer'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityHasAcceptedCreditCards());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
			if(!ValidationUtil.validateBoolean(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Accepted Credit Cards in the Past should be either true or false'));
			}
		}
		//subMerchant Validations
		
		//System.debug('!!!'+subMerchantModel.getSubMerchantStreetAddress1());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getStreetAddress1())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getStreetAddress1(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s Street Address 1 cannot exceed 60 characters'));
			}
		}
		
		//System.debug('!!!'+subMerchantModel.getSubMerchantAddress().getStreetAddress2());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getStreetAddress2())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getStreetAddress2(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s Street Address 2 cannot exceed 60 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantAddress().getCity());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getCity())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getCity(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s City cannot exceed 20 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantAddress().getStateProvince());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getStateProvince())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getStateProvince(), 2)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s State/Province cannot exceed 2 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantAddress().getPostalCode());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getPostalCode())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getPostalCode(), 5)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s Postal Code cannot exceed 5 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantAddress().getCountryCode());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getCountryCode())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getCountryCode(), 3)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s Country Code cannot exceed 3 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantAmexMid());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantAmexMid())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAmexMid(), 15)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s Amex Merchant ID cannot exceed 15 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantBankAccountNumber());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantBankAccountNumber())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantBankAccountNumber(), 50)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Bank Account Number cannot exceed 50 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantBankRoutingNumber());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantBankRoutingNumber())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantBankRoutingNumber(), 50)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Bank Routing Number cannot exceed 50 characters'));
			}
		}
		
		//System.debug('!!!'+subMerchantModel.getSubMerchantCreateCredentials());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantCreateCredentials())){
			if(!ValidationUtil.validateBoolean(subMerchantModel.getSubMerchantCreateCredentials())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Create Connectivity Credentials should be either true or false'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantCustomerServiceNumber());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantCustomerServiceNumber())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantCustomerServiceNumber(), 13)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Customer Service Number cannot exceed 13 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantDiscoverConveyMid());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantDiscoverConveyMid())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantDiscoverConveyMid(), 15)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Discover Merchant ID cannot exceed 15 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantHardCodeBillingDescriptor())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantHardCodeBillingDescriptor(), 25)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Default Billing Descriptor cannot exceed 25 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantMaxTransactionAmount());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantMaxTransactionAmount())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMaxTransactionAmount(), 19)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Max Transaction Amount cannot exceed 19 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantMerchantCategoryCode());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantMerchantCategoryCode())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMerchantCategoryCode(), 4)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Merchant Category Code cannot exceed 4 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantMerchantName());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantMerchantName())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMerchantName(), 50)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Merchant Name cannot exceed 50 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantPrimaryContact().getFirstName());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getFirstName())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getFirstName(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Primary Contact\'s First Name cannot exceed 20 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantPrimaryContact().getLastName());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getLastName())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getLastName(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Primary Contact\'s Last Name cannot exceed 20 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress(), 100)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Primary Contact\'s Email Address cannot exceed 100 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantPrimaryContact().getPhone());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getPhone())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getPhone(), 13)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Primary Contact\'s Phone cannot exceed 13 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantPspMerchantId());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantPspMerchantId())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPspMerchantId(), 32)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'PayFac Sub-Merchant ID cannot exceed 32 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantUrl());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantUrl())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantUrl(), 120)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s URL cannot exceed 120 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchanteCheckBillingDescriptor());
		if(String.isNotEmpty(subMerchantModel.getSubMerchanteCheckBillingDescriptor())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckBillingDescriptor(), 10)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s eCheck Billing Descriptor cannot exceed 10 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchanteCheckCompanyName());
		if(String.isNotEmpty(subMerchantModel.getSubMerchanteCheckCompanyName())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckCompanyName(), 16)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s eCheck Company Name cannot exceed 16 characters'));
			}
		}
		
		return isInputValid;
	}
	
	public Boolean areRequiredFieldsFilled(){
		Boolean isAllRequiredFieldsPresent = true;
		if(String.isEmpty(legalEntityModel.getLegalEntityName())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity Name is Required'));
	
		}
		/*if(String.isEmpty(legalEntityModel.getLegalEntityType())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'is Required'));
	
		}*/
		if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress1())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Street Address 1 is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getCountryCode())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Country Code is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getLastName())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s Last Name is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getFirstName())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s First Name is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityType())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity Type is Required'));
		}else{
			if(legalEntityModel.getLegalEntityType().equalsIgnoreCase(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name())){
				if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getCity())){
					isAllRequiredFieldsPresent = false;
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s City is Required'));
		
				}
				if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getStateProvince())){
					isAllRequiredFieldsPresent = false;
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s State/Province is Required'));
		
				}
				if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getPostalCode())){
					isAllRequiredFieldsPresent = false;
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Postal Code is Required'));
		
				}
				if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getSsn())){
					isAllRequiredFieldsPresent = false;
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Company Representative\'s SSN is Required'));
		
				}
			}else{
				if(String.isEmpty(legalEntityModel.getLegalEntityTaxId())){
					isAllRequiredFieldsPresent = false;
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Tax ID is Required'));
		
				}
			}
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Is Exclusive to PSP is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Is PCI Compliance Validated is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityPci().getPciLevel())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'PCI Level is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Annual Credit Card Sales Volume is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Accepted Credit Cards in the Past is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getCountryCode())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Payment Processing Configuration\'s Country Code is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantBankAccountNumber())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Bank Account Number is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantBankRoutingNumber())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Bank Routing Number is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantCustomerServiceNumber())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Customer Service Number is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantHardCodeBillingDescriptor())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Default Billing Descriptor is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantMaxTransactionAmount())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Max Transaction Amount is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantMerchantCategoryCode())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Merchant Category Code is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantMerchantName())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Merchant Name is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantPspMerchantId())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'PayFac Sub-Merchant ID is Required'));
	
		}
		return isAllRequiredFieldsPresent;		
		
	}
}