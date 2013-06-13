public class LitleMidFormController {
	
	public LegalEntityModel legalEntityModel{get; set;}
	public SubMerchantModel subMerchantModel{get; set;}
	public SalesforceLitleMappingsObject__c savedMappings {get; set;}
	public String urlAccountId {get; set;}
	public String urlOpportunityId {get; set;}
	public Account account{get; set;}
//	public Boolean isTaxDisplayed{get; set;}
	public List<SelectOption> legalEntityTypeList{get; set;}
	public static final List<Integer> pciLevels = new List<Integer>{ 1, 2, 3, 4 };
	//public static final String INDIVIDUAL_SOLE_PROPRIETORSHIP = 'INDIVIDUAL_SOLE_PROPRIETORSHIP';
	//public static final String OTHER = 'OTHER';
	
	/*public LitleMidFormController(ApexPages.StandardController controller) {
        this.account = (Account)controller.getRecord();
        this.urlAccountId = apexpages.currentpage().getParameters().get('accid');
        this.urlOpportunityId =  apexpages.currentpage().getParameters().get('oppid');
        savedMappings = new SalesforceLitleMappingsObject__c();
		legalEntityModel = new LegalEntityModel();
		subMerchantModel = new SubMerchantModel();
		List<SalesforceLitleMappingsObject__c> mappingRecords 
    			= [select id, name, subMerchantStreetAddress1__c, subMerchantStreetAddress2__c, subMerchantCity__c, subMerchantStateProvince__c, subMerchantPostalCode__c, subMerchantCountryCode__c, subMerchantAmexMid__c, subMerchantBankAccountNumber__c, subMerchantBankRoutingNumber__c, subMerchantCreateCredentials__c, subMerchantCustomerServiceNumber__c, subMerchantDiscoverConveyMid__c, subMerchantHardCodeBillingDescriptor__c, subMerchantMaxTransactionAmount__c, subMerchantMerchantCategoryCode__c, subMerchantMerchantName__c, subMerchantFirstName__c, subMerchantLastName__c, subMerchantEmailAddress__c, subMerchantPhone__c, subMerchantPspMerchantId__c, subMerchantUrl__c, subMerchanteCheckBillingDescriptor__c, subMerchanteCheckCompanyName__c, subMerchantStreetAddress1D__c, subMerchantStreetAddress2D__c, subMerchantCityD__c, subMerchantStateProvinceD__c, subMerchantPostalCodeD__c, subMerchantCountryCodeD__c, subMerchantAmexMidD__c, subMerchantBankAccountNumberD__c, subMerchantBankRoutingNumberD__c, subMerchantCreateCredentialsD__c, subMerchantCustomerServiceNumberD__c, subMerchantDiscoverConveyMidD__c, subMerchantHardCodeBillingDescD__c, subMerchantMaxTransactionAmountD__c, subMerchantMerchantCategoryCodeD__c, subMerchantMerchantNameD__c, subMerchantFirstNameD__c, subMerchantLastNameD__c, subMerchantEmailAddressD__c, subMerchantPhoneD__c, subMerchantPspMerchantIdD__c, subMerchantUrlD__c, subMerchanteCheckBillingDescD__c, subMerchanteCheckCompanyNameD__c, subMerchantStreetAddress1X__c, subMerchantStreetAddress2X__c, subMerchantCityX__c, subMerchantStateProvinceX__c, subMerchantPostalCodeX__c, subMerchantCountryCodeX__c, subMerchantAmexMidX__c, subMerchantBankAccountNumberX__c, subMerchantBankRoutingNumberX__c, subMerchantCreateCredentialsX__c, subMerchantCustomerServiceNumberX__c, subMerchantDiscoverConveyMidX__c, subMerchantHardCodeBillingDescriptorX__c, subMerchantMaxTransactionAmountX__c, subMerchantMerchantCategoryCodeX__c, subMerchantMerchantNameX__c, subMerchantFirstNameX__c, subMerchantLastNameX__c, subMerchantEmailAddressX__c, subMerchantPhoneX__c, subMerchantPspMerchantIdX__c, subMerchantUrlX__c, subMerchanteCheckBillingDescriptorX__c, subMerchanteCheckCompanyNameX__c, legalEntityName__c, legalEntityType__c, legalEntityStreetAddress1__c, legalEntityStreetAddress2__c, legalEntityCity__c, legalEntityStateProvince__c, legalEntityPostalCode__c, legalEntityCountryCode__c, legalEntityFirstName__c, legalEntityLastName__c, legalEntityEmailAddress__c, legalEntityContactPhone__c, legalEntityDateOfBirth__c, legalEntityDriversLicense__c, legalEntityDriversLicenseState__c, legalEntitySsn__c, legalEntityTaxId__c, legalEntityIsExclusiveToPsp__c, legalEntityIsPciComplianceValidated__c, legalEntityPciLevel__c, legalEntityScanningVendor__c, legalEntityQualifiedSecurityAssessor__c, legalEntityMostRecentlyPassedScan__c, legalEntityReportOnCompliance__c, legalEntityAnnualCreditCardSalesVolume__c, legalEntityHasAcceptedCreditCards__c, legalEntityNameD__c, legalEntityTypeD__c, legalEntityStreetAddress1D__c, legalEntityStreetAddress2D__c, legalEntityCityD__c, legalEntityStateProvinceD__c, legalEntityPostalCodeD__c, legalEntityCountryCodeD__c, legalEntityFirstNameD__c, legalEntityLastNameD__c, legalEntityEmailAddressD__c, legalEntityContactPhoneD__c, legalEntityDateOfBirthD__c, legalEntityDriversLicenseD__c, legalEntityDriversLicenseStateD__c, legalEntitySsnD__c, legalEntityTaxIdD__c, legalEntityIsExclusiveToPspD__c, legalEntityIsPciComplianceValidatedD__c, legalEntityPciLevelD__c, legalEntityScanningVendorD__c, legalEntityQualifiedSecurityAssessorD__c, legalEntityMostRecentlyPassedScanD__c, legalEntityReportOnComplianceD__c, legalEntityAnnualCreditCardSalesVolumeD__c, legalEntityHasAcceptedCreditCardsD__c, legalEntityNameX__c, legalEntityTypeX__c, legalEntityStreetAddress1X__c, legalEntityStreetAddress2X__c, legalEntityCityX__c, legalEntityStateProvinceX__c, legalEntityPostalCodeX__c, legalEntityCountryCodeX__c, legalEntityFirstNameX__c, legalEntityLastNameX__c, legalEntityEmailAddressX__c, legalEntityContactPhoneX__c, legalEntityDateOfBirthX__c, legalEntityDriversLicenseX__c, legalEntityDriversLicenseStateX__c, legalEntitySsnX__c, legalEntityTaxIdX__c, legalEntityIsExclusiveToPspX__c, legalEntityIsPciComplianceValidatedX__c, legalEntityPciLevelX__c, legalEntityScanningVendorX__c, legalEntityQualifiedSecurityAssessorX__c, legalEntityMostRecentlyPassedScanX__c, legalEntityReportOnComplianceX__c, legalEntityAnnualCreditCardSalesVolumeX__c, legalEntityHasAcceptedCreditCardsX__c  from SalesforceLitleMappingsObject__c limit 1];
    	if(!mappingRecords.isEmpty()){
    		this.savedMappings =  mappingRecords.get(0);
    		legalEntityModel.setLegalEntityName([select website from account where id=:account.Id].website);
    	}
	}*/
	
	public LitleMidFormController(){
		this.urlAccountId = apexpages.currentpage().getParameters().get('accid');
        this.urlOpportunityId =  apexpages.currentpage().getParameters().get('oppid');
        //Initialize the Pci levels
        //pciLevels = new List<Integer>{ 1 , 2 , 3, 4 };
		/*pciLevels.add(1);
		pciLevels.add(2);
		pciLevels.add(3);
		pciLevels.add(4);*/
		
        legalEntityTypeList = new List<SelectOption>();
        for (LegalEntityType.LegalEntityTypeEnum s: LegalEntityType.LegalEntityTypeEnum.values()){
        	legalEntityTypeList.add(new SelectOption(s.name(), LegalEntityType.stringValue(s.name())));
        }
        
        //legalEntityTypeList.add(new SelectOption(OTHER, 'Other'));
        savedMappings = new SalesforceLitleMappingsObject__c();
		legalEntityModel = new LegalEntityModel();
		subMerchantModel = new SubMerchantModel();
		List<SalesforceLitleMappingsObject__c> mappingRecords 
    			= [select subMerchantStreetAddress1__c, subMerchantStreetAddress2__c, subMerchantCity__c, subMerchantStateProvince__c, subMerchantPostalCode__c, subMerchantCountryCode__c, subMerchantAmexMid__c, subMerchantBankAccountNumber__c, subMerchantBankRoutingNumber__c, subMerchantCreateCredentials__c, subMerchantCustomerServiceNumber__c, subMerchantDiscoverConveyMid__c, subMerchantHardCodeBillingDescriptor__c, subMerchantMaxTransactionAmount__c, subMerchantMerchantCategoryCode__c, subMerchantMerchantName__c, subMerchantFirstName__c, subMerchantLastName__c, subMerchantEmailAddress__c, subMerchantPhone__c, subMerchantPspMerchantId__c, subMerchantUrl__c, subMerchanteCheckBillingDescriptor__c, subMerchanteCheckCompanyName__c, subMerchantStreetAddress1D__c, subMerchantStreetAddress2D__c, subMerchantCityD__c, subMerchantStateProvinceD__c, subMerchantPostalCodeD__c, subMerchantCountryCodeD__c, subMerchantAmexMidD__c, subMerchantBankAccountNumberD__c, subMerchantBankRoutingNumberD__c, subMerchantCreateCredentialsD__c, subMerchantCustomerServiceNumberD__c, subMerchantDiscoverConveyMidD__c, subMerchantHardCodeBillingDescD__c, subMerchantMaxTransactionAmountD__c, subMerchantMerchantCategoryCodeD__c, subMerchantMerchantNameD__c, subMerchantFirstNameD__c, subMerchantLastNameD__c, subMerchantEmailAddressD__c, subMerchantPhoneD__c, subMerchantPspMerchantIdD__c, subMerchantUrlD__c, subMerchanteCheckBillingDescD__c, subMerchanteCheckCompanyNameD__c, subMerchantStreetAddress1X__c, subMerchantStreetAddress2X__c, subMerchantCityX__c, subMerchantStateProvinceX__c, subMerchantPostalCodeX__c, subMerchantCountryCodeX__c, subMerchantAmexMidX__c, subMerchantBankAccountNumberX__c, subMerchantBankRoutingNumberX__c, subMerchantCreateCredentialsX__c, subMerchantCustomerServiceNumberX__c, subMerchantDiscoverConveyMidX__c, subMerchantHardCodeBillingDescriptorX__c, subMerchantMaxTransactionAmountX__c, subMerchantMerchantCategoryCodeX__c, subMerchantMerchantNameX__c, subMerchantFirstNameX__c, subMerchantLastNameX__c, subMerchantEmailAddressX__c, subMerchantPhoneX__c, subMerchantPspMerchantIdX__c, subMerchantUrlX__c, subMerchanteCheckBillingDescriptorX__c, subMerchanteCheckCompanyNameX__c, legalEntityName__c, legalEntityType__c, legalEntityStreetAddress1__c, legalEntityStreetAddress2__c, legalEntityCity__c, legalEntityStateProvince__c, legalEntityPostalCode__c, legalEntityCountryCode__c, legalEntityFirstName__c, legalEntityLastName__c, legalEntityEmailAddress__c, legalEntityContactPhone__c, legalEntityDateOfBirth__c, legalEntityDriversLicense__c, legalEntityDriversLicenseState__c, legalEntitySsn__c, legalEntityTaxId__c, legalEntityIsExclusiveToPsp__c, legalEntityIsPciComplianceValidated__c, legalEntityPciLevel__c, legalEntityScanningVendor__c, legalEntityQualifiedSecurityAssessor__c, legalEntityMostRecentlyPassedScan__c, legalEntityReportOnCompliance__c, legalEntityAnnualCreditCardSalesVolume__c, legalEntityHasAcceptedCreditCards__c, legalEntityNameD__c, legalEntityTypeD__c, legalEntityStreetAddress1D__c, legalEntityStreetAddress2D__c, legalEntityCityD__c, legalEntityStateProvinceD__c, legalEntityPostalCodeD__c, legalEntityCountryCodeD__c, legalEntityFirstNameD__c, legalEntityLastNameD__c, legalEntityEmailAddressD__c, legalEntityContactPhoneD__c, legalEntityDateOfBirthD__c, legalEntityDriversLicenseD__c, legalEntityDriversLicenseStateD__c, legalEntitySsnD__c, legalEntityTaxIdD__c, legalEntityIsExclusiveToPspD__c, legalEntityIsPciComplianceValidatedD__c, legalEntityPciLevelD__c, legalEntityScanningVendorD__c, legalEntityQualifiedSecurityAssessorD__c, legalEntityMostRecentlyPassedScanD__c, legalEntityReportOnComplianceD__c, legalEntityAnnualCreditCardSalesVolumeD__c, legalEntityHasAcceptedCreditCardsD__c, legalEntityNameX__c, legalEntityTypeX__c, legalEntityStreetAddress1X__c, legalEntityStreetAddress2X__c, legalEntityCityX__c, legalEntityStateProvinceX__c, legalEntityPostalCodeX__c, legalEntityCountryCodeX__c, legalEntityFirstNameX__c, legalEntityLastNameX__c, legalEntityEmailAddressX__c, legalEntityContactPhoneX__c, legalEntityDateOfBirthX__c, legalEntityDriversLicenseX__c, legalEntityDriversLicenseStateX__c, legalEntitySsnX__c, legalEntityTaxIdX__c, legalEntityIsExclusiveToPspX__c, legalEntityIsPciComplianceValidatedX__c, legalEntityPciLevelX__c, legalEntityScanningVendorX__c, legalEntityQualifiedSecurityAssessorX__c, legalEntityMostRecentlyPassedScanX__c, legalEntityReportOnComplianceX__c, legalEntityAnnualCreditCardSalesVolumeX__c, legalEntityHasAcceptedCreditCardsX__c, legalEntityDoingBusinessAs__c, legalEntityDoingBusinessAsX__c, legalEntityDoingBusinessAsD__c  from SalesforceLitleMappingsObject__c limit 1];
    	String foo = 'website';
    	if(!mappingRecords.isEmpty()){
    		this.savedMappings =  mappingRecords.get(0);
    		populateFields();
    	}
	}
	
	public void populateFields(){
		populateLEName();
		//populateLEType();
		populateLEDoingBusinessAs();
		populateLEAddress1();
		populateLEAddress2();
		populateLECity();
		populateLEStateProvince();
		populateLEPostalCode();
		populateLECountryCode();
		populateLEFirstName();
		populateLELastName();
		populateLEEmailAddress();
		populateLEContactPhone();
		populateLEDateOfBirth();
		populateLEDriversLicense();
		populateLEDriversLicenseState();
		populateLESsn();
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
		
	
	public void populateLEName(){
		if(!savedMappings.legalEntityNameX__c){
			legalEntityModel.setLegalEntityName(savedMappings.legalEntityNameD__c);
		}else{
			if (savedMappings.legalEntityName__c != null &&  savedMappings.legalEntityName__c != ''){
				String typeField = savedMappings.legalEntityName__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	/*public void populateLEType(){
		if(!savedMappings.legalEntityTypeX__c){
			legalEntityModel.setLegalEntityType(savedMappings.legalEntityTypeD__c);
		}else{
			if (savedMappings.legalEntityType__c != null &&  savedMappings.legalEntityType__c != ''){
				String typeField = savedMappings.legalEntityType__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityType(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityType(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}*/
	
	public void populateLEDoingBusinessAs(){
		if(!savedMappings.legalEntityDoingBusinessAsX__c){
			legalEntityModel.setLegalEntityDoingBusinessAs(savedMappings.legalEntityDoingBusinessAsD__c);
		}else{
			if (savedMappings.legalEntityDoingBusinessAs__c != null &&  savedMappings.legalEntityDoingBusinessAs__c != ''){
				String typeField = savedMappings.legalEntityDoingBusinessAs__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityDoingBusinessAs(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityDoingBusinessAs(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityStreetAddress1__c != null &&  savedMappings.legalEntityStreetAddress1__c != ''){
				String typeField = savedMappings.legalEntityStreetAddress1__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setStreetAddress1(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setStreetAddress1(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityStreetAddress2__c != null &&  savedMappings.legalEntityStreetAddress2__c != ''){
				String typeField = savedMappings.legalEntityStreetAddress2__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setStreetAddress2(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setStreetAddress2(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityCity__c != null &&  savedMappings.legalEntityCity__c != ''){
				String typeField = savedMappings.legalEntityCity__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setCity(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setCity(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEStateProvince(){
		if(!savedMappings.legalEntityStateProvinceX__c){
			legalEntityModel.getLegalEntityAddress().setStateProvince(savedMappings.legalEntityStateProvinceD__c);
		}else{
			if (savedMappings.legalEntityStateProvince__c != null &&  savedMappings.legalEntityStateProvince__c != ''){
				String typeField = savedMappings.legalEntityStateProvince__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setStateProvince(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setStateProvince(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityPostalCode__c != null &&  savedMappings.legalEntityPostalCode__c != ''){
				String typeField = savedMappings.legalEntityPostalCode__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setPostalCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setPostalCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityCountryCode__c != null &&  savedMappings.legalEntityCountryCode__c != ''){
				String typeField = savedMappings.legalEntityCountryCode__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setCountryCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityAddress().setCountryCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEFirstName(){
		if(!savedMappings.legalEntityFirstNameX__c){
			legalEntityModel.getLegalEntityPrincipal().setFirstName(savedMappings.legalEntityFirstNameD__c);
		}else{
			if (savedMappings.legalEntityFirstName__c != null &&  savedMappings.legalEntityFirstName__c != ''){
				String typeField = savedMappings.legalEntityFirstName__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setFirstName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setFirstName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLELastName(){
		if(!savedMappings.legalEntityLastNameX__c){
			legalEntityModel.getLegalEntityPrincipal().setLastName(savedMappings.legalEntityLastNameD__c);
		}else{
			if (savedMappings.legalEntityLastName__c != null &&  savedMappings.legalEntityLastName__c != ''){
				String typeField = savedMappings.legalEntityLastName__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setLastName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setLastName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEEmailAddress(){
		if(!savedMappings.legalEntityEmailAddressX__c){
			legalEntityModel.getLegalEntityPrincipal().setEmailAddress(savedMappings.legalEntityEmailAddressD__c);
		}else{
			if (savedMappings.legalEntityEmailAddress__c != null &&  savedMappings.legalEntityEmailAddress__c != ''){
				String typeField = savedMappings.legalEntityEmailAddress__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setEmailAddress(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setEmailAddress(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEContactPhone(){
		if(!savedMappings.legalEntityContactPhoneX__c){
			legalEntityModel.getLegalEntityPrincipal().setContactPhone(savedMappings.legalEntityContactPhoneD__c);
		}else{
			if (savedMappings.legalEntityContactPhone__c != null &&  savedMappings.legalEntityContactPhone__c != ''){
				String typeField = savedMappings.legalEntityContactPhone__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setContactPhone(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setContactPhone(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEDateOfBirth(){
		if(!savedMappings.legalEntityDateOfBirthX__c){
			legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(savedMappings.legalEntityDateOfBirthD__c);
		}else{
			if (savedMappings.legalEntityDateOfBirth__c != null &&  savedMappings.legalEntityDateOfBirth__c != ''){
				String typeField = savedMappings.legalEntityDateOfBirth__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEDriversLicense(){
		if(!savedMappings.legalEntityDriversLicenseX__c){
			legalEntityModel.getLegalEntityPrincipal().setDriversLicense(savedMappings.legalEntityDriversLicenseD__c);
		}else{
			if (savedMappings.legalEntityDriversLicense__c != null &&  savedMappings.legalEntityDriversLicense__c != ''){
				String typeField = savedMappings.legalEntityDriversLicense__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setDriversLicense(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setDriversLicense(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEDriversLicenseState(){
		if(!savedMappings.legalEntityDriversLicenseStateX__c){
			legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(savedMappings.legalEntityDriversLicenseStateD__c);
		}else{
			if (savedMappings.legalEntityDriversLicenseState__c != null &&  savedMappings.legalEntityDriversLicenseState__c != ''){
				String typeField = savedMappings.legalEntityDriversLicenseState__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLESsn(){
		if(!savedMappings.legalEntitySsnX__c){
			legalEntityModel.getLegalEntityPrincipal().setSsn(savedMappings.legalEntitySsnD__c);
		}else{
			if (savedMappings.legalEntitySsn__c != null &&  savedMappings.legalEntitySsn__c != ''){
				String typeField = savedMappings.legalEntitySsn__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setSsn(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPrincipal().setSsn(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityTaxId__c != null &&  savedMappings.legalEntityTaxId__c != ''){
				String typeField = savedMappings.legalEntityTaxId__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityTaxId(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityTaxId(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityIsExclusiveToPsp__c != null &&  savedMappings.legalEntityIsExclusiveToPsp__c != ''){
				String typeField = savedMappings.legalEntityIsExclusiveToPsp__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityIsPciComplianceValidated__c != null &&  savedMappings.legalEntityIsPciComplianceValidated__c != ''){
				String typeField = savedMappings.legalEntityIsPciComplianceValidated__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityPciLevel__c != null &&  savedMappings.legalEntityPciLevel__c != ''){
				String typeField = savedMappings.legalEntityPciLevel__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setPciLevel(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setPciLevel(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityScanningVendor__c != null &&  savedMappings.legalEntityScanningVendor__c != ''){
				String typeField = savedMappings.legalEntityScanningVendor__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setScanningVendor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setScanningVendor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityQualifiedSecurityAssessor__c != null &&  savedMappings.legalEntityQualifiedSecurityAssessor__c != ''){
				String typeField = savedMappings.legalEntityQualifiedSecurityAssessor__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityMostRecentlyPassedScan__c != null &&  savedMappings.legalEntityMostRecentlyPassedScan__c != ''){
				String typeField = savedMappings.legalEntityMostRecentlyPassedScan__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityReportOnCompliance__c != null &&  savedMappings.legalEntityReportOnCompliance__c != ''){
				String typeField = savedMappings.legalEntityReportOnCompliance__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setReportOnCompliance(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.getLegalEntityPci().setReportOnCompliance(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityAnnualCreditCardSalesVolume__c != null &&  savedMappings.legalEntityAnnualCreditCardSalesVolume__c != ''){
				String typeField = savedMappings.legalEntityAnnualCreditCardSalesVolume__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.legalEntityHasAcceptedCreditCards__c != null &&  savedMappings.legalEntityHasAcceptedCreditCards__c != ''){
				String typeField = savedMappings.legalEntityHasAcceptedCreditCards__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityHasAcceptedCreditCards(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityHasAcceptedCreditCards(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMStreetAddress1(){
		if(!savedMappings.subMerchantStreetAddress1X__c){
			subMerchantModel.setsubMerchantStreetAddress1(savedMappings.subMerchantStreetAddress1D__c);
		}else{
			if (savedMappings.subMerchantStreetAddress1__c != null &&  savedMappings.subMerchantStreetAddress1__c != ''){
				String typeField = savedMappings.subMerchantStreetAddress1__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantStreetAddress1(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantStreetAddress1(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMStreetAddress2(){
		if(!savedMappings.subMerchantStreetAddress2X__c){
			subMerchantModel.setsubMerchantStreetAddress2(savedMappings.subMerchantStreetAddress2D__c);
		}else{
			if (savedMappings.subMerchantStreetAddress2__c != null &&  savedMappings.subMerchantStreetAddress2__c != ''){
				String typeField = savedMappings.subMerchantStreetAddress2__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantStreetAddress2(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantStreetAddress2(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMCity(){
		if(!savedMappings.subMerchantCityX__c){
			subMerchantModel.setsubMerchantCity(savedMappings.subMerchantCityD__c);
		}else{
			if (savedMappings.subMerchantCity__c != null &&  savedMappings.subMerchantCity__c != ''){
				String typeField = savedMappings.subMerchantCity__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantCity(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantCity(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMStateProvince(){
		if(!savedMappings.subMerchantStateProvinceX__c){
			subMerchantModel.setsubMerchantStateProvince(savedMappings.subMerchantStateProvinceD__c);
		}else{
			if (savedMappings.subMerchantStateProvince__c != null &&  savedMappings.subMerchantStateProvince__c != ''){
				String typeField = savedMappings.subMerchantStateProvince__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantStateProvince(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantStateProvince(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMPostalCode(){
		if(!savedMappings.subMerchantPostalCodeX__c){
			subMerchantModel.setsubMerchantPostalCode(savedMappings.subMerchantPostalCodeD__c);
		}else{
			if (savedMappings.subMerchantPostalCode__c != null &&  savedMappings.subMerchantPostalCode__c != ''){
				String typeField = savedMappings.subMerchantPostalCode__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantPostalCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantPostalCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMCountryCode(){
		if(!savedMappings.subMerchantCountryCodeX__c){
			subMerchantModel.setsubMerchantCountryCode(savedMappings.subMerchantCountryCodeD__c);
		}else{
			if (savedMappings.subMerchantCountryCode__c != null &&  savedMappings.subMerchantCountryCode__c != ''){
				String typeField = savedMappings.subMerchantCountryCode__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantCountryCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantCountryCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantAmexMid__c != null &&  savedMappings.subMerchantAmexMid__c != ''){
				String typeField = savedMappings.subMerchantAmexMid__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantAmexMid(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantAmexMid(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantBankAccountNumber__c != null &&  savedMappings.subMerchantBankAccountNumber__c != ''){
				String typeField = savedMappings.subMerchantBankAccountNumber__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantBankAccountNumber(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantBankAccountNumber(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantBankRoutingNumber__c != null &&  savedMappings.subMerchantBankRoutingNumber__c != ''){
				String typeField = savedMappings.subMerchantBankRoutingNumber__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantBankRoutingNumber(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantBankRoutingNumber(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantCreateCredentials__c != null &&  savedMappings.subMerchantCreateCredentials__c != ''){
				String typeField = savedMappings.subMerchantCreateCredentials__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantCreateCredentials(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantCreateCredentials(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantCustomerServiceNumber__c != null &&  savedMappings.subMerchantCustomerServiceNumber__c != ''){
				String typeField = savedMappings.subMerchantCustomerServiceNumber__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantCustomerServiceNumber(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantCustomerServiceNumber(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantDiscoverConveyMid__c != null &&  savedMappings.subMerchantDiscoverConveyMid__c != ''){
				String typeField = savedMappings.subMerchantDiscoverConveyMid__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantDiscoverConveyMid(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantDiscoverConveyMid(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantHardCodeBillingDescriptor__c != null &&  savedMappings.subMerchantHardCodeBillingDescriptor__c != ''){
				String typeField = savedMappings.subMerchantHardCodeBillingDescriptor__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantHardCodeBillingDescriptor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantHardCodeBillingDescriptor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantMaxTransactionAmount__c != null &&  savedMappings.subMerchantMaxTransactionAmount__c != ''){
				String typeField = savedMappings.subMerchantMaxTransactionAmount__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantMaxTransactionAmount(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantMaxTransactionAmount(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantMerchantCategoryCode__c != null &&  savedMappings.subMerchantMerchantCategoryCode__c != ''){
				String typeField = savedMappings.subMerchantMerchantCategoryCode__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantMerchantCategoryCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantMerchantCategoryCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantMerchantName__c != null &&  savedMappings.subMerchantMerchantName__c != ''){
				String typeField = savedMappings.subMerchantMerchantName__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantMerchantName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantMerchantName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMFirstName(){
		if(!savedMappings.subMerchantFirstNameX__c){
			subMerchantModel.setsubMerchantFirstName(savedMappings.subMerchantFirstNameD__c);
		}else{
			if (savedMappings.subMerchantFirstName__c != null &&  savedMappings.subMerchantFirstName__c != ''){
				String typeField = savedMappings.subMerchantFirstName__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantFirstName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantFirstName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMLastName(){
		if(!savedMappings.subMerchantLastNameX__c){
			subMerchantModel.setsubMerchantLastName(savedMappings.subMerchantLastNameD__c);
		}else{
			if (savedMappings.subMerchantLastName__c != null &&  savedMappings.subMerchantLastName__c != ''){
				String typeField = savedMappings.subMerchantLastName__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantLastName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantLastName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMEmailAddress(){
		if(!savedMappings.subMerchantEmailAddressX__c){
			subMerchantModel.setsubMerchantEmailAddress(savedMappings.subMerchantEmailAddressD__c);
		}else{
			if (savedMappings.subMerchantEmailAddress__c != null &&  savedMappings.subMerchantEmailAddress__c != ''){
				String typeField = savedMappings.subMerchantEmailAddress__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantEmailAddress(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantEmailAddress(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateSMPhone(){
		if(!savedMappings.subMerchantPhoneX__c){
			subMerchantModel.setsubMerchantPhone(savedMappings.subMerchantPhoneD__c);
		}else{
			if (savedMappings.subMerchantPhone__c != null &&  savedMappings.subMerchantPhone__c != ''){
				String typeField = savedMappings.subMerchantPhone__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantPhone(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantPhone(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantPspMerchantId__c != null &&  savedMappings.subMerchantPspMerchantId__c != ''){
				String typeField = savedMappings.subMerchantPspMerchantId__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantPspMerchantId(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantPspMerchantId(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchantUrl__c != null &&  savedMappings.subMerchantUrl__c != ''){
				String typeField = savedMappings.subMerchantUrl__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantUrl(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchantUrl(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchanteCheckBillingDescriptor__c != null &&  savedMappings.subMerchanteCheckBillingDescriptor__c != ''){
				String typeField = savedMappings.subMerchanteCheckBillingDescriptor__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchanteCheckBillingDescriptor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchanteCheckBillingDescriptor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
			if (savedMappings.subMerchanteCheckCompanyName__c != null &&  savedMappings.subMerchanteCheckCompanyName__c != ''){
				String typeField = savedMappings.subMerchanteCheckCompanyName__c;
				List<String> customObjectFieldParts = typeField.split('\\.', 2);
				if(customObjectFieldParts.size() == 2){
					String sObjectName = customObjectFieldParts.get(0);
					String sObjectFieldName = customObjectFieldParts.get(1);
					if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
						String sObjectId;
						if(sObjectName.equalsIgnoreCase('Account')){
							sObjectId = urlAccountId;
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							sObjectId = urlOpportunityId;
						}
						String query = String.escapeSingleQuotes('select '+sObjectFieldName+' from '+sObjectName+ ' where id= :sObjectId');
						if(sObjectName.equalsIgnoreCase('Account')){
							List<Account> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchanteCheckCompanyName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			subMerchantModel.setsubMerchanteCheckCompanyName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	//on change event of legal entity type
	/*public PageReference onChangeLegalEntityType(){
		if(String.isNotEmpty(legalEntityModel.getLegalEntityType())){
			if(legalEntityModel.getLegalEntityType().equals(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name())){
				isTaxDisplayed = false;
			}else{
				isTaxDisplayed = true;
			}
		}
		return null;
	}*/
	
	public Pagereference submit(){
		if(areRequiredFieldsFilled()){
			if(isInputDataValid()){
				//Make API call	
				makeCreateLegalEntityRequest();
		        //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,String.valueOf(res.getStatusCode())+': '+res.getBody()));
			}
			//return to previous page
		}
		/*else{
			//Display error
		}
		////System.debug('!!! In Submit');
		if(ValidationUtil.validateDate(legalEntityModel.getLegalEntityDateOfBirth())){
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Valid Date'));
		}else{
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Invalid Date'));
		}
		//ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Required Field'));*/
		return null;
		
	}
	
	public void makeCreateLegalEntityRequest(){
		Http h = new Http();
        Httprequest createLegalEntityRequest = new Httprequest();
        //endpoint
        createLegalEntityRequest.setEndpoint('https://psp-cert.litle.com/legalentity');
        // create header
        Blob headerValue = Blob.valueOf('username:password'); //Enter username and password
        String authorizationHeader = 'Basic' + Encodingutil.base64Encode(headerValue);
        createLegalEntityRequest.setHeader('Authorization', authorizationHeader);
        createLegalEntityRequest.setHeader('Content-Type', 'application/com.litle.psp-v5+xml');
		createLegalEntityRequest.setHeader('Accept', 'application/com.litle.psp-v5+xml');
        // Post request
        createLegalEntityRequest.setMethod('POST');
        LitleRequestXml litleRequestXml = new LitleRequestXml(legalEntityModel, subMerchantModel);
        //set body as the request xml
        createLegalEntityRequest.setBody(litleRequestXml.getCreateLegalEntityRequest());
        Httpresponse res = new Httpresponse();
        try{ 
        	res = h.send(createLegalEntityRequest);
        	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,String.valueOf(res.getStatusCode())+': '+res.getBody()));
        }catch(System.CalloutException e){
        	System.debug('Callout error: '+ e);
        	System.debug(res.toString());
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Error in making API request.'));
        }
	}
		 
	public Pagereference cancel(){
	 	/*resetStatus();
	 	String aId = apexpages.currentpage().getParameters().get('id'); 
	 	if(aId != null && !aid.equals('')){
				return new PageReference('/'+aId);	
			}*/
	 	return null;
	}
	
	public Boolean isInputDataValid(){
		Boolean isInputValid = true;
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityName());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityName())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityName(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Entity Name cannot exceed 60 characters'));
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
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Street Address 1 cannot exceed 60 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getStreetAddress2());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress2())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStreetAddress2(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Street Address 2 cannot exceed 60 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getCity());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getCity())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getCity(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'City cannot exceed 20 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getStateProvince());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStateProvince())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStateProvince(), 2)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'State/Province cannot exceed 2 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getPostalCode());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getPostalCode())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getPostalCode(), 5)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Postal Code cannot exceed 5 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityAddress().getCountryCode());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getCountryCode())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getCountryCode(), 3)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Country Code cannot exceed 3 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getFirstName());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getFirstName())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getFirstName(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'First Name cannot exceed 20 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getLastName());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getLastName())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getLastName(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Last Name cannot exceed 20 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getEmailAddress())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getEmailAddress(), 100)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Email Address cannot exceed 100 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getContactPhone());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getContactPhone())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getContactPhone(), 10)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Contact Phone cannot exceed 10 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDateOfBirth())){
			if(!ValidationUtil.validateDate(legalEntityModel.getLegalEntityPrincipal().getDateOfBirth())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Date of Birth is not in yyyy-mm-dd format'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDriversLicense())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getDriversLicense(), 25)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Drivers License cannot exceed 25 characters'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState(), 2)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Drivers License State cannot exceed 2 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityPrincipal().getSsn());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getSsn())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getSsn(), 9)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'SSN cannot exceed 9 characters'));
			}
		}
		//System.debug('!!!'+legalEntityModel.getLegalEntityTaxId());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityTaxId())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityTaxId(), 9)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Tax ID cannot exceed 9 characters'));
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
			if(!ValidationUtil.validateIntegerValue(legalEntityModel.getLegalEntityPci().getPciLevel(), pciLevels)){
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
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Annual Credit Card Sales Volume should be integer'));
			}
		}
		
		//System.debug('!!!'+legalEntityModel.getLegalEntityHasAcceptedCreditCards());
		if(String.isNotEmpty(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
			if(!ValidationUtil.validateBoolean(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Has Accepted Credit Cards should be either true or false'));
			}
		}
		//subMerchant Validations
		
		//System.debug('!!!'+subMerchantModel.getSubMerchantStreetAddress1());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantStreetAddress1())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantStreetAddress1(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Street Address 1 cannot exceed 60 characters'));
			}
		}
		
		//System.debug('!!!'+subMerchantModel.getSubMerchantStreetAddress2());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantStreetAddress2())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantStreetAddress2(), 60)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Street Address 2 cannot exceed 60 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantCity());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantCity())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantCity(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant City cannot exceed 20 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantStateProvince());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantStateProvince())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantStateProvince(), 2)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant State/Province cannot exceed 2 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantPostalCode());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantPostalCode())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPostalCode(), 5)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Postal Code cannot exceed 5 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantCountryCode());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantCountryCode())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantCountryCode(), 3)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Country Code cannot exceed 3 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantAmexMid());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantAmexMid())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAmexMid(), 15)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Amex MID cannot exceed 15 characters'));
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
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Create Credentials should be either true or false'));
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
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Discover Convey Mid cannot exceed 15 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantHardCodeBillingDescriptor())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantHardCodeBillingDescriptor(), 25)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Hard Code Billing Descriptor cannot exceed 25 characters'));
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

		//System.debug('!!!'+subMerchantModel.getSubMerchantFirstName());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantFirstName())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantFirstName(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant First Name cannot exceed 20 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantLastName());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantLastName())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantLastName(), 20)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Last Name cannot exceed 20 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantEmailAddress());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantEmailAddress())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantEmailAddress(), 100)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Email Address cannot exceed 100 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantPhone());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantPhone())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPhone(), 13)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Phone cannot exceed 13 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantPspMerchantId());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantPspMerchantId())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPspMerchantId(), 32)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'PSP Merchant ID cannot exceed 32 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchantUrl());
		if(String.isNotEmpty(subMerchantModel.getSubMerchantUrl())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantUrl(), 120)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'URL cannot exceed 120 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchanteCheckBillingDescriptor());
		if(String.isNotEmpty(subMerchantModel.getSubMerchanteCheckBillingDescriptor())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckBillingDescriptor(), 10)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'eCheck Billing Descriptor cannot exceed 10 characters'));
			}
		}

		//System.debug('!!!'+subMerchantModel.getSubMerchanteCheckCompanyName());
		if(String.isNotEmpty(subMerchantModel.getSubMerchanteCheckCompanyName())){
			if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckCompanyName(), 16)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'eCheck Company Name cannot exceed 16 characters'));
			}
		}
		
		return isInputValid;
	}
	
	public Boolean areRequiredFieldsFilled(){
		Boolean isAllRequiredFieldsPresent = true;
		if(String.isEmpty(legalEntityModel.getLegalEntityName())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Entity Name is Required'));
	
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
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Last Name is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getFirstName())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s First Name is Required'));
	
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
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'SSN is Required'));
		
				}
			}else{
				if(String.isEmpty(legalEntityModel.getLegalEntityTaxId())){
					isAllRequiredFieldsPresent = false;
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Tax ID is Required'));
		
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
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Has Accepted Credit Cards is Required'));
	
		}
		if(String.isEmpty(subMerchantModel.getSubMerchantCountryCode())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'SubMerchant\'s Country Code is Required'));
	
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
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Hard Code Billing Descriptor is Required'));
	
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
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'PSP Merchant ID is Required'));
	
		}
		return isAllRequiredFieldsPresent;		
		
	}
}