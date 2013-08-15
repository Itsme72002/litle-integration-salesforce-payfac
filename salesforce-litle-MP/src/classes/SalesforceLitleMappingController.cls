public class SalesforceLitleMappingController {
    private List < Selectoption > salesforceFields;
    private final String emptyString = '';
    //Holds the current mappings from the page
    public SalesforceLitleMappingsObject__c currentMappings {get; set;}
    public List<SelectOption> legalEntityTypeList{get; set;}
    public List<SelectOption> litleEnvironmentList{get; set;}
    
    public SalesforceLitleMappingController() {
    	legalEntityTypeList = new List<SelectOption>();
        for (LegalEntityType.LegalEntityTypeEnum s: LegalEntityType.LegalEntityTypeEnum.values()){
        	legalEntityTypeList.add(new SelectOption(s.name(), LegalEntityType.stringValue(s.name())));
        }
        litleEnvironmentList = new List<SelectOption>();
        for (LitleEnvironment.LitleEnvironmentEnum s: LitleEnvironment.LitleEnvironmentEnum.values()){
        	litleEnvironmentList.add(new SelectOption(s.name(), LitleEnvironment.stringValue(s.name())));
        }
        
        List < SalesforceLitleMappingsObject__c > mappingRecords = [select id, name, litleEnvironment__c, legalEntityAnnualCreditCardSalesVolume__c, legalEntityAnnualCreditCardSalesVolumeD__c, legalEntityAnnualCreditCardSalesVolumeX__c, legalEntityCity__c, legalEntityCityD__c, legalEntityCityX__c, legalEntityContactPhone__c, legalEntityContactPhoneD__c, legalEntityContactPhoneX__c, legalEntityCountryCode__c, legalEntityCountryCodeD__c, legalEntityCountryCodeX__c, legalEntityDateOfBirth__c, legalEntityDateOfBirthX__c, legalEntityDoingBusinessAs__c, legalEntityDoingBusinessAsD__c, legalEntityDoingBusinessAsX__c, legalEntityPrincipalEmailAddress__c, legalEntityPrincipalEmailAddressD__c, legalEntityPrincipalEmailAddressX__c, legalEntityFirstName__c, legalEntityFirstNameD__c, legalEntityFirstNameX__c, legalEntityHasAcceptedCreditCards__c, legalEntityHasAcceptedCreditCardsD__c, legalEntityHasAcceptedCreditCardsX__c, legalEntityLastName__c, legalEntityLastNameD__c, legalEntityLastNameX__c, legalEntityName__c, legalEntityNameD__c, legalEntityNameX__c, legalEntityPostalCode__c, legalEntityPostalCodeD__c, legalEntityPostalCodeX__c, legalEntityPrincipalDateOfBirth__c, legalEntityPrincipalDateOfBirthD__c, legalEntityPrincipalDateOfBirthX__c, legalEntityPrincipalDriversLicense__c, legalEntityPrincipalDriversLicenseD__c, legalEntityPrincipalDriversLicenseState__c, legalEntityPrincipalDriversLicenseStateD__c, legalEntityPrincipalDriversLicenseStateX__c, legalEntityPrincipalDriversLicenseX__c, legalEntityPrincipalFirstName__c, legalEntityPrincipalFirstNameD__c, legalEntityPrincipalFirstNameX__c, legalEntityPrincipalLastName__c, legalEntityPrincipalLastNameD__c, legalEntityPrincipalLastNameX__c, legalEntityPrincipalSsn__c, legalEntityPrincipalSsnD__c, legalEntityPrincipalSsnX__c, legalEntityStateProvince__c, legalEntityStateProvinceD__c, legalEntityStateProvinceX__c, legalEntityStreetAddress1__c, legalEntityStreetAddress1D__c, legalEntityStreetAddress1X__c, legalEntityStreetAddress2__c, legalEntityStreetAddress2D__c, legalEntityStreetAddress2X__c, legalEntityTaxId__c, legalEntityTaxIdD__c, legalEntityTaxIdX__c, legalEntityType__c, legalEntityTypeD__c, legalEntityTypeX__c, merchantPassword__c, merchantUsername__c, subMerchantAmexMid__c, subMerchantAmexMidD__c, subMerchantAmexMidX__c, subMerchantBankAccountNumber__c, subMerchantBankAccountNumberD__c, subMerchantBankAccountNumberX__c, subMerchantBankRoutingNumber__c, subMerchantBankRoutingNumberD__c, subMerchantBankRoutingNumberX__c, subMerchantCity__c, subMerchantCityD__c, subMerchantCityX__c, subMerchantCountryCode__c, subMerchantCountryCodeD__c, subMerchantCountryCodeX__c, subMerchantCreateCredentials__c, subMerchantCreateCredentialsD__c, subMerchantCreateCredentialsX__c, subMerchantCustomerServiceNumber__c, subMerchantCustomerServiceNumberD__c, subMerchantCustomerServiceNumberX__c, subMerchantDiscoverConveyMid__c, subMerchantDiscoverConveyMidD__c, subMerchantDiscoverConveyMidX__c, subMerchanteCheckBillingDescD__c, subMerchanteCheckBillingDescriptor__c, subMerchanteCheckBillingDescriptorX__c, subMerchanteCheckCompanyName__c, subMerchanteCheckCompanyNameD__c, subMerchanteCheckCompanyNameX__c, subMerchantEmailAddress__c, subMerchantEmailAddressD__c, subMerchantEmailAddressX__c, subMerchantFirstName__c, subMerchantFirstNameD__c, subMerchantFirstNameX__c, subMerchantHardCodeBillingDescD__c, subMerchantHardCodeBillingDescriptor__c, subMerchantHardCodeBillingDescriptorX__c, subMerchantLastName__c, subMerchantLastNameD__c, subMerchantLastNameX__c, subMerchantMaxTransactionAmount__c, subMerchantMaxTransactionAmountD__c, subMerchantMaxTransactionAmountX__c, subMerchantMerchantCategoryCode__c, subMerchantMerchantCategoryCodeD__c, subMerchantMerchantCategoryCodeX__c, subMerchantMerchantName__c, subMerchantMerchantNameD__c, subMerchantMerchantNameX__c, subMerchantPhone__c, subMerchantPhoneD__c, subMerchantPhoneX__c, subMerchantPostalCode__c, subMerchantPostalCodeD__c, subMerchantPostalCodeX__c, subMerchantPspMerchantId__c, subMerchantPspMerchantIdD__c, subMerchantPspMerchantIdX__c, subMerchantStateProvince__c, subMerchantStateProvinceD__c, subMerchantStateProvinceX__c, subMerchantStreetAddress1__c, subMerchantStreetAddress1D__c, subMerchantStreetAddress1X__c, subMerchantStreetAddress2__c, subMerchantStreetAddress2D__c, subMerchantStreetAddress2X__c, subMerchantUrl__c, subMerchantUrlD__c, subMerchantUrlX__c, legalEntityPrincipalContactPhone__c, legalEntityPrincipalContactPhoneD__c, legalEntityPrincipalContactPhoneX__c, legalEntityPrincipalCity__c, legalEntityPrincipalCityD__c, legalEntityPrincipalCityX__c, legalEntityPrincipalCountryCode__c, legalEntityPrincipalCountryCodeD__c, legalEntityPrincipalCountryCodeX__c, legalEntityPrincipalPostalCode__c, legalEntityPrincipalPostalCodeD__c, legalEntityPrincipalPostalCodeX__c, legalEntityPrincipalStateProvince__c, legalEntityPrincipalStateProvinceD__c, legalEntityPrincipalStateProvinceX__c, legalEntityPrincipalStreetAddress1__c, legalEntityPrincipalStreetAddress1D__c, legalEntityPrincipalStreetAddress1X__c, legalEntityPrincipalStreetAddress2__c, legalEntityPrincipalStreetAddress2D__c, legalEntityPrincipalStreetAddress2X__c from SalesforceLitleMappingsObject__c limit 1];
        if (mappingRecords.isEmpty()) {
            this.currentMappings = new SalesforceLitleMappingsObject__c();
        } else {
            this.currentMappings = mappingRecords.get(0);
        }
    }

    
    public List < Selectoption > getSalesforceFields() {
        if (salesforceFields == null || salesforceFields.size() == 0) {
            setSalesforceFields(fetchAllAccountFields());
        }
        return salesforceFields;
    }

    public void setSalesforceFields(List < Selectoption > salesforceFields) {
        this.salesforceFields = salesforceFields;
    }

    public List < Selectoption > fetchAllAccountFields() {
        List < Selectoption > allFields = new List < Selectoption > ();
        allFields.add(new Selectoption('', '-- Select Option --'));
        //allFields.add(new Selectoption('Opportunity.Name', 'Opportunity.Name'));
        
        // Add account fields
        SObjectType objToken = Schema.getGlobalDescribe().get('Account');
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map < String, SObjectField > fields = objDef.fields.getMap();
        Set < String > fieldSet = fields.keySet();
        for (String s: fieldSet) {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            allFields.add(new Selectoption('Account.' + selectedField.getName(), 'Account.' + selectedField.getLabel()));

        }
        //Add Opportunity fields
        objToken = Schema.getGlobalDescribe().get('Opportunity');
        objDef = objToken.getDescribe();
        fields = objDef.fields.getMap();
        fieldSet = fields.keySet();
		for (String s: fieldSet) {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            allFields.add(new Selectoption('Opportunity.' + selectedField.getName(),
            								 'Opportunity.' + selectedField.getLabel()));
		}	
		return allFields;
    }

    
    //Legal Entity on change listeners	 
    public Pagereference onSelectChangeLegalEntityName() {
        if (currentMappings.legalEntityName__c == null) {
            currentMappings.legalEntityNameX__c = false;
        } else {
            currentMappings.legalEntityNameX__c = true;
        }
        return null;
    }

    public Pagereference onSelectChangeLegalEntityDoingBusinessAs() {
        if (currentMappings.legalEntityDoingBusinessAs__c == null) {
            currentMappings.legalEntityDoingBusinessAsX__c = false;
        } else {
            currentMappings.legalEntityDoingBusinessAsX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityType() {
        if (currentMappings.legalEntityType__c == null) {
            currentMappings.legalEntityTypeX__c = false;
        } else {
            currentMappings.legalEntityTypeX__c = true;
        }
        return null;
    }


    public PageReference onSelectChangeLegalEntityStreetAddress1() {
        if (currentMappings.legalEntityStreetAddress1__c == null) {
            currentMappings.legalEntityStreetAddress1X__c = false;
        } else {
            currentMappings.legalEntityStreetAddress1X__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityStreetAddress2() {
        if (currentMappings.legalEntityStreetAddress2__c == null) {
            currentMappings.legalEntityStreetAddress2X__c = false;
        } else {
            currentMappings.legalEntityStreetAddress2X__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityCity() {
        if (currentMappings.legalEntityCity__c == null) {
            currentMappings.legalEntityCityX__c = false;
        } else {
            currentMappings.legalEntityCityX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityStateProvince() {
        if (currentMappings.legalEntityStateProvince__c == null) {
            currentMappings.legalEntityStateProvinceX__c = false;
        } else {
            currentMappings.legalEntityStateProvinceX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPostalCode() {
        if (currentMappings.legalEntityPostalCode__c == null) {
            currentMappings.legalEntityPostalCodeX__c = false;
        } else {
            currentMappings.legalEntityPostalCodeX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityCountryCode() {
        if (currentMappings.legalEntityCountryCode__c == null) {
            currentMappings.legalEntityCountryCodeX__c = false;
        } else {
            currentMappings.legalEntityCountryCodeX__c = true;
        }
        return null;
    }
    
    public PageReference onSelectChangeLegalEntityPrincipalStreetAddress1() {
        if (currentMappings.LegalEntityPrincipalStreetAddress1__c == null) {
            currentMappings.LegalEntityPrincipalStreetAddress1X__c = false;
        } else {
            currentMappings.LegalEntityPrincipalStreetAddress1X__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalStreetAddress2() {
        if (currentMappings.LegalEntityPrincipalStreetAddress2__c == null) {
            currentMappings.LegalEntityPrincipalStreetAddress2X__c = false;
        } else {
            currentMappings.LegalEntityPrincipalStreetAddress2X__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalCity() {
        if (currentMappings.LegalEntityPrincipalCity__c == null) {
            currentMappings.LegalEntityPrincipalCityX__c = false;
        } else {
            currentMappings.LegalEntityPrincipalCityX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalStateProvince() {
        if (currentMappings.LegalEntityPrincipalStateProvince__c == null) {
            currentMappings.LegalEntityPrincipalStateProvinceX__c = false;
        } else {
            currentMappings.LegalEntityPrincipalStateProvinceX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalPostalCode() {
        if (currentMappings.LegalEntityPrincipalPostalCode__c == null) {
            currentMappings.LegalEntityPrincipalPostalCodeX__c = false;
        } else {
            currentMappings.LegalEntityPrincipalPostalCodeX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalCountryCode() {
        if (currentMappings.LegalEntityPrincipalCountryCode__c == null) {
            currentMappings.LegalEntityPrincipalCountryCodeX__c = false;
        } else {
            currentMappings.LegalEntityPrincipalCountryCodeX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalFirstName() {
        if (currentMappings.legalEntityPrincipalFirstName__c == null) {
            currentMappings.legalEntityPrincipalFirstNameX__c = false;
        } else {
            currentMappings.legalEntityPrincipalFirstNameX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalLastName() {
        if (currentMappings.LegalEntityPrincipalLastName__c == null) {
            currentMappings.LegalEntityPrincipalLastNameX__c = false;
        } else {
            currentMappings.LegalEntityPrincipalLastNameX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalEmailAddress() {
        if (currentMappings.legalEntityPrincipalEmailAddress__c == null) {
            currentMappings.legalEntityPrincipalEmailAddressX__c = false;
        } else {
            currentMappings.legalEntityPrincipalEmailAddressX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityContactPhone() {
        if (currentMappings.legalEntityContactPhone__c == null) {
            currentMappings.legalEntityContactPhoneX__c = false;
        } else {
            currentMappings.legalEntityContactPhoneX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalDateOfBirth() {
        if (currentMappings.legalEntityPrincipalDateOfBirth__c == null) {
            currentMappings.legalEntityPrincipalDateOfBirthX__c = false;
        } else {
            currentMappings.legalEntityPrincipalDateOfBirthX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalDriversLicense() {
        if (currentMappings.legalEntityPrincipalDriversLicense__c == null) {
            currentMappings.legalEntityPrincipalDriversLicenseX__c = false;
        } else {
            currentMappings.legalEntityPrincipalDriversLicenseX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalDriversLicenseState() {
        if (currentMappings.legalEntityPrincipalDriversLicenseState__c == null) {
            currentMappings.legalEntityPrincipalDriversLicenseStateX__c = false;
        } else {
            currentMappings.legalEntityPrincipalDriversLicenseStateX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalSsn() {
        if (currentMappings.legalEntityPrincipalSsn__c == null) {
            currentMappings.legalEntityPrincipalSsnX__c = false;
        } else {
            currentMappings.legalEntityPrincipalSsnX__c = true;
        }
        return null;
    }
    
    public PageReference onSelectChangeLegalEntityPrincipalContactPhone() {
        if (currentMappings.legalEntityPrincipalContactPhone__c == null) {
            currentMappings.legalEntityPrincipalContactPhoneX__c = false;
        } else {
            currentMappings.legalEntityPrincipalContactPhoneX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityTaxId() {
        if (currentMappings.legalEntityTaxId__c == null) {
            currentMappings.legalEntityTaxIdX__c = false;
        } else {
            currentMappings.legalEntityTaxIdX__c = true;
        }
        return null;
    }
	
	
    public PageReference onSelectChangeLegalEntityAnnualCreditCardSalesVolume() {
        if (currentMappings.legalEntityAnnualCreditCardSalesVolume__c == null) {
            currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c = false;
        } else {
            currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityHasAcceptedCreditCards() {
        if (currentMappings.legalEntityHasAcceptedCreditCards__c == null) {
            currentMappings.legalEntityHasAcceptedCreditCardsX__c = false;
        } else {
            currentMappings.legalEntityHasAcceptedCreditCardsX__c = true;
        }
        return null;
    }


    //Sub merchant on change listeners
    public PageReference onSelectChangeSubMerchantStreetAddress1() {
        if (currentMappings.subMerchantStreetAddress1__c == null) {
            currentMappings.subMerchantStreetAddress1X__c = false;
        } else {
            currentMappings.subMerchantStreetAddress1X__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantStreetAddress2() {
        if (currentMappings.subMerchantStreetAddress2__c == null) {
            currentMappings.subMerchantStreetAddress2X__c = false;
        } else {
            currentMappings.subMerchantStreetAddress2X__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantCity() {
        if (currentMappings.subMerchantCity__c == null) {
            currentMappings.subMerchantCityX__c = false;
        } else {
            currentMappings.subMerchantCityX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantStateProvince() {
        if (currentMappings.subMerchantStateProvince__c == null) {
            currentMappings.subMerchantStateProvinceX__c = false;
        } else {
            currentMappings.subMerchantStateProvinceX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantPostalCode() {
        if (currentMappings.subMerchantPostalCode__c == null) {
            currentMappings.subMerchantPostalCodeX__c = false;
        } else {
            currentMappings.subMerchantPostalCodeX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantCountryCode() {
        if (currentMappings.subMerchantCountryCode__c == null) {
            currentMappings.subMerchantCountryCodeX__c = false;
        } else {
            currentMappings.subMerchantCountryCodeX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantAmexMid() {
        if (currentMappings.subMerchantAmexMid__c == null) {
            currentMappings.subMerchantAmexMidX__c = false;
        } else {
            currentMappings.subMerchantAmexMidX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantBankAccountNumber() {
        if (currentMappings.subMerchantBankAccountNumber__c == null) {
            currentMappings.subMerchantBankAccountNumberX__c = false;
        } else {
            currentMappings.subMerchantBankAccountNumberX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantBankRoutingNumber() {
        if (currentMappings.subMerchantBankRoutingNumber__c == null) {
            currentMappings.subMerchantBankRoutingNumberX__c = false;
        } else {
            currentMappings.subMerchantBankRoutingNumberX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantCreateCredentials() {
        if (currentMappings.subMerchantCreateCredentials__c == null) {
            currentMappings.subMerchantCreateCredentialsX__c = false;
        } else {
            currentMappings.subMerchantCreateCredentialsX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantCustomerServiceNumber() {
        if (currentMappings.subMerchantCustomerServiceNumber__c == null) {
            currentMappings.subMerchantCustomerServiceNumberX__c = false;
        } else {
            currentMappings.subMerchantCustomerServiceNumberX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantDiscoverConveyMid() {
        if (currentMappings.subMerchantDiscoverConveyMid__c == null) {
            currentMappings.subMerchantDiscoverConveyMidX__c = false;
        } else {
            currentMappings.subMerchantDiscoverConveyMidX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantHardCodeBillingDescriptor() {
        if (currentMappings.subMerchantHardCodeBillingDescriptor__c == null) {
            currentMappings.subMerchantHardCodeBillingDescriptorX__c = false;
        } else {
            currentMappings.subMerchantHardCodeBillingDescriptorX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantMaxTransactionAmount() {
        if (currentMappings.subMerchantMaxTransactionAmount__c == null) {
            currentMappings.subMerchantMaxTransactionAmountX__c = false;
        } else {
            currentMappings.subMerchantMaxTransactionAmountX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantMerchantCategoryCode() {
        if (currentMappings.subMerchantMerchantCategoryCode__c == null) {
            currentMappings.subMerchantMerchantCategoryCodeX__c = false;
        } else {
            currentMappings.subMerchantMerchantCategoryCodeX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantMerchantName() {
        if (currentMappings.subMerchantMerchantName__c == null) {
            currentMappings.subMerchantMerchantNameX__c = false;
        } else {
            currentMappings.subMerchantMerchantNameX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantFirstName() {
        if (currentMappings.subMerchantFirstName__c == null) {
            currentMappings.subMerchantFirstNameX__c = false;
        } else {
            currentMappings.subMerchantFirstNameX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantLastName() {
        if (currentMappings.subMerchantLastName__c == null) {
            currentMappings.subMerchantLastNameX__c = false;
        } else {
            currentMappings.subMerchantLastNameX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantEmailAddress() {
        if (currentMappings.subMerchantEmailAddress__c == null) {
            currentMappings.subMerchantEmailAddressX__c = false;
        } else {
            currentMappings.subMerchantEmailAddressX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantPhone() {
        if (currentMappings.subMerchantPhone__c == null) {
            currentMappings.subMerchantPhoneX__c = false;
        } else {
            currentMappings.subMerchantPhoneX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantPspMerchantId() {
        if (currentMappings.subMerchantPspMerchantId__c == null) {
            currentMappings.subMerchantPspMerchantIdX__c = false;
        } else {
            currentMappings.subMerchantPspMerchantIdX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchantUrl() {
        if (currentMappings.subMerchantUrl__c == null) {
            currentMappings.subMerchantUrlX__c = false;
        } else {
            currentMappings.subMerchantUrlX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchanteCheckBillingDescriptor() {
        if (currentMappings.subMerchanteCheckBillingDescriptor__c == null) {
            currentMappings.subMerchanteCheckBillingDescriptorX__c = false;
        } else {
            currentMappings.subMerchanteCheckBillingDescriptorX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeSubMerchanteCheckCompanyName() {
        if (currentMappings.subMerchanteCheckCompanyName__c == null) {
            currentMappings.subMerchanteCheckCompanyNameX__c = false;
        } else {
            currentMappings.subMerchanteCheckCompanyNameX__c = true;
        }
        return null;
    }

    //Removing the default textbox values which have been disabled
    public void removeDisabledText() {
        if (currentMappings.subMerchantStreetAddress1X__c) {
            currentMappings.subMerchantStreetAddress1D__c = emptyString;
        }

        if (currentMappings.subMerchantStreetAddress2X__c) {
            currentMappings.subMerchantStreetAddress2D__c = emptyString;
        }

        if (currentMappings.subMerchantCityX__c) {
            currentMappings.subMerchantCityD__c = emptyString;
        }

        if (currentMappings.subMerchantStateProvinceX__c) {
            currentMappings.subMerchantStateProvinceD__c = emptyString;
        }

        if (currentMappings.subMerchantPostalCodeX__c) {
            currentMappings.subMerchantPostalCodeD__c = emptyString;
        }

        if (currentMappings.subMerchantCountryCodeX__c) {
            currentMappings.subMerchantCountryCodeD__c = emptyString;
        }

        if (currentMappings.subMerchantAmexMidX__c) {
            currentMappings.subMerchantAmexMidD__c = emptyString;
        }

        if (currentMappings.subMerchantBankAccountNumberX__c) {
            currentMappings.subMerchantBankAccountNumberD__c = emptyString;
        }

        if (currentMappings.subMerchantBankRoutingNumberX__c) {
            currentMappings.subMerchantBankRoutingNumberD__c = emptyString;
        }

        if (currentMappings.subMerchantCreateCredentialsX__c) {
            currentMappings.subMerchantCreateCredentialsD__c = emptyString;
        }

        if (currentMappings.subMerchantCustomerServiceNumberX__c) {
            currentMappings.subMerchantCustomerServiceNumberD__c = emptyString;
        }

        if (currentMappings.subMerchantDiscoverConveyMidX__c) {
            currentMappings.subMerchantDiscoverConveyMidD__c = emptyString;
        }

        if (currentMappings.subMerchantHardCodeBillingDescriptorX__c) {
            currentMappings.subMerchantHardCodeBillingDescD__c = emptyString;
        }

        if (currentMappings.subMerchantMaxTransactionAmountX__c) {
            currentMappings.subMerchantMaxTransactionAmountD__c = emptyString;
        }

        if (currentMappings.subMerchantMerchantCategoryCodeX__c) {
            currentMappings.subMerchantMerchantCategoryCodeD__c = emptyString;
        }

        if (currentMappings.subMerchantMerchantNameX__c) {
            currentMappings.subMerchantMerchantNameD__c = emptyString;
        }

        if (currentMappings.subMerchantFirstNameX__c) {
            currentMappings.subMerchantFirstNameD__c = emptyString;
        }

        if (currentMappings.subMerchantLastNameX__c) {
            currentMappings.subMerchantLastNameD__c = emptyString;
        }

        if (currentMappings.subMerchantEmailAddressX__c) {
            currentMappings.subMerchantEmailAddressD__c = emptyString;
        }

        if (currentMappings.subMerchantPhoneX__c) {
            currentMappings.subMerchantPhoneD__c = emptyString;
        }

        if (currentMappings.subMerchantPspMerchantIdX__c) {
            currentMappings.subMerchantPspMerchantIdD__c = emptyString;
        }

        if (currentMappings.subMerchantUrlX__c) {
            currentMappings.subMerchantUrlD__c = emptyString;
        }

        if (currentMappings.subMerchanteCheckBillingDescriptorX__c) {
            currentMappings.subMerchanteCheckBillingDescD__c = emptyString;
        }

        if (currentMappings.subMerchanteCheckCompanyNameX__c) {
            currentMappings.subMerchanteCheckCompanyNameD__c = emptyString;
        }

        if (currentMappings.legalEntityNameX__c) {
            currentMappings.legalEntityNameD__c = emptyString;
        }

        if (currentMappings.legalEntityStreetAddress1X__c) {
            currentMappings.legalEntityStreetAddress1D__c = emptyString;
        }

        if (currentMappings.legalEntityStreetAddress2X__c) {
            currentMappings.legalEntityStreetAddress2D__c = emptyString;
        }

        if (currentMappings.legalEntityCityX__c) {
            currentMappings.legalEntityCityD__c = emptyString;
        }

        if (currentMappings.legalEntityStateProvinceX__c) {
            currentMappings.legalEntityStateProvinceD__c = emptyString;
        }

        if (currentMappings.legalEntityDoingBusinessAsX__c) {
            currentMappings.legalEntityDoingBusinessAsD__c = emptyString;
        }

        if (currentMappings.legalEntityPostalCodeX__c) {
            currentMappings.legalEntityPostalCodeD__c = emptyString;
        }

        if (currentMappings.legalEntityCountryCodeX__c) {
            currentMappings.legalEntityCountryCodeD__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalFirstNameX__c) {
            currentMappings.legalEntityPrincipalFirstNameD__c = emptyString;
        }

        if (currentMappings.LegalEntityPrincipalLastNameX__c) {
            currentMappings.LegalEntityPrincipalLastNameD__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalEmailAddressX__c) {
            currentMappings.legalEntityPrincipalEmailAddressD__c = emptyString;
        }

        if (currentMappings.legalEntityContactPhoneX__c) {
            currentMappings.legalEntityContactPhoneD__c = emptyString;
        }
        
        if (currentMappings.legalEntityPrincipalContactPhoneX__c) {
            currentMappings.legalEntityPrincipalContactPhoneD__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalDateOfBirthX__c) {
            currentMappings.legalEntityPrincipalDateOfBirthD__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalDriversLicenseX__c) {
            currentMappings.legalEntityPrincipalDriversLicenseD__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalDriversLicenseStateX__c) {
            currentMappings.legalEntityPrincipalDriversLicenseStateD__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalSsnX__c) {
            currentMappings.legalEntityPrincipalSsnD__c = emptyString;
        }

		if (currentMappings.legalEntityPrincipalStreetAddress1X__c) {
            currentMappings.legalEntityPrincipalStreetAddress1D__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalStreetAddress2X__c) {
            currentMappings.legalEntityPrincipalStreetAddress2D__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalCityX__c) {
            currentMappings.legalEntityPrincipalCityD__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalStateProvinceX__c) {
            currentMappings.legalEntityPrincipalStateProvinceD__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalPostalCodeX__c) {
            currentMappings.legalEntityPrincipalPostalCodeD__c = emptyString;
        }

        if (currentMappings.legalEntityPrincipalCountryCodeX__c) {
            currentMappings.legalEntityPrincipalCountryCodeD__c = emptyString;
        }
        
        if (currentMappings.legalEntityTaxIdX__c) {
            currentMappings.legalEntityTaxIdD__c = emptyString;
        }
		
		if (currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c) {
            currentMappings.legalEntityAnnualCreditCardSalesVolumeD__c = emptyString;
        }

        if (currentMappings.legalEntityHasAcceptedCreditCardsX__c) {
            currentMappings.legalEntityHasAcceptedCreditCardsD__c = emptyString;
        }

    }

    public Pagereference saveMappings() {
        removeDisabledText();
        try{
        	upsert currentMappings;
            ApexPageUtil.addConfirmMessage('Mappings Saved.');
        } catch (DmlException e) {
        	ApexPageUtil.addErrorMessage('Error in Saving Mappings.');
        }
        if(String.isEmpty(currentMappings.merchantUsername__c) || String.isEmpty(currentMappings.merchantPassword__c)){
        	ApexPageUtil.addWarningMessage('Merchant Username and Passwords are required to create Litle MID.');
        } 
        return null;

    }

    public Pagereference cancelMappings() {
        PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
	    pageRef.setRedirect(true);
	    return pageRef;
    }


}