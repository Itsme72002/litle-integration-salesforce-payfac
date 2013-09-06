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
public class SalesforceLitleMappingController {
    
    private final String emptyString = '';
    //Holds the current mappings from the page
    public SalesforceLitleMappingsObject__c currentMappings {get; set;}
    public List<SelectOption> legalEntityTypeList{get; set;}
    public List<SelectOption> litleEnvironmentList{get; set;}
    public HelpTextConstants helpTextConstant{get; set;}
    private SalesForceSelectOptionsService salesforceSelectOptionService;
    public List < Selectoption > salesforceFields{get; set;}
    public List < Selectoption > salesforceBooleanFields{get; set;}
    public List < Selectoption > booleanOptions{get; set;}
    
    public SalesforceLitleMappingController() {
    	helpTextConstant = new HelpTextConstants();
    	salesforceSelectOptionService = new SalesForceSelectOptionsService();
    	legalEntityTypeList = new List<SelectOption>();
    	salesforceFields = salesforceSelectOptionService.fetchAllSalesforceFields();
    	salesforceBooleanFields = salesforceSelectOptionService.fetchAllSalesforceBooleanFields();
    	booleanOptions = salesforceSelectOptionService.fetchAllBooleanOption();
        for (LegalEntityType.LegalEntityTypeEnum s: LegalEntityType.LegalEntityTypeEnum.values()){
        	legalEntityTypeList.add(new SelectOption(s.name(), LegalEntityType.stringValue(s.name())));
        }
        litleEnvironmentList = new List<SelectOption>();
        litleEnvironmentList.add(new SelectOption(LitleEnvironment.LitleEnvironmentEnum.PRODUCTION.name(), LitleEnvironment.stringValue(LitleEnvironment.LitleEnvironmentEnum.PRODUCTION.name())));
        litleEnvironmentList.add(new SelectOption(LitleEnvironment.LitleEnvironmentEnum.CERT.name(), LitleEnvironment.stringValue(LitleEnvironment.LitleEnvironmentEnum.CERT.name())));
        /* uncomment when all the environment are ready
        
        for (LitleEnvironment.LitleEnvironmentEnum s: LitleEnvironment.LitleEnvironmentEnum.values()){
        	litleEnvironmentList.add(new SelectOption(s.name(), LitleEnvironment.stringValue(s.name())));
        }
        */
        currentMappings = MappingObjectUtil.getCurrentMappings();
        if(currentMappings == null){
        	currentMappings = new SalesforceLitleMappingsObject__c();
        }
    }

    
    //Legal Entity on change listeners	 
    public Pagereference onSelectChangeLegalEntityName() {
        currentMappings.legalEntityNameX__c = String.isNotEmpty(currentMappings.legalEntityName__c);
        return null;
    }

