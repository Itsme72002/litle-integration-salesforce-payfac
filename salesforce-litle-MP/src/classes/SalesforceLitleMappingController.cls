public class SalesforceLitleMappingController {
    private List < Selectoption > salesforceFields;
    private final String emptyString = '';
    public Boolean savingStatus {get; set;}
    public Boolean errorStatus {get; set;}
    //Holds the current mappings from the page
    public SalesforceLitleMappingsObject__c currentMappings {get; set;}

    public SalesforceLitleMappingController() {
        List < SalesforceLitleMappingsObject__c > mappingRecords = [select id, name, subMerchantStreetAddress1__c, subMerchantStreetAddress2__c, subMerchantCity__c, subMerchantStateProvince__c, subMerchantPostalCode__c, subMerchantCountryCode__c, subMerchantAmexMid__c, subMerchantBankAccountNumber__c, subMerchantBankRoutingNumber__c, subMerchantCreateCredentials__c, subMerchantCustomerServiceNumber__c, subMerchantDiscoverConveyMid__c, subMerchantHardCodeBillingDescriptor__c, subMerchantMaxTransactionAmount__c, subMerchantMerchantCategoryCode__c, subMerchantMerchantName__c, subMerchantFirstName__c, subMerchantLastName__c, subMerchantEmailAddress__c, subMerchantPhone__c, subMerchantPspMerchantId__c, subMerchantUrl__c, subMerchanteCheckBillingDescriptor__c, subMerchanteCheckCompanyName__c, subMerchantStreetAddress1D__c, subMerchantStreetAddress2D__c, subMerchantCityD__c, subMerchantStateProvinceD__c, subMerchantPostalCodeD__c, subMerchantCountryCodeD__c, subMerchantAmexMidD__c, subMerchantBankAccountNumberD__c, subMerchantBankRoutingNumberD__c, subMerchantCreateCredentialsD__c, subMerchantCustomerServiceNumberD__c, subMerchantDiscoverConveyMidD__c, subMerchantHardCodeBillingDescD__c, subMerchantMaxTransactionAmountD__c, subMerchantMerchantCategoryCodeD__c, subMerchantMerchantNameD__c, subMerchantFirstNameD__c, subMerchantLastNameD__c, subMerchantEmailAddressD__c, subMerchantPhoneD__c, subMerchantPspMerchantIdD__c, subMerchantUrlD__c, subMerchanteCheckBillingDescD__c, subMerchanteCheckCompanyNameD__c, subMerchantStreetAddress1X__c, subMerchantStreetAddress2X__c, subMerchantCityX__c, subMerchantStateProvinceX__c, subMerchantPostalCodeX__c, subMerchantCountryCodeX__c, subMerchantAmexMidX__c, subMerchantBankAccountNumberX__c, subMerchantBankRoutingNumberX__c, subMerchantCreateCredentialsX__c, subMerchantCustomerServiceNumberX__c, subMerchantDiscoverConveyMidX__c, subMerchantHardCodeBillingDescriptorX__c, subMerchantMaxTransactionAmountX__c, subMerchantMerchantCategoryCodeX__c, subMerchantMerchantNameX__c, subMerchantFirstNameX__c, subMerchantLastNameX__c, subMerchantEmailAddressX__c, subMerchantPhoneX__c, subMerchantPspMerchantIdX__c, subMerchantUrlX__c, subMerchanteCheckBillingDescriptorX__c, subMerchanteCheckCompanyNameX__c, legalEntityName__c, legalEntityType__c, legalEntityStreetAddress1__c, legalEntityStreetAddress2__c, legalEntityCity__c, legalEntityStateProvince__c, legalEntityPostalCode__c, legalEntityCountryCode__c, legalEntityFirstName__c, legalEntityLastName__c, legalEntityEmailAddress__c, legalEntityContactPhone__c, legalEntityDateOfBirth__c, legalEntityDriversLicense__c, legalEntityDriversLicenseState__c, legalEntitySsn__c, legalEntityTaxId__c, legalEntityIsExclusiveToPsp__c, legalEntityIsPciComplianceValidated__c, legalEntityPciLevel__c, legalEntityScanningVendor__c, legalEntityQualifiedSecurityAssessor__c, legalEntityMostRecentlyPassedScan__c, legalEntityReportOnCompliance__c, legalEntityAnnualCreditCardSalesVolume__c, legalEntityHasAcceptedCreditCards__c, legalEntityNameD__c, legalEntityTypeD__c, legalEntityStreetAddress1D__c, legalEntityStreetAddress2D__c, legalEntityCityD__c, legalEntityStateProvinceD__c, legalEntityPostalCodeD__c, legalEntityCountryCodeD__c, legalEntityFirstNameD__c, legalEntityLastNameD__c, legalEntityEmailAddressD__c, legalEntityContactPhoneD__c, legalEntityDateOfBirthD__c, legalEntityDriversLicenseD__c, legalEntityDriversLicenseStateD__c, legalEntitySsnD__c, legalEntityTaxIdD__c, legalEntityIsExclusiveToPspD__c, legalEntityIsPciComplianceValidatedD__c, legalEntityPciLevelD__c, legalEntityScanningVendorD__c, legalEntityQualifiedSecurityAssessorD__c, legalEntityMostRecentlyPassedScanD__c, legalEntityReportOnComplianceD__c, legalEntityAnnualCreditCardSalesVolumeD__c, legalEntityHasAcceptedCreditCardsD__c, legalEntityNameX__c, legalEntityTypeX__c, legalEntityStreetAddress1X__c, legalEntityStreetAddress2X__c, legalEntityCityX__c, legalEntityStateProvinceX__c, legalEntityPostalCodeX__c, legalEntityCountryCodeX__c, legalEntityFirstNameX__c, legalEntityLastNameX__c, legalEntityEmailAddressX__c, legalEntityContactPhoneX__c, legalEntityDateOfBirthX__c, legalEntityDriversLicenseX__c, legalEntityDriversLicenseStateX__c, legalEntitySsnX__c, legalEntityTaxIdX__c, legalEntityIsExclusiveToPspX__c, legalEntityIsPciComplianceValidatedX__c, legalEntityPciLevelX__c, legalEntityScanningVendorX__c, legalEntityQualifiedSecurityAssessorX__c, legalEntityMostRecentlyPassedScanX__c, legalEntityReportOnComplianceX__c, legalEntityAnnualCreditCardSalesVolumeX__c, legalEntityHasAcceptedCreditCardsX__c, legalEntityDoingBusinessAs__c, legalEntityDoingBusinessAsX__c, legalEntityDoingBusinessAsD__c from SalesforceLitleMappingsObject__c limit 1];
        if (mappingRecords.isEmpty()) {
            this.currentMappings = new SalesforceLitleMappingsObject__c();
        } else {
            this.currentMappings = mappingRecords.get(0);
        }
        savingStatus = false;
        errorStatus = false;
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
        SObjectType objToken = Schema.getGlobalDescribe().get('Account');
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map < String, SObjectField > fields = objDef.fields.getMap();
        List < Selectoption > accountFields = new List < Selectoption > ();
        Set < String > fieldSet = fields.keySet();
        accountFields.add(new Selectoption('', '-- Select Option --'));
        for (String s: fieldSet) {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            accountFields.add(new Selectoption('Account.' + selectedField.getName(), 'Account.' + selectedField.getName()));

        }
        return accountFields;
    }

    public void resetStatus() {
        savingStatus = false;
        errorStatus = false;
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

    public PageReference onSelectChangeLegalEntityFirstName() {
        if (currentMappings.legalEntityFirstName__c == null) {
            currentMappings.legalEntityFirstNameX__c = false;
        } else {
            currentMappings.legalEntityFirstNameX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityLastName() {
        if (currentMappings.legalEntityLastName__c == null) {
            currentMappings.legalEntityLastNameX__c = false;
        } else {
            currentMappings.legalEntityLastNameX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityEmailAddress() {
        if (currentMappings.legalEntityEmailAddress__c == null) {
            currentMappings.legalEntityEmailAddressX__c = false;
        } else {
            currentMappings.legalEntityEmailAddressX__c = true;
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

    public PageReference onSelectChangeLegalEntityDateOfBirth() {
        if (currentMappings.legalEntityDateOfBirth__c == null) {
            currentMappings.legalEntityDateOfBirthX__c = false;
        } else {
            currentMappings.legalEntityDateOfBirthX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityDriversLicense() {
        if (currentMappings.legalEntityDriversLicense__c == null) {
            currentMappings.legalEntityDriversLicenseX__c = false;
        } else {
            currentMappings.legalEntityDriversLicenseX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityDriversLicenseState() {
        if (currentMappings.legalEntityDriversLicenseState__c == null) {
            currentMappings.legalEntityDriversLicenseStateX__c = false;
        } else {
            currentMappings.legalEntityDriversLicenseStateX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntitySsn() {
        if (currentMappings.legalEntitySsn__c == null) {
            currentMappings.legalEntitySsnX__c = false;
        } else {
            currentMappings.legalEntitySsnX__c = true;
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

    public PageReference onSelectChangeLegalEntityIsExclusiveToPsp() {
        if (currentMappings.legalEntityIsExclusiveToPsp__c == null) {
            currentMappings.legalEntityIsExclusiveToPspX__c = false;
        } else {
            currentMappings.legalEntityIsExclusiveToPspX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityIsPciComplianceValidated() {
        if (currentMappings.legalEntityIsPciComplianceValidated__c == null) {
            currentMappings.legalEntityIsPciComplianceValidatedX__c = false;
        } else {
            currentMappings.legalEntityIsPciComplianceValidatedX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityPciLevel() {
        if (currentMappings.legalEntityPciLevel__c == null) {
            currentMappings.legalEntityPciLevelX__c = false;
        } else {
            currentMappings.legalEntityPciLevelX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityScanningVendor() {
        if (currentMappings.legalEntityScanningVendor__c == null) {
            currentMappings.legalEntityScanningVendorX__c = false;
        } else {
            currentMappings.legalEntityScanningVendorX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityQualifiedSecurityAssessor() {
        if (currentMappings.legalEntityQualifiedSecurityAssessor__c == null) {
            currentMappings.legalEntityQualifiedSecurityAssessorX__c = false;
        } else {
            currentMappings.legalEntityQualifiedSecurityAssessorX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityMostRecentlyPassedScan() {
        if (currentMappings.legalEntityMostRecentlyPassedScan__c == null) {
            currentMappings.legalEntityMostRecentlyPassedScanX__c = false;
        } else {
            currentMappings.legalEntityMostRecentlyPassedScanX__c = true;
        }
        return null;
    }

    public PageReference onSelectChangeLegalEntityReportOnCompliance() {
        if (currentMappings.legalEntityReportOnCompliance__c == null) {
            currentMappings.legalEntityReportOnComplianceX__c = false;
        } else {
            currentMappings.legalEntityReportOnComplianceX__c = true;
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

        if (currentMappings.legalEntityTypeX__c) {
            currentMappings.legalEntityTypeD__c = emptyString;
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

        if (currentMappings.legalEntityFirstNameX__c) {
            currentMappings.legalEntityFirstNameD__c = emptyString;
        }

        if (currentMappings.legalEntityLastNameX__c) {
            currentMappings.legalEntityLastNameD__c = emptyString;
        }

        if (currentMappings.legalEntityEmailAddressX__c) {
            currentMappings.legalEntityEmailAddressD__c = emptyString;
        }

        if (currentMappings.legalEntityContactPhoneX__c) {
            currentMappings.legalEntityContactPhoneD__c = emptyString;
        }

        if (currentMappings.legalEntityDateOfBirthX__c) {
            currentMappings.legalEntityDateOfBirthD__c = emptyString;
        }

        if (currentMappings.legalEntityDriversLicenseX__c) {
            currentMappings.legalEntityDriversLicenseD__c = emptyString;
        }

        if (currentMappings.legalEntityDriversLicenseStateX__c) {
            currentMappings.legalEntityDriversLicenseStateD__c = emptyString;
        }

        if (currentMappings.legalEntitySsnX__c) {
            currentMappings.legalEntitySsnD__c = emptyString;
        }

        if (currentMappings.legalEntityTaxIdX__c) {
            currentMappings.legalEntityTaxIdD__c = emptyString;
        }

        if (currentMappings.legalEntityIsExclusiveToPspX__c) {
            currentMappings.legalEntityIsExclusiveToPspD__c = emptyString;
        }

        if (currentMappings.legalEntityIsPciComplianceValidatedX__c) {
            currentMappings.legalEntityIsPciComplianceValidatedD__c = emptyString;
        }

        if (currentMappings.legalEntityPciLevelX__c) {
            currentMappings.legalEntityPciLevelD__c = emptyString;
        }

        if (currentMappings.legalEntityScanningVendorX__c) {
            currentMappings.legalEntityScanningVendorD__c = emptyString;
        }

        if (currentMappings.legalEntityQualifiedSecurityAssessorX__c) {
            currentMappings.legalEntityQualifiedSecurityAssessorD__c = emptyString;
        }

        if (currentMappings.legalEntityMostRecentlyPassedScanX__c) {
            currentMappings.legalEntityMostRecentlyPassedScanD__c = emptyString;
        }

        if (currentMappings.legalEntityReportOnComplianceX__c) {
            currentMappings.legalEntityReportOnComplianceD__c = emptyString;
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
        System.debug('In Save Method');
        try {
            upsert currentMappings;
            String aId = apexpages.currentpage().getParameters().get('id');
            if (aId != null && !aid.equals('')) {
                return new PageReference('/' + aId);
            }
            savingStatus = true;
        } catch (DmlException e) {
            errorStatus = true;
        }
        return null;

    }

    public Pagereference cancelMappings() {
        resetStatus();
        String aId = apexpages.currentpage().getParameters().get('id');
        if (aId != null && !aid.equals('')) {
            return new PageReference('/' + aId);
        }
        return null;
    }

    /*public Pagereference resetMappings(){
	 	resetStatus();
	 	currentMappings = new SalesforceLitleMappingsObject__c();
	 	return null;
	}*/


}