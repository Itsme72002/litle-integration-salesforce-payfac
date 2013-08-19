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
public class SubMerchantModelService {
	public MappingSobjectService mappingService;
	
	public SubMerchantModelService(String accountId, String opportunityId){
		mappingService = new MappingSobjectService(accountId, opportunityId);
	}
	
	public SubMerchantModel setSubMerchantModelFromMappingObject(SubMerchantModel subMerchantModel, SalesforceLitleMappingsObject__c savedMappings, String selectedOpportunityId){
		setsubMerchantAmexMid(subMerchantModel, savedMappings.subMerchantAmexMid__c,savedMappings.subMerchantAmexMidD__c,savedMappings.subMerchantAmexMidX__c,selectedOpportunityId);
		setsubMerchantBankAccountNumber(subMerchantModel, savedMappings.subMerchantBankAccountNumber__c,savedMappings.subMerchantBankAccountNumberD__c,savedMappings.subMerchantBankAccountNumberX__c,selectedOpportunityId);
		setsubMerchantBankRoutingNumber(subMerchantModel, savedMappings.subMerchantBankRoutingNumber__c,savedMappings.subMerchantBankRoutingNumberD__c,savedMappings.subMerchantBankRoutingNumberX__c,selectedOpportunityId);
		setsubMerchantCreateCredentials(subMerchantModel, savedMappings.subMerchantCreateCredentials__c,savedMappings.subMerchantCreateCredentialsD__c,savedMappings.subMerchantCreateCredentialsX__c,selectedOpportunityId);
		setsubMerchantCustomerServiceNumber(subMerchantModel, savedMappings.subMerchantCustomerServiceNumber__c,savedMappings.subMerchantCustomerServiceNumberD__c,savedMappings.subMerchantCustomerServiceNumberX__c,selectedOpportunityId);
		setsubMerchantDiscoverConveyMid(subMerchantModel, savedMappings.subMerchantDiscoverConveyMid__c,savedMappings.subMerchantDiscoverConveyMidD__c,savedMappings.subMerchantDiscoverConveyMidX__c,selectedOpportunityId);
		setsubMerchantHardCodeBillingDescriptor(subMerchantModel, savedMappings.subMerchantHardCodeBillingDescriptor__c,savedMappings.subMerchantHardCodeBillingDescD__c,savedMappings.subMerchantHardCodeBillingDescriptorX__c,selectedOpportunityId);
		setsubMerchantMaxTransactionAmount(subMerchantModel, savedMappings.subMerchantMaxTransactionAmount__c,savedMappings.subMerchantMaxTransactionAmountD__c,savedMappings.subMerchantMaxTransactionAmountX__c,selectedOpportunityId);
		setsubMerchantMerchantCategoryCode(subMerchantModel, savedMappings.subMerchantMerchantCategoryCode__c,savedMappings.subMerchantMerchantCategoryCodeD__c,savedMappings.subMerchantMerchantCategoryCodeX__c,selectedOpportunityId);
		setsubMerchantMerchantName(subMerchantModel, savedMappings.subMerchantMerchantName__c,savedMappings.subMerchantMerchantNameD__c,savedMappings.subMerchantMerchantNameX__c,selectedOpportunityId);
		setsubMerchantPspMerchantId(subMerchantModel, savedMappings.subMerchantPspMerchantId__c,savedMappings.subMerchantPspMerchantIdD__c,savedMappings.subMerchantPspMerchantIdX__c,selectedOpportunityId);
		setsubMerchantUrl(subMerchantModel, savedMappings.subMerchantUrl__c,savedMappings.subMerchantUrlD__c,savedMappings.subMerchantUrlX__c,selectedOpportunityId);
		setsubMerchanteCheckBillingDescriptor(subMerchantModel, savedMappings.subMerchanteCheckBillingDescriptor__c,savedMappings.subMerchanteCheckBillingDescD__c,savedMappings.subMerchanteCheckBillingDescriptorX__c,selectedOpportunityId);
		setsubMerchanteCheckCompanyName(subMerchantModel, savedMappings.subMerchanteCheckCompanyName__c,savedMappings.subMerchanteCheckCompanyNameD__c,savedMappings.subMerchanteCheckCompanyNameX__c,selectedOpportunityId);
				
		Address smAddress = subMerchantModel.getSubMerchantAddress();
		if(smAddress != null){
			setStreetAddress1(smAddress, savedMappings.subMerchantStreetAddress1__c,savedMappings.subMerchantStreetAddress1D__c,savedMappings.subMerchantStreetAddress1X__c,selectedOpportunityId);
			setStreetAddress2(smAddress, savedMappings.subMerchantStreetAddress2__c,savedMappings.subMerchantStreetAddress2D__c,savedMappings.subMerchantStreetAddress2X__c,selectedOpportunityId);
			setCity(smAddress, savedMappings.subMerchantCity__c,savedMappings.subMerchantCityD__c,savedMappings.subMerchantCityX__c,selectedOpportunityId);
			setStateProvince(smAddress, savedMappings.subMerchantStateProvince__c,savedMappings.subMerchantStateProvinceD__c,savedMappings.subMerchantStateProvinceX__c,selectedOpportunityId);
			setPostalCode(smAddress, savedMappings.subMerchantPostalCode__c,savedMappings.subMerchantPostalCodeD__c,savedMappings.subMerchantPostalCodeX__c,selectedOpportunityId);
			setCountryCode(smAddress, savedMappings.subMerchantCountryCode__c,savedMappings.subMerchantCountryCodeD__c,savedMappings.subMerchantCountryCodeX__c,selectedOpportunityId);
			subMerchantModel.setsubMerchantAddress(smAddress);
		}
		
		PrimaryContact smPrimaryContact = subMerchantModel.getSubMerchantPrimaryContact();
		if(smPrimaryContact != null){
			setPrimaryContactFirstName(smPrimaryContact, savedMappings.subMerchantFirstName__c,savedMappings.subMerchantFirstNameD__c,savedMappings.subMerchantFirstNameX__c,selectedOpportunityId);
			setPrimaryContactLastName(smPrimaryContact, savedMappings.subMerchantLastName__c,savedMappings.subMerchantLastNameD__c,savedMappings.subMerchantLastNameX__c,selectedOpportunityId);
			setPrimaryContactEmailAddress(smPrimaryContact, savedMappings.subMerchantEmailAddress__c,savedMappings.subMerchantEmailAddressD__c,savedMappings.subMerchantEmailAddressX__c,selectedOpportunityId);
			setPrimaryPhone(smPrimaryContact, savedMappings.subMerchantPhone__c,savedMappings.subMerchantPhoneD__c,savedMappings.subMerchantPhoneX__c,selectedOpportunityId);
			subMerchantModel.setSubMerchantPrimaryContact(smPrimaryContact);
		}		
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantModelFromMappingObjectOnOpportunityChange(SubMerchantModel subMerchantModel, SalesforceLitleMappingsObject__c savedMappings, String selectedOpportunityId){
		if(subMerchantModel.getIsSubMerchantAmexMidFromOpportunity()){
            setsubMerchantAmexMid(subMerchantModel, savedMappings.subMerchantAmexMid__c,savedMappings.subMerchantAmexMidD__c,savedMappings.subMerchantAmexMidX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantBankAccountNumberFromOpportunity()){
            setsubMerchantBankAccountNumber(subMerchantModel, savedMappings.subMerchantBankAccountNumber__c,savedMappings.subMerchantBankAccountNumberD__c,savedMappings.subMerchantBankAccountNumberX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantBankRoutingNumberFromOpportunity()){
            setsubMerchantBankRoutingNumber(subMerchantModel, savedMappings.subMerchantBankRoutingNumber__c,savedMappings.subMerchantBankRoutingNumberD__c,savedMappings.subMerchantBankRoutingNumberX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantCreateCredentialsFromOpportunity()){
            setsubMerchantCreateCredentials(subMerchantModel, savedMappings.subMerchantCreateCredentials__c,savedMappings.subMerchantCreateCredentialsD__c,savedMappings.subMerchantCreateCredentialsX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantCustomerServiceNumberFromOpportunity()){
            setsubMerchantCustomerServiceNumber(subMerchantModel, savedMappings.subMerchantCustomerServiceNumber__c,savedMappings.subMerchantCustomerServiceNumberD__c,savedMappings.subMerchantCustomerServiceNumberX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantDiscoverConveyMidFromOpportunity()){
            setsubMerchantDiscoverConveyMid(subMerchantModel, savedMappings.subMerchantDiscoverConveyMid__c,savedMappings.subMerchantDiscoverConveyMidD__c,savedMappings.subMerchantDiscoverConveyMidX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantHardCodeBillingDescriptorFromOpportunity()){
            setsubMerchantHardCodeBillingDescriptor(subMerchantModel, savedMappings.subMerchantHardCodeBillingDescriptor__c,savedMappings.subMerchantHardCodeBillingDescD__c,savedMappings.subMerchantHardCodeBillingDescriptorX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantMaxTransactionAmountFromOpportunity()){
            setsubMerchantMaxTransactionAmount(subMerchantModel, savedMappings.subMerchantMaxTransactionAmount__c,savedMappings.subMerchantMaxTransactionAmountD__c,savedMappings.subMerchantMaxTransactionAmountX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantMerchantCategoryCodeFromOpportunity()){
            setsubMerchantMerchantCategoryCode(subMerchantModel, savedMappings.subMerchantMerchantCategoryCode__c,savedMappings.subMerchantMerchantCategoryCodeD__c,savedMappings.subMerchantMerchantCategoryCodeX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantMerchantNameFromOpportunity()){
            setsubMerchantMerchantName(subMerchantModel, savedMappings.subMerchantMerchantName__c,savedMappings.subMerchantMerchantNameD__c,savedMappings.subMerchantMerchantNameX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantPspMerchantIdFromOpportunity()){
            setsubMerchantPspMerchantId(subMerchantModel, savedMappings.subMerchantPspMerchantId__c,savedMappings.subMerchantPspMerchantIdD__c,savedMappings.subMerchantPspMerchantIdX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchantUrlFromOpportunity()){
            setsubMerchantUrl(subMerchantModel, savedMappings.subMerchantUrl__c,savedMappings.subMerchantUrlD__c,savedMappings.subMerchantUrlX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchanteCheckBillingDescriptorFromOpportunity()){
            setsubMerchanteCheckBillingDescriptor(subMerchantModel, savedMappings.subMerchanteCheckBillingDescriptor__c,savedMappings.subMerchanteCheckBillingDescD__c,savedMappings.subMerchanteCheckBillingDescriptorX__c,selectedOpportunityId);
		}
		if(subMerchantModel.getIsSubMerchanteCheckCompanyNameFromOpportunity()){
            setsubMerchanteCheckCompanyName(subMerchantModel, savedMappings.subMerchanteCheckCompanyName__c,savedMappings.subMerchanteCheckCompanyNameD__c,savedMappings.subMerchanteCheckCompanyNameX__c,selectedOpportunityId);
		}
		
		Address smAddress = subMerchantModel.getSubMerchantAddress();
		if(smAddress != null){
			if(smAddress.getIsStreetAddress1FromOpportunity()){
				setStreetAddress1(smAddress, savedMappings.subMerchantStreetAddress1__c,savedMappings.subMerchantStreetAddress1D__c,savedMappings.subMerchantStreetAddress1X__c,selectedOpportunityId);
			}
			if(smAddress.getIsStreetAddress2FromOpportunity()){
				setStreetAddress2(smAddress, savedMappings.subMerchantStreetAddress2__c,savedMappings.subMerchantStreetAddress2D__c,savedMappings.subMerchantStreetAddress2X__c,selectedOpportunityId);
			}
			if(smAddress.getIsCityFromOpportunity()){
				setCity(smAddress, savedMappings.subMerchantCity__c,savedMappings.subMerchantCityD__c,savedMappings.subMerchantCityX__c,selectedOpportunityId);
			}
			if(smAddress.getIsStateProvinceFromOpportunity()){
				setStateProvince(smAddress, savedMappings.subMerchantStateProvince__c,savedMappings.subMerchantStateProvinceD__c,savedMappings.subMerchantStateProvinceX__c,selectedOpportunityId);
			}
			if(smAddress.getIsPostalCodeFromOpportunity()){
				setPostalCode(smAddress, savedMappings.subMerchantPostalCode__c,savedMappings.subMerchantPostalCodeD__c,savedMappings.subMerchantPostalCodeX__c,selectedOpportunityId);
			}
			if(smAddress.getIsCountryCodeFromOpportunity()){
				setCountryCode(smAddress, savedMappings.subMerchantCountryCode__c,savedMappings.subMerchantCountryCodeD__c,savedMappings.subMerchantCountryCodeX__c,selectedOpportunityId);
			}
			subMerchantModel.setsubMerchantAddress(smAddress);
		}
		
		PrimaryContact smPrimaryContact = subMerchantModel.getSubMerchantPrimaryContact();
		if(smPrimaryContact != null){
			if(smPrimaryContact.getIsFirstNameFromOpportunity()){
            	setPrimaryContactFirstName(smPrimaryContact, savedMappings.subMerchantFirstName__c,savedMappings.subMerchantFirstNameD__c,savedMappings.subMerchantFirstNameX__c,selectedOpportunityId);
			}
			if(smPrimaryContact.getIsLastNameFromOpportunity()){
				setPrimaryContactLastName(smPrimaryContact, savedMappings.subMerchantLastName__c,savedMappings.subMerchantLastNameD__c,savedMappings.subMerchantLastNameX__c,selectedOpportunityId);
			}
			if(smPrimaryContact.getIsEmailAddressFromOpportunity()){
				setPrimaryContactEmailAddress(smPrimaryContact, savedMappings.subMerchantEmailAddress__c,savedMappings.subMerchantEmailAddressD__c,savedMappings.subMerchantEmailAddressX__c,selectedOpportunityId);
			}
			if(smPrimaryContact.getIsPhoneFromOpportunity()){
				setPrimaryPhone(smPrimaryContact, savedMappings.subMerchantPhone__c,savedMappings.subMerchantPhoneD__c,savedMappings.subMerchantPhoneX__c,selectedOpportunityId);
			}
			subMerchantModel.setSubMerchantPrimaryContact(smPrimaryContact);
		}
		return subMerchantModel;
	}	
    
    public SubMerchantModel setSubMerchantAmexMid(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantAmexMid(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantAmexMidFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantBankAccountNumber(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantBankAccountNumber(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantBankAccountNumberFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantBankRoutingNumber(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantBankRoutingNumber(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantBankRoutingNumberFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantCreateCredentials(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantCreateCredentials(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantCreateCredentialsFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantCustomerServiceNumber(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantCustomerServiceNumber(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantCustomerServiceNumberFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantDiscoverConveyMid(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantDiscoverConveyMid(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantDiscoverConveyMidFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantHardCodeBillingDescriptor(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantHardCodeBillingDescriptor(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantHardCodeBillingDescriptorFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantMaxTransactionAmount(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantMaxTransactionAmount(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantMaxTransactionAmountFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantMerchantCategoryCode(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantMerchantCategoryCode(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantMerchantCategoryCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantMerchantName(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantMerchantName(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantMerchantNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantPspMerchantId(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantPspMerchantId(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantPspMerchantIdFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchantUrl(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchantUrl(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchantUrlFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchanteCheckBillingDescriptor(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchanteCheckBillingDescriptor(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchanteCheckBillingDescriptorFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
	
	public SubMerchantModel setSubMerchanteCheckCompanyName(SubMerchantModel subMerchantModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	subMerchantModel.setsubMerchanteCheckCompanyName(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		subMerchantModel.setIsSubMerchanteCheckCompanyNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return subMerchantModel;
	}
    
    public PrimaryContact setPrimaryContactFirstName(PrimaryContact primaryContact, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	primaryContact.setFirstName(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		primaryContact.setIsFirstNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return primaryContact;
	}
	
	public PrimaryContact setPrimaryContactLastName(PrimaryContact primaryContact, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	primaryContact.setLastName(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		primaryContact.setIsLastNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return primaryContact;
	}
	
	public PrimaryContact setPrimaryContactEmailAddress(PrimaryContact primaryContact, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	primaryContact.setEmailAddress(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		primaryContact.setIsEmailAddressFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return primaryContact;
	}
	
	public PrimaryContact setPrimaryPhone(PrimaryContact primaryContact, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	primaryContact.setPhone(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		primaryContact.setIsPhoneFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return primaryContact;
	}
	
	    
    public Address setStreetAddress1(Address address, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
        address.setStreetAddress1(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		address.setIsStreetAddress1FromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return address;
	}
    
    public Address setStreetAddress2(Address address, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	address.setStreetAddress2(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		address.setIsStreetAddress2FromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return address;
	}
    
    public Address setCity(Address address, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	address.setCity(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		address.setIsCityFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return address;
	}
	
    public Address setStateProvince(Address address, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	address.setStateProvince(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		address.setIsStateProvinceFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return address;
	}
	
    public Address setCountryCode(Address address, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	address.setCountryCode(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		address.setIsCountryCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return address;
	}
	
    public Address setPostalCode(Address address, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	address.setPostalCode(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		address.setIsPostalCodeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return address;
	}
	
	public Boolean areRequiredFieldsPresent(SubMerchantModel subMerchantModel, Boolean showErrorMessageOnPage){
		 Boolean isAllRequiredFieldsPresent = true;
        
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getCountryCode())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Country Code is Required');
            }
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantBankAccountNumber())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Bank Account Number is Required');
            }
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantBankRoutingNumber())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Bank Routing Number is Required');
            }
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantCustomerServiceNumber())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Customer Service Number is Required');
            }
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantHardCodeBillingDescriptor())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Default Billing Descriptor is Required');
            }
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantMaxTransactionAmount())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Max Transaction Amount is Required');
            }
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantMerchantCategoryCode())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Merchant Category Code is Required');
            }
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantMerchantName())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Merchant Name is Required');
            }
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantPspMerchantId())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('PayFac Sub-Merchant ID is Required');
            }
        }
        
        // new required fields as per the api
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getStreetAddress1())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Street Address 1 is Required');
            }    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getCity())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s City is Required');
            }    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getPostalCode())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Postal Code is Required');
            }    
        }
        if(String.isEmpty(subMerchantModel.getSubMerchantAddress().getStateProvince())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s State/Province is Required');
            }    
        }
        
        if(String.isEmpty(subMerchantModel.getSubMerchantPrimaryContact().getFirstName())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Primary Contact\'s First Name is Required');
            }    
        }
        
        if(String.isEmpty(subMerchantModel.getSubMerchantPrimaryContact().getLastName())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Primary Contact\'s Last Name is Required');
            }    
        }
        
        if(String.isEmpty(subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Primary Contact\'s Email Address is Required');
            }    
        }
        
        if(String.isEmpty(subMerchantModel.getSubMerchantPrimaryContact().getPhone())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Primary Contact\'s Phone is Required');
            }    
        }        
        return isAllRequiredFieldsPresent;  
	}
	
	public Boolean isSubMerchantModelValid(SubMerchantModel subMerchantModel, Boolean showErrorMessageOnPage){
		Boolean isInputValid = true;
        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getStreetAddress1())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getStreetAddress1(), 60)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Street Address 1 cannot exceed 60 characters');
                }
            }
        }
        
        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getStreetAddress2())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getStreetAddress2(), 60)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Street Address 2 cannot exceed 60 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getCity())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getCity(), 20)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s City cannot exceed 20 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getStateProvince())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getStateProvince(), 2)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s State/Province cannot exceed 2 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getPostalCode())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getPostalCode(), 5)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Postal Code cannot exceed 5 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAddress().getCountryCode())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAddress().getCountryCode(), 3)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Country Code cannot exceed 3 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantAmexMid())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantAmexMid(), 15)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s Amex Merchant ID cannot exceed 15 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantBankAccountNumber())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantBankAccountNumber(), 50)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Bank Account Number cannot exceed 50 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantBankRoutingNumber())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantBankRoutingNumber(), 50)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Bank Routing Number cannot exceed 50 characters');
                }
            }
        }
        
        if(String.isNotEmpty(subMerchantModel.getSubMerchantCreateCredentials())){
            if(!ValidationUtil.validateBoolean(subMerchantModel.getSubMerchantCreateCredentials())){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Create Connectivity Credentials should be either true or false');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantCustomerServiceNumber())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantCustomerServiceNumber(), 13)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Customer Service Number cannot exceed 13 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantDiscoverConveyMid())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantDiscoverConveyMid(), 15)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Discover Merchant ID cannot exceed 15 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantHardCodeBillingDescriptor())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantHardCodeBillingDescriptor(), 25)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Default Billing Descriptor cannot exceed 25 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantMaxTransactionAmount())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMaxTransactionAmount(), 19)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Max Transaction Amount cannot exceed 19 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantMerchantCategoryCode())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMerchantCategoryCode(), 4)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Merchant Category Code cannot exceed 4 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantMerchantName())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantMerchantName(), 50)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Merchant Name cannot exceed 50 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getFirstName())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getFirstName(), 20)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Primary Contact\'s First Name cannot exceed 20 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getLastName())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getLastName(), 20)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Primary Contact\'s Last Name cannot exceed 20 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress(), 100)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Primary Contact\'s Email Address cannot exceed 100 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPrimaryContact().getPhone())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPrimaryContact().getPhone(), 13)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Primary Contact\'s Phone cannot exceed 13 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantPspMerchantId())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantPspMerchantId(), 32)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('PayFac Sub-Merchant ID cannot exceed 32 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchantUrl())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchantUrl(), 120)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s URL cannot exceed 120 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchanteCheckBillingDescriptor())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckBillingDescriptor(), 10)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s eCheck Billing Descriptor cannot exceed 10 characters');
                }
            }
        }

        if(String.isNotEmpty(subMerchantModel.getSubMerchanteCheckCompanyName())){
            if(!ValidationUtil.validateString(subMerchantModel.getSubMerchanteCheckCompanyName(), 16)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Payment Processing Configuration\'s eCheck Company Name cannot exceed 16 characters');
                }
            }
        }        
        return isInputValid;
	}
}