    public Pagereference onSelectChangeLegalEntityDoingBusinessAs() {
        currentMappings.legalEntityDoingBusinessAsX__c = String.isNotEmpty(currentMappings.legalEntityDoingBusinessAs__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityStreetAddress1() {
        currentMappings.legalEntityStreetAddress1X__c = String.isNotEmpty(currentMappings.legalEntityStreetAddress1__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityStreetAddress2() {
        currentMappings.legalEntityStreetAddress2X__c = String.isNotEmpty(currentMappings.legalEntityStreetAddress2__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityCity() {
        currentMappings.legalEntityCityX__c = String.isNotEmpty(currentMappings.legalEntityCity__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityStateProvince() {
        currentMappings.legalEntityStateProvinceX__c = String.isNotEmpty(currentMappings.legalEntityStateProvince__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPostalCode() {
        currentMappings.legalEntityPostalCodeX__c = String.isNotEmpty(currentMappings.legalEntityPostalCode__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityCountryCode() {
        currentMappings.legalEntityCountryCodeX__c = String.isNotEmpty(currentMappings.legalEntityCountryCode__c);
        return null;
    }
    
    public PageReference onSelectChangeLegalEntityPrincipalStreetAddress1() {
        currentMappings.LegalEntityPrincipalStreetAddress1X__c = String.isNotEmpty(currentMappings.LegalEntityPrincipalStreetAddress1__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalStreetAddress2() {
        currentMappings.LegalEntityPrincipalStreetAddress2X__c = String.isNotEmpty(currentMappings.LegalEntityPrincipalStreetAddress2__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalCity() {
        currentMappings.LegalEntityPrincipalCityX__c = String.isNotEmpty(currentMappings.LegalEntityPrincipalCity__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalStateProvince() {
        currentMappings.LegalEntityPrincipalStateProvinceX__c = String.isNotEmpty(currentMappings.LegalEntityPrincipalStateProvince__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalPostalCode() {
        currentMappings.LegalEntityPrincipalPostalCodeX__c = String.isNotEmpty(currentMappings.LegalEntityPrincipalPostalCode__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalCountryCode() {
        currentMappings.LegalEntityPrincipalCountryCodeX__c = String.isNotEmpty(currentMappings.LegalEntityPrincipalCountryCode__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalFirstName() {
        currentMappings.legalEntityPrincipalFirstNameX__c = String.isNotEmpty(currentMappings.legalEntityPrincipalFirstName__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalLastName() {
        currentMappings.LegalEntityPrincipalLastNameX__c = String.isNotEmpty(currentMappings.LegalEntityPrincipalLastName__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalEmailAddress() {
        currentMappings.legalEntityPrincipalEmailAddressX__c = String.isNotEmpty(currentMappings.legalEntityPrincipalEmailAddress__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityContactPhone() {
        currentMappings.legalEntityContactPhoneX__c = String.isNotEmpty(currentMappings.legalEntityContactPhone__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalDateOfBirth() {
        currentMappings.legalEntityPrincipalDateOfBirthX__c = String.isNotEmpty(currentMappings.legalEntityPrincipalDateOfBirth__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalDriversLicense() {
        currentMappings.legalEntityPrincipalDriversLicenseX__c = String.isNotEmpty(currentMappings.legalEntityPrincipalDriversLicense__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalDriversLicenseState() {
        currentMappings.legalEntityPrincipalDriversLicenseStateX__c = String.isNotEmpty(currentMappings.legalEntityPrincipalDriversLicenseState__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityPrincipalSsn() {
        currentMappings.legalEntityPrincipalSsnX__c = String.isNotEmpty(currentMappings.legalEntityPrincipalSsn__c);
        return null;
    }
    
    public PageReference onSelectChangeLegalEntityPrincipalContactPhone() {
        currentMappings.legalEntityPrincipalContactPhoneX__c = String.isNotEmpty(currentMappings.legalEntityPrincipalContactPhone__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityTaxId() {
        currentMappings.legalEntityTaxIdX__c = String.isNotEmpty(currentMappings.legalEntityTaxId__c);
        return null;
    }
	
	
    public PageReference onSelectChangeLegalEntityAnnualCreditCardSalesVolume() {
        currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c = String.isNotEmpty(currentMappings.legalEntityAnnualCreditCardSalesVolume__c);
        return null;
    }

    public PageReference onSelectChangeLegalEntityHasAcceptedCreditCards() {
        currentMappings.legalEntityHasAcceptedCreditCardsX__c = String.isNotEmpty(currentMappings.legalEntityHasAcceptedCreditCards__c);
        return null;
    }


    //Sub merchant on change listeners
    public PageReference onSelectChangeSubMerchantStreetAddress1() {
        currentMappings.subMerchantStreetAddress1X__c = String.isNotEmpty(currentMappings.subMerchantStreetAddress1__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantStreetAddress2() {
        currentMappings.subMerchantStreetAddress2X__c = String.isNotEmpty(currentMappings.subMerchantStreetAddress2__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantCity() {
        currentMappings.subMerchantCityX__c = String.isNotEmpty(currentMappings.subMerchantCity__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantStateProvince() {
        currentMappings.subMerchantStateProvinceX__c = String.isNotEmpty(currentMappings.subMerchantStateProvince__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantPostalCode() {
        currentMappings.subMerchantPostalCodeX__c = String.isNotEmpty(currentMappings.subMerchantPostalCode__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantCountryCode() {
        currentMappings.subMerchantCountryCodeX__c = String.isNotEmpty(currentMappings.subMerchantCountryCode__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantAmexMid() {
        currentMappings.subMerchantAmexMidX__c = String.isNotEmpty(currentMappings.subMerchantAmexMid__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantBankAccountNumber() {
        currentMappings.subMerchantBankAccountNumberX__c = String.isNotEmpty(currentMappings.subMerchantBankAccountNumber__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantBankRoutingNumber() {
        currentMappings.subMerchantBankRoutingNumberX__c = String.isNotEmpty(currentMappings.subMerchantBankRoutingNumber__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantCreateCredentials() {
        currentMappings.subMerchantCreateCredentialsX__c = String.isNotEmpty(currentMappings.subMerchantCreateCredentials__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantCustomerServiceNumber() {
        currentMappings.subMerchantCustomerServiceNumberX__c = String.isNotEmpty(currentMappings.subMerchantCustomerServiceNumber__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantDiscoverConveyMid() {
        currentMappings.subMerchantDiscoverConveyMidX__c = String.isNotEmpty(currentMappings.subMerchantDiscoverConveyMid__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantHardCodeBillingDescriptor() {
        currentMappings.subMerchantHardCodeBillingDescriptorX__c = String.isNotEmpty(currentMappings.subMerchantHardCodeBillingDescriptor__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantMaxTransactionAmount() {
        currentMappings.subMerchantMaxTransactionAmountX__c = String.isNotEmpty(currentMappings.subMerchantMaxTransactionAmount__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantMerchantCategoryCode() {
        currentMappings.subMerchantMerchantCategoryCodeX__c = String.isNotEmpty(currentMappings.subMerchantMerchantCategoryCode__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantMerchantName() {
        currentMappings.subMerchantMerchantNameX__c = String.isNotEmpty(currentMappings.subMerchantMerchantName__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantFirstName() {
        currentMappings.subMerchantFirstNameX__c = String.isNotEmpty(currentMappings.subMerchantFirstName__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantLastName() {
        currentMappings.subMerchantLastNameX__c = String.isNotEmpty(currentMappings.subMerchantLastName__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantEmailAddress() {
        currentMappings.subMerchantEmailAddressX__c = String.isNotEmpty(currentMappings.subMerchantEmailAddress__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantPhone() {
        currentMappings.subMerchantPhoneX__c = String.isNotEmpty(currentMappings.subMerchantPhone__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantPspMerchantId() {
        currentMappings.subMerchantPspMerchantIdX__c = String.isNotEmpty(currentMappings.subMerchantPspMerchantId__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchantUrl() {
        currentMappings.subMerchantUrlX__c = String.isNotEmpty(currentMappings.subMerchantUrl__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchanteCheckBillingDescriptor() {
        currentMappings.subMerchanteCheckBillingDescriptorX__c = String.isNotEmpty(currentMappings.subMerchanteCheckBillingDescriptor__c);
        return null;
    }

    public PageReference onSelectChangeSubMerchanteCheckCompanyName() {
        currentMappings.subMerchanteCheckCompanyNameX__c = String.isNotEmpty(currentMappings.subMerchanteCheckCompanyName__c);
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
            LitleMappingsSaveLog__c log = new LitleMappingsSaveLog__c();
            LoggingUtil.logSaveLitleMappings(currentMappings, log);
            
            try{
            	insert log;
            }
            catch(Exception e){
            	System.debug('Error in logging mappings save');
            	for(Integer i = 0; i < e.getNumDml(); i++){
            		System.debug(e.getDmlMessage(i));
            	}
            }
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