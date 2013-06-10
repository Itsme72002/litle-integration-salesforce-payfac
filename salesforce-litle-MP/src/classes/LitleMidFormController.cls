public class LitleMidFormController {
	
	public LegalEntityModel legalEntityModel{get; set;}
	public SubMerchantModel subMerchantModel{get; set;}
	public SalesforceLitleMappingsObject__c savedMappings {get; set;}
	public String urlAccountId {get; set;}
	public String urlOpportunityId {get; set;}
	public Account account{get; set;}
	public Boolean isTaxDisplayed{get; set;}
	public List<SelectOption> legalEntityTypeList{get; set;}
	public static List<Integer> pciLevels {get; set;}
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
        pciLevels = new List<Integer>();
		pciLevels.add(1);
		pciLevels.add(2);
		pciLevels.add(3);
		pciLevels.add(4);
		
        legalEntityTypeList = new List<SelectOption>();
        for (LegalEntityType.LegalEntityTypeEnum s: LegalEntityType.LegalEntityTypeEnum.values()){
        	legalEntityTypeList.add(new SelectOption(s.name(), LegalEntityType.stringValue(s.name())));
        }
        
        //legalEntityTypeList.add(new SelectOption(OTHER, 'Other'));
        savedMappings = new SalesforceLitleMappingsObject__c();
		legalEntityModel = new LegalEntityModel();
		subMerchantModel = new SubMerchantModel();
		List<SalesforceLitleMappingsObject__c> mappingRecords 
    			= [select forceMock__subMerchantStreetAddress1__c, forceMock__subMerchantStreetAddress2__c, forceMock__subMerchantCity__c, forceMock__subMerchantStateProvince__c, forceMock__subMerchantPostalCode__c, forceMock__subMerchantCountryCode__c, forceMock__subMerchantAmexMid__c, forceMock__subMerchantBankAccountNumber__c, forceMock__subMerchantBankRoutingNumber__c, forceMock__subMerchantCreateCredentials__c, forceMock__subMerchantCustomerServiceNumber__c, forceMock__subMerchantDiscoverConveyMid__c, forceMock__subMerchantHardCodeBillingDescriptor__c, forceMock__subMerchantMaxTransactionAmount__c, forceMock__subMerchantMerchantCategoryCode__c, forceMock__subMerchantMerchantName__c, forceMock__subMerchantFirstName__c, forceMock__subMerchantLastName__c, forceMock__subMerchantEmailAddress__c, forceMock__subMerchantPhone__c, forceMock__subMerchantPspMerchantId__c, forceMock__subMerchantUrl__c, forceMock__subMerchanteCheckBillingDescriptor__c, forceMock__subMerchanteCheckCompanyName__c, forceMock__subMerchantStreetAddress1D__c, forceMock__subMerchantStreetAddress2D__c, forceMock__subMerchantCityD__c, forceMock__subMerchantStateProvinceD__c, forceMock__subMerchantPostalCodeD__c, forceMock__subMerchantCountryCodeD__c, forceMock__subMerchantAmexMidD__c, forceMock__subMerchantBankAccountNumberD__c, forceMock__subMerchantBankRoutingNumberD__c, forceMock__subMerchantCreateCredentialsD__c, forceMock__subMerchantCustomerServiceNumberD__c, forceMock__subMerchantDiscoverConveyMidD__c, forceMock__subMerchantHardCodeBillingDescD__c, forceMock__subMerchantMaxTransactionAmountD__c, forceMock__subMerchantMerchantCategoryCodeD__c, forceMock__subMerchantMerchantNameD__c, forceMock__subMerchantFirstNameD__c, forceMock__subMerchantLastNameD__c, forceMock__subMerchantEmailAddressD__c, forceMock__subMerchantPhoneD__c, forceMock__subMerchantPspMerchantIdD__c, forceMock__subMerchantUrlD__c, forceMock__subMerchanteCheckBillingDescD__c, forceMock__subMerchanteCheckCompanyNameD__c, forceMock__subMerchantStreetAddress1X__c, forceMock__subMerchantStreetAddress2X__c, forceMock__subMerchantCityX__c, forceMock__subMerchantStateProvinceX__c, forceMock__subMerchantPostalCodeX__c, forceMock__subMerchantCountryCodeX__c, forceMock__subMerchantAmexMidX__c, forceMock__subMerchantBankAccountNumberX__c, forceMock__subMerchantBankRoutingNumberX__c, forceMock__subMerchantCreateCredentialsX__c, forceMock__subMerchantCustomerServiceNumberX__c, forceMock__subMerchantDiscoverConveyMidX__c, forceMock__subMerchantHardCodeBillingDescriptorX__c, forceMock__subMerchantMaxTransactionAmountX__c, forceMock__subMerchantMerchantCategoryCodeX__c, forceMock__subMerchantMerchantNameX__c, forceMock__subMerchantFirstNameX__c, forceMock__subMerchantLastNameX__c, forceMock__subMerchantEmailAddressX__c, forceMock__subMerchantPhoneX__c, forceMock__subMerchantPspMerchantIdX__c, forceMock__subMerchantUrlX__c, forceMock__subMerchanteCheckBillingDescriptorX__c, forceMock__subMerchanteCheckCompanyNameX__c, forceMock__legalEntityName__c, forceMock__legalEntityType__c, forceMock__legalEntityStreetAddress1__c, forceMock__legalEntityStreetAddress2__c, forceMock__legalEntityCity__c, forceMock__legalEntityStateProvince__c, forceMock__legalEntityPostalCode__c, forceMock__legalEntityCountryCode__c, forceMock__legalEntityFirstName__c, forceMock__legalEntityLastName__c, forceMock__legalEntityEmailAddress__c, forceMock__legalEntityContactPhone__c, forceMock__legalEntityDateOfBirth__c, forceMock__legalEntityDriversLicense__c, forceMock__legalEntityDriversLicenseState__c, forceMock__legalEntitySsn__c, forceMock__legalEntityTaxId__c, forceMock__legalEntityIsExclusiveToPsp__c, forceMock__legalEntityIsPciComplianceValidated__c, forceMock__legalEntityPciLevel__c, forceMock__legalEntityScanningVendor__c, forceMock__legalEntityQualifiedSecurityAssessor__c, forceMock__legalEntityMostRecentlyPassedScan__c, forceMock__legalEntityReportOnCompliance__c, forceMock__legalEntityAnnualCreditCardSalesVolume__c, forceMock__legalEntityHasAcceptedCreditCards__c, forceMock__legalEntityNameD__c, forceMock__legalEntityTypeD__c, forceMock__legalEntityStreetAddress1D__c, forceMock__legalEntityStreetAddress2D__c, forceMock__legalEntityCityD__c, forceMock__legalEntityStateProvinceD__c, forceMock__legalEntityPostalCodeD__c, forceMock__legalEntityCountryCodeD__c, forceMock__legalEntityFirstNameD__c, forceMock__legalEntityLastNameD__c, forceMock__legalEntityEmailAddressD__c, forceMock__legalEntityContactPhoneD__c, forceMock__legalEntityDateOfBirthD__c, forceMock__legalEntityDriversLicenseD__c, forceMock__legalEntityDriversLicenseStateD__c, forceMock__legalEntitySsnD__c, forceMock__legalEntityTaxIdD__c, forceMock__legalEntityIsExclusiveToPspD__c, forceMock__legalEntityIsPciComplianceValidatedD__c, forceMock__legalEntityPciLevelD__c, forceMock__legalEntityScanningVendorD__c, forceMock__legalEntityQualifiedSecurityAssessorD__c, forceMock__legalEntityMostRecentlyPassedScanD__c, forceMock__legalEntityReportOnComplianceD__c, forceMock__legalEntityAnnualCreditCardSalesVolumeD__c, forceMock__legalEntityHasAcceptedCreditCardsD__c, forceMock__legalEntityNameX__c, forceMock__legalEntityTypeX__c, forceMock__legalEntityStreetAddress1X__c, forceMock__legalEntityStreetAddress2X__c, forceMock__legalEntityCityX__c, forceMock__legalEntityStateProvinceX__c, forceMock__legalEntityPostalCodeX__c, forceMock__legalEntityCountryCodeX__c, forceMock__legalEntityFirstNameX__c, forceMock__legalEntityLastNameX__c, forceMock__legalEntityEmailAddressX__c, forceMock__legalEntityContactPhoneX__c, forceMock__legalEntityDateOfBirthX__c, forceMock__legalEntityDriversLicenseX__c, forceMock__legalEntityDriversLicenseStateX__c, forceMock__legalEntitySsnX__c, forceMock__legalEntityTaxIdX__c, forceMock__legalEntityIsExclusiveToPspX__c, forceMock__legalEntityIsPciComplianceValidatedX__c, forceMock__legalEntityPciLevelX__c, forceMock__legalEntityScanningVendorX__c, forceMock__legalEntityQualifiedSecurityAssessorX__c, forceMock__legalEntityMostRecentlyPassedScanX__c, forceMock__legalEntityReportOnComplianceX__c, forceMock__legalEntityAnnualCreditCardSalesVolumeX__c, forceMock__legalEntityHasAcceptedCreditCardsX__c, forceMock__legalEntityDoingBusinessAs__c, forceMock__legalEntityDoingBusinessAsX__c, forceMock__legalEntityDoingBusinessAsD__c  from forceMock__SalesforceLitleMappingsObject__c limit 1];
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
			legalEntityModel.setLegalEntityStreetAddress1(savedMappings.legalEntityStreetAddress1D__c);
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
				    			legalEntityModel.setLegalEntityStreetAddress1(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityStreetAddress1(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEAddress2(){
		if(!savedMappings.legalEntityStreetAddress2X__c){
			legalEntityModel.setLegalEntityStreetAddress2(savedMappings.legalEntityStreetAddress2D__c);
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
				    			legalEntityModel.setLegalEntityStreetAddress2(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityStreetAddress2(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLECity(){
		if(!savedMappings.legalEntityCityX__c){
			legalEntityModel.setLegalEntityCity(savedMappings.legalEntityCityD__c);
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
				    			legalEntityModel.setLegalEntityCity(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityCity(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEStateProvince(){
		if(!savedMappings.legalEntityStateProvinceX__c){
			legalEntityModel.setLegalEntityStateProvince(savedMappings.legalEntityStateProvinceD__c);
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
				    			legalEntityModel.setLegalEntityStateProvince(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityStateProvince(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEPostalCode(){
		if(!savedMappings.legalEntityPostalCodeX__c){
			legalEntityModel.setLegalEntityPostalCode(savedMappings.legalEntityPostalCodeD__c);
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
				    			legalEntityModel.setLegalEntityPostalCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityPostalCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLECountryCode(){
		if(!savedMappings.legalEntityCountryCodeX__c){
			legalEntityModel.setLegalEntityCountryCode(savedMappings.legalEntityCountryCodeD__c);
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
				    			legalEntityModel.setLegalEntityCountryCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityCountryCode(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEFirstName(){
		if(!savedMappings.legalEntityFirstNameX__c){
			legalEntityModel.setLegalEntityFirstName(savedMappings.legalEntityFirstNameD__c);
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
				    			legalEntityModel.setLegalEntityFirstName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityFirstName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLELastName(){
		if(!savedMappings.legalEntityLastNameX__c){
			legalEntityModel.setLegalEntityLastName(savedMappings.legalEntityLastNameD__c);
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
				    			legalEntityModel.setLegalEntityLastName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityLastName(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEEmailAddress(){
		if(!savedMappings.legalEntityEmailAddressX__c){
			legalEntityModel.setLegalEntityEmailAddress(savedMappings.legalEntityEmailAddressD__c);
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
				    			legalEntityModel.setLegalEntityEmailAddress(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityEmailAddress(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
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
				    			legalEntityModel.setLegalEntityContactPhone(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityContactPhone(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEDateOfBirth(){
		if(!savedMappings.legalEntityDateOfBirthX__c){
			legalEntityModel.setLegalEntityDateOfBirth(savedMappings.legalEntityDateOfBirthD__c);
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
				    			legalEntityModel.setLegalEntityDateOfBirth(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityDateOfBirth(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEDriversLicense(){
		if(!savedMappings.legalEntityDriversLicenseX__c){
			legalEntityModel.setLegalEntityDriversLicense(savedMappings.legalEntityDriversLicenseD__c);
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
				    			legalEntityModel.setLegalEntityDriversLicense(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityDriversLicense(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEDriversLicenseState(){
		if(!savedMappings.legalEntityDriversLicenseStateX__c){
			legalEntityModel.setLegalEntityDriversLicenseState(savedMappings.legalEntityDriversLicenseStateD__c);
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
				    			legalEntityModel.setLegalEntityDriversLicenseState(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityDriversLicenseState(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLESsn(){
		if(!savedMappings.legalEntitySsnX__c){
			legalEntityModel.setLegalEntitySsn(savedMappings.legalEntitySsnD__c);
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
				    			legalEntityModel.setLegalEntitySsn(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntitySsn(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
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
			legalEntityModel.setLegalEntityIsExclusiveToPsp(savedMappings.legalEntityIsExclusiveToPspD__c);
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
				    			legalEntityModel.setLegalEntityIsExclusiveToPsp(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityIsExclusiveToPsp(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEIsPciComplianceValidated(){
		if(!savedMappings.legalEntityIsPciComplianceValidatedX__c){
			legalEntityModel.setLegalEntityIsPciComplianceValidated(savedMappings.legalEntityIsPciComplianceValidatedD__c);
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
				    			legalEntityModel.setLegalEntityIsPciComplianceValidated(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityIsPciComplianceValidated(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEPciLevel(){
		if(!savedMappings.legalEntityPciLevelX__c){
			legalEntityModel.setLegalEntityPciLevel(savedMappings.legalEntityPciLevelD__c);
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
				    			legalEntityModel.setLegalEntityPciLevel(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityPciLevel(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEScanningVendor(){
		if(!savedMappings.legalEntityScanningVendorX__c){
			legalEntityModel.setLegalEntityScanningVendor(savedMappings.legalEntityScanningVendorD__c);
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
				    			legalEntityModel.setLegalEntityScanningVendor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityScanningVendor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEQualifiedSecurityAssessor(){
		if(!savedMappings.legalEntityQualifiedSecurityAssessorX__c){
			legalEntityModel.setLegalEntityQualifiedSecurityAssessor(savedMappings.legalEntityQualifiedSecurityAssessorD__c);
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
				    			legalEntityModel.setLegalEntityQualifiedSecurityAssessor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityQualifiedSecurityAssessor(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEMostRecentlyPassedScan(){
		if(!savedMappings.legalEntityMostRecentlyPassedScanX__c){
			legalEntityModel.setLegalEntityMostRecentlyPassedScan(savedMappings.legalEntityMostRecentlyPassedScanD__c);
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
				    			legalEntityModel.setLegalEntityMostRecentlyPassedScan(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityMostRecentlyPassedScan(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}
						
					}
				}	 
			}
		}
	}
	
	public void populateLEReportOnCompliance(){
		if(!savedMappings.legalEntityReportOnComplianceX__c){
			legalEntityModel.setLegalEntityReportOnCompliance(savedMappings.legalEntityReportOnComplianceD__c);
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
				    			legalEntityModel.setLegalEntityReportOnCompliance(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
				    		}
						}else if(sObjectName.equalsIgnoreCase('Opportunity')){
							List<Opportunity> sObjectValue = Database.query(query);
				    		if(!sObjectValue.isEmpty()){
				    			legalEntityModel.setLegalEntityReportOnCompliance(String.valueOf(sObjectValue.get(0).get(sObjectFieldName)));	
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
	public PageReference onChangeLegalEntityType(){
		if(String.isNotEmpty(legalEntityModel.getLegalEntityType())){
			if(legalEntityModel.getLegalEntityType().equals(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name())){
				isTaxDisplayed = false;
			}else{
				isTaxDisplayed = true;
			}
		}
		return null;
	}
	
	public Pagereference submit(){
		if(areRequiredFieldsFilled()){
			if(isInputDataValid()){
				
			}
			//Make API call
			//return to previous page
		}
		/*else{
			//Display error
		}
		System.debug('!!! In Submit');
		if(ValidationUtil.validateDate(legalEntityModel.getLegalEntityDateOfBirth())){
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Valid Date'));
		}else{
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Invalid Date'));
		}
		//ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Required Field'));*/
		return null;
		
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
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityName(), 60)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Entity Name cannot exceed 60 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityStreetAddress1(), 60)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Street Address 1 cannot exceed 60 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityStreetAddress2(), 60)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Street Address 2 cannot exceed 60 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityCity(), 20)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'City cannot exceed 20 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityStateProvince(), 2)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'State/Province cannot exceed 2 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPostalCode(), 5)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Postal Code cannot exceed 5 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityCountryCode(), 3)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Country Code cannot exceed 3 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityFirstName(), 20)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'First Name cannot exceed 20 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityLastName(), 20)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Last Name cannot exceed 20 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityEmailAddress(), 100)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Email Address cannot exceed 100 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityContactPhone(), 10)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Contact Phone cannot exceed 10 characters'));
		}
		if(!ValidationUtil.validateDate(legalEntityModel.getLegalEntityDateOfBirth())){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Date of Birth is not in yyyy-mm-dd format'));
		}
		
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityDriversLicense(), 25)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Drivers License cannot exceed 25 characters'));
		}
		
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityDriversLicenseState(), 2)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Drivers License State cannot exceed 2 characters'));
		}
		if(legalEntityModel.getLegalEntityType().equalsIgnoreCase(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name())){
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntitySsn(), 9)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'SSN cannot exceed 9 characters'));
			}
		}else{
			if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityTaxId(), 9)){
				isInputValid = false;
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Tax ID cannot exceed 9 characters'));
			}
		}
		
		if(!ValidationUtil.validateBoolean(legalEntityModel.getLegalEntityIsExclusiveToPsp())){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Is Exclusive to PSP should be either true or false'));
		}
		
		if(!ValidationUtil.validateBoolean(legalEntityModel.getLegalEntityIsPcicomplianceValidated())){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Is PCI Compliance Validated should be either true or false'));
		}
		
		
		if(!ValidationUtil.validateIntegerValue(legalEntityModel.getLegalEntityPciLevel(), pciLevels)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Is PCI Compliance Validated should be either true or false'));
		}
		
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityScanningVendor(), 9)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Scanning Vendor cannot exceed 9 characters'));
		}
		if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityQualifiedSecurityAssessor(), 50)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Qualified Security Assessor cannot exceed 50 characters'));
		}
		
		if(!ValidationUtil.validateDate(legalEntityModel.getLegalEntityMostRecentlyPassedScan())){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Most Recently Passed Scan is not in yyyy-mm-dd format'));
		}
		
		if(!ValidationUtil.validateDate(legalEntityModel.getLegalEntityReportOnCompliance())){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Report On Compliance is not in yyyy-mm-dd format'));
		}
		
		if(!ValidationUtil.validateInteger(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Annual Credit Card Sales Volume should be integer'));
		}
		
		if(!ValidationUtil.validateBoolean(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Has Accepted Credit Cards should be either true or false'));
		}
		//subMerchant Validations
		
		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantStreetAddress1(), 60)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Street Address 1 cannot exceed 60 characters'));
		}
		
		

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantStreetAddress2(), 60)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Street Address 2 cannot exceed 60 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantCity(), 20)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant City cannot exceed 20 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantStateProvince(), 2)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant State/Province cannot exceed 2 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPostalCode(), 5)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Postal Code cannot exceed 5 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantCountryCode(), 3)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Country Code cannot exceed 3 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAmexMid(), 15)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Amex MID cannot exceed 15 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantBankAccountNumber(), 50)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Bank Account Number cannot exceed 50 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantBankRoutingNumber(), 50)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Bank Routing Number cannot exceed 50 characters'));
		}
		
		if(!ValidationUtil.validateBoolean(subMerchantModel.getSubMerchantCreateCredentials())){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Create Credentials should be either true or false'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantCustomerServiceNumber(), 13)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Customer Service Number cannot exceed 13 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantDiscoverConveyMid(), 15)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Discover Convey Mid cannot exceed 15 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantHardCodeBillingDescriptor(), 25)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Hard Code Billing Descriptor cannot exceed 25 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMaxTransactionAmount(), 19)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Max Transaction Amount cannot exceed 19 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMerchantCategoryCode(), 4)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Merchant Category Code cannot exceed 4 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMerchantName(), 50)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Merchant Name cannot exceed 50 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantFirstName(), 20)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant First Name cannot exceed 20 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantLastName(), 20)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Last Name cannot exceed 20 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantEmailAddress(), 100)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Email Address cannot exceed 100 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPhone(), 13)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sub Merchant Phone cannot exceed 13 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPspMerchantId(), 32)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'PSP Merchant ID cannot exceed 32 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantUrl(), 120)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'URL cannot exceed 120 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckBillingDescriptor(), 10)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'eCheck Billing Descriptor cannot exceed 10 characters'));
		}

		if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckCompanyName(), 16)){
			isInputValid = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'eCheck Company Name cannot exceed 16 characters'));
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
		if(String.isEmpty(legalEntityModel.getLegalEntityStreetAddress1())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Street Address 1 is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityCountryCode())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Country Code is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityLastName())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Last Name is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityFirstName())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s First Name is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityType())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity Type is Required'));
		}else{
			if(legalEntityModel.getLegalEntityType().equalsIgnoreCase(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name())){
				if(String.isEmpty(legalEntityModel.getLegalEntityCity())){
					isAllRequiredFieldsPresent = false;
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s City is Required'));
		
				}
				if(String.isEmpty(legalEntityModel.getLegalEntityStateProvince())){
					isAllRequiredFieldsPresent = false;
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s State/Province is Required'));
		
				}
				if(String.isEmpty(legalEntityModel.getLegalEntityPostalCode())){
					isAllRequiredFieldsPresent = false;
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Legal Entity\'s Postal Code is Required'));
		
				}
				if(String.isEmpty(legalEntityModel.getLegalEntitySsn())){
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
		if(String.isEmpty(legalEntityModel.getLegalEntityIsExclusiveToPsp())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Is Exclusive to PSP is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityIsPciComplianceValidated())){
			isAllRequiredFieldsPresent = false;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Is PCI Compliance Validated is Required'));
	
		}
		if(String.isEmpty(legalEntityModel.getLegalEntityPciLevel())){
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