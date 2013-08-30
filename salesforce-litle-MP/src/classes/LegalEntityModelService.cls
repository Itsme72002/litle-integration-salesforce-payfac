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
public class LegalEntityModelService {
	public MappingSobjectService mappingService;
	
	public LegalEntityModelService(String accountId, String opportunityId){
		mappingService = new MappingSobjectService(accountId, opportunityId);
	}
	
	public LegalEntityModel setLegalEntityModelFromMappingObject(LegalEntityModel legalEntityModel, SalesforceLitleMappingsObject__c savedMappings, String selectedOpportunityId){
		setLegalEntityName(legalEntityModel, savedMappings.legalEntityName__c, savedMappings.legalEntityNameD__c, savedMappings.legalEntityNameX__c, selectedOpportunityId);
		legalEntityModel.setLegalEntityType(savedMappings.legalEntityTypeD__c);
		setLegalEntityDoingBusinessAs(legalEntityModel, savedMappings.legalEntityDoingBusinessAs__c,savedMappings.legalEntityDoingBusinessAsD__c,savedMappings.legalEntityDoingBusinessAsX__c,selectedOpportunityId);
		setLegalEntityTaxId(legalEntityModel, savedMappings.legalEntityTaxId__c,savedMappings.legalEntityTaxIdD__c,savedMappings.legalEntityTaxIdX__c,selectedOpportunityId);
		setLegalEntityAnnualCreditCardSalesVolume(legalEntityModel, savedMappings.legalEntityAnnualCreditCardSalesVolume__c,savedMappings.legalEntityAnnualCreditCardSalesVolumeD__c,savedMappings.legalEntityAnnualCreditCardSalesVolumeX__c,selectedOpportunityId);
		setLegalEntityHasAcceptedCreditCards(legalEntityModel, savedMappings.legalEntityHasAcceptedCreditCards__c,savedMappings.legalEntityHasAcceptedCreditCardsD__c,savedMappings.legalEntityHasAcceptedCreditCardsX__c,selectedOpportunityId);
		setLegalEntityContactPhone(legalEntityModel, savedMappings.legalEntityContactPhone__c,savedMappings.legalEntityContactPhoneD__c,savedMappings.legalEntityContactPhoneX__c,selectedOpportunityId);
		
		Address leAddress = legalEntityModel.getLegalEntityAddress();
		if(leAddress != null){
			setStreetAddress1(leAddress, savedMappings.legalEntityStreetAddress1__c,savedMappings.legalEntityStreetAddress1D__c,savedMappings.legalEntityStreetAddress1X__c,selectedOpportunityId);
			setStreetAddress2(leAddress, savedMappings.legalEntityStreetAddress2__c,savedMappings.legalEntityStreetAddress2D__c,savedMappings.legalEntityStreetAddress2X__c,selectedOpportunityId);
			setCity(leAddress, savedMappings.legalEntityCity__c,savedMappings.legalEntityCityD__c,savedMappings.legalEntityCityX__c,selectedOpportunityId);
			setStateProvince(leAddress, savedMappings.legalEntityStateProvince__c,savedMappings.legalEntityStateProvinceD__c,savedMappings.legalEntityStateProvinceX__c,selectedOpportunityId);
			setPostalCode(leAddress, savedMappings.legalEntityPostalCode__c,savedMappings.legalEntityPostalCodeD__c,savedMappings.legalEntityPostalCodeX__c,selectedOpportunityId);
			setCountryCode(leAddress, savedMappings.legalEntityCountryCode__c,savedMappings.legalEntityCountryCodeD__c,savedMappings.legalEntityCountryCodeX__c,selectedOpportunityId);
			legalEntityModel.setLegalEntityAddress(leAddress);
		}
		
		Principal principal = legalEntityModel.getLegalEntityPrincipal();
		if(principal != null){
			setFirstName(principal, savedMappings.legalEntityPrincipalFirstName__c,savedMappings.legalEntityPrincipalFirstNameD__c,savedMappings.legalEntityPrincipalFirstNameX__c,selectedOpportunityId);
			setLastName(principal, savedMappings.legalEntityPrincipalLastName__c,savedMappings.legalEntityPrincipalLastNameD__c,savedMappings.legalEntityPrincipalLastNameX__c,selectedOpportunityId);
			setEmailAddress(principal, savedMappings.legalEntityPrincipalEmailAddress__c,savedMappings.legalEntityPrincipalEmailAddressD__c,savedMappings.legalEntityPrincipalEmailAddressX__c,selectedOpportunityId);
			setContactPhone(principal, savedMappings.legalEntityPrincipalContactPhone__c,savedMappings.legalEntityPrincipalContactPhoneD__c,savedMappings.legalEntityPrincipalContactPhoneX__c,selectedOpportunityId);
			setDateOfBirth(principal, savedMappings.legalEntityPrincipalDateOfBirth__c,savedMappings.legalEntityPrincipalDateOfBirthD__c,savedMappings.legalEntityPrincipalDateOfBirthX__c,selectedOpportunityId);
			setDriversLicense(principal, savedMappings.legalEntityPrincipalDriversLicense__c,savedMappings.legalEntityPrincipalDriversLicenseD__c,savedMappings.legalEntityPrincipalDriversLicenseX__c,selectedOpportunityId);
			setDriversLicenseState(principal, savedMappings.legalEntityPrincipalDriversLicenseState__c,savedMappings.legalEntityPrincipalDriversLicenseStateD__c,savedMappings.legalEntityPrincipalDriversLicenseStateX__c,selectedOpportunityId);
			setSsn(principal, savedMappings.legalEntityPrincipalSsn__c,savedMappings.legalEntityPrincipalSsnD__c,savedMappings.legalEntityPrincipalSsnX__c,selectedOpportunityId);
			
			Address principalAddress = principal.getAddress();
			if(principalAddress != null){
				setStreetAddress1(principalAddress, savedMappings.legalEntityPrincipalStreetAddress1__c,savedMappings.legalEntityPrincipalStreetAddress1D__c,savedMappings.legalEntityPrincipalStreetAddress1X__c,selectedOpportunityId);
				setStreetAddress2(principalAddress, savedMappings.legalEntityPrincipalStreetAddress2__c,savedMappings.legalEntityPrincipalStreetAddress2D__c,savedMappings.legalEntityPrincipalStreetAddress2X__c,selectedOpportunityId);
				setCity(principalAddress, savedMappings.legalEntityPrincipalCity__c,savedMappings.legalEntityPrincipalCityD__c,savedMappings.legalEntityPrincipalCityX__c,selectedOpportunityId);
				setStateProvince(principalAddress, savedMappings.legalEntityPrincipalStateProvince__c,savedMappings.legalEntityPrincipalStateProvinceD__c,savedMappings.legalEntityPrincipalStateProvinceX__c,selectedOpportunityId);
				setPostalCode(principalAddress, savedMappings.legalEntityPrincipalPostalCode__c,savedMappings.legalEntityPrincipalPostalCodeD__c,savedMappings.legalEntityPrincipalPostalCodeX__c,selectedOpportunityId);
				setCountryCode(principalAddress, savedMappings.legalEntityPrincipalCountryCode__c,savedMappings.legalEntityPrincipalCountryCodeD__c,savedMappings.legalEntityPrincipalCountryCodeX__c,selectedOpportunityId);
				principal.setAddress(principalAddress);
			}
			legalEntityModel.setLegalEntityPrincipal(principal);
		}
		
		return legalEntityModel;
	}
	
	public LegalEntityModel setLegalEntityModelFromMappingObjectOnOpportunityChange(LegalEntityModel legalEntityModel, SalesforceLitleMappingsObject__c savedMappings, String selectedOpportunityId){
		if(legalEntityModel.getIsNameFromOpportunity()){
            setLegalEntityName(legalEntityModel, savedMappings.legalEntityName__c, savedMappings.legalEntityNameD__c, savedMappings.legalEntityNameX__c, selectedOpportunityId);
		}
		if(legalEntityModel.getIsDoingBusinessAsFromOpportunity()){
            setLegalEntityDoingBusinessAs(legalEntityModel, savedMappings.legalEntityDoingBusinessAs__c,savedMappings.legalEntityDoingBusinessAsD__c,savedMappings.legalEntityDoingBusinessAsX__c,selectedOpportunityId);
		}
		if(legalEntityModel.getIsTaxIdFromOpportunity()){
             setLegalEntityTaxId(legalEntityModel, savedMappings.legalEntityTaxId__c,savedMappings.legalEntityTaxIdD__c,savedMappings.legalEntityTaxIdX__c,selectedOpportunityId);
		}
		if(legalEntityModel.getIsAnnualCreditCardSalesVolumeFromOpportunity()){
            setLegalEntityAnnualCreditCardSalesVolume(legalEntityModel, savedMappings.legalEntityAnnualCreditCardSalesVolume__c,savedMappings.legalEntityAnnualCreditCardSalesVolumeD__c,savedMappings.legalEntityAnnualCreditCardSalesVolumeX__c,selectedOpportunityId);
		}
		if(legalEntityModel.getIsHasAcceptedCreditCardsFromOpportunity()){
			setLegalEntityHasAcceptedCreditCards(legalEntityModel, savedMappings.legalEntityHasAcceptedCreditCards__c,savedMappings.legalEntityHasAcceptedCreditCardsD__c,savedMappings.legalEntityHasAcceptedCreditCardsX__c,selectedOpportunityId);
		}
		if(legalEntityModel.getIsContactPhoneFromOpportunity()){
            setLegalEntityContactPhone(legalEntityModel, savedMappings.legalEntityContactPhone__c,savedMappings.legalEntityContactPhoneD__c,savedMappings.legalEntityContactPhoneX__c,selectedOpportunityId);
		}
		
		Address leAddress = legalEntityModel.getLegalEntityAddress();
		if(leAddress != null){
			if(leAddress.getIsStreetAddress1FromOpportunity()){
				setStreetAddress1(leAddress, savedMappings.legalEntityStreetAddress1__c,savedMappings.legalEntityStreetAddress1D__c,savedMappings.legalEntityStreetAddress1X__c,selectedOpportunityId);
			}
			if(leAddress.getIsStreetAddress2FromOpportunity()){
				setStreetAddress2(leAddress, savedMappings.legalEntityStreetAddress2__c,savedMappings.legalEntityStreetAddress2D__c,savedMappings.legalEntityStreetAddress2X__c,selectedOpportunityId);
			}
			if(leAddress.getIsCityFromOpportunity()){
				setCity(leAddress, savedMappings.legalEntityCity__c,savedMappings.legalEntityCityD__c,savedMappings.legalEntityCityX__c,selectedOpportunityId);
			}
			if(leAddress.getIsStateProvinceFromOpportunity()){
				setStateProvince(leAddress, savedMappings.legalEntityStateProvince__c,savedMappings.legalEntityStateProvinceD__c,savedMappings.legalEntityStateProvinceX__c,selectedOpportunityId);
			}
			if(leAddress.getIsPostalCodeFromOpportunity()){
				setPostalCode(leAddress, savedMappings.legalEntityPostalCode__c,savedMappings.legalEntityPostalCodeD__c,savedMappings.legalEntityPostalCodeX__c,selectedOpportunityId);
			}
			if(leAddress.getIsCountryCodeFromOpportunity()){
				setCountryCode(leAddress, savedMappings.legalEntityCountryCode__c,savedMappings.legalEntityCountryCodeD__c,savedMappings.legalEntityCountryCodeX__c,selectedOpportunityId);
			}
			legalEntityModel.setLegalEntityAddress(leAddress);
		}
		
		Principal principal = legalEntityModel.getLegalEntityPrincipal();
		if(principal != null){
			if(principal.getIsFirstNameFromOpportunity()){
				setFirstName(principal, savedMappings.legalEntityPrincipalFirstName__c,savedMappings.legalEntityPrincipalFirstNameD__c,savedMappings.legalEntityPrincipalFirstNameX__c,selectedOpportunityId);
			}
			if(principal.getIsLastNameFromOpportunity()){
				setLastName(principal, savedMappings.legalEntityPrincipalLastName__c,savedMappings.legalEntityPrincipalLastNameD__c,savedMappings.legalEntityPrincipalLastNameX__c,selectedOpportunityId);
			}
			if(principal.getIsEmailAddressFromOpportunity()){
				setEmailAddress(principal, savedMappings.legalEntityPrincipalEmailAddress__c,savedMappings.legalEntityPrincipalEmailAddressD__c,savedMappings.legalEntityPrincipalEmailAddressX__c,selectedOpportunityId);
			}
			if(principal.getIsContactPhoneFromOpportunity()){
				setContactPhone(principal, savedMappings.legalEntityPrincipalContactPhone__c,savedMappings.legalEntityPrincipalContactPhoneD__c,savedMappings.legalEntityPrincipalContactPhoneX__c,selectedOpportunityId);
			}
			if(principal.getIsDateOfBirthFromOpportunity()){
				setDateOfBirth(principal, savedMappings.legalEntityPrincipalDateOfBirth__c,savedMappings.legalEntityPrincipalDateOfBirthD__c,savedMappings.legalEntityPrincipalDateOfBirthX__c,selectedOpportunityId);
			}
			if(principal.getIsDriversLicenseFromOpportunity()){
				setDriversLicense(principal, savedMappings.legalEntityPrincipalDriversLicense__c,savedMappings.legalEntityPrincipalDriversLicenseD__c,savedMappings.legalEntityPrincipalDriversLicenseX__c,selectedOpportunityId);
			}
			if(principal.getIsDriversLicenseStateFromOpportunity()){
				setDriversLicenseState(principal, savedMappings.legalEntityPrincipalDriversLicenseState__c,savedMappings.legalEntityPrincipalDriversLicenseStateD__c,savedMappings.legalEntityPrincipalDriversLicenseStateX__c,selectedOpportunityId);
			}
			if(principal.getIsSsnFromOpportunity()){
				setSsn(principal, savedMappings.legalEntityPrincipalSsn__c,savedMappings.legalEntityPrincipalSsnD__c,savedMappings.legalEntityPrincipalSsnX__c,selectedOpportunityId);
			}
			
			Address principalAddress = principal.getAddress();
			if(principalAddress != null){
				if(leAddress.getIsStreetAddress1FromOpportunity()){
					setStreetAddress1(principalAddress, savedMappings.legalEntityPrincipalStreetAddress1__c,savedMappings.legalEntityPrincipalStreetAddress1D__c,savedMappings.legalEntityPrincipalStreetAddress1X__c,selectedOpportunityId);
				}
				if(leAddress.getIsStreetAddress2FromOpportunity()){
					setStreetAddress2(principalAddress, savedMappings.legalEntityPrincipalStreetAddress2__c,savedMappings.legalEntityPrincipalStreetAddress2D__c,savedMappings.legalEntityPrincipalStreetAddress2X__c,selectedOpportunityId);
				}
				if(leAddress.getIsCityFromOpportunity()){
					setCity(principalAddress, savedMappings.legalEntityPrincipalCity__c,savedMappings.legalEntityPrincipalCityD__c,savedMappings.legalEntityPrincipalCityX__c,selectedOpportunityId);
				}
				if(leAddress.getIsStateProvinceFromOpportunity()){
					setStateProvince(principalAddress, savedMappings.legalEntityPrincipalStateProvince__c,savedMappings.legalEntityPrincipalStateProvinceD__c,savedMappings.legalEntityPrincipalStateProvinceX__c,selectedOpportunityId);
				}
				if(leAddress.getIsPostalCodeFromOpportunity()){
					setPostalCode(principalAddress, savedMappings.legalEntityPrincipalPostalCode__c,savedMappings.legalEntityPrincipalPostalCodeD__c,savedMappings.legalEntityPrincipalPostalCodeX__c,selectedOpportunityId);
				}
				if(leAddress.getIsCountryCodeFromOpportunity()){
					setCountryCode(principalAddress, savedMappings.legalEntityPrincipalCountryCode__c,savedMappings.legalEntityPrincipalCountryCodeD__c,savedMappings.legalEntityPrincipalCountryCodeX__c,selectedOpportunityId);
				}
				principal.setAddress(principalAddress);
			}
			legalEntityModel.setLegalEntityPrincipal(principal);
		}
		
		return legalEntityModel;
	}
	
	public LegalEntityModel setLegalEntityName(LegalEntityModel legalEntityModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	legalEntityModel.setLegalEntityName(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		legalEntityModel.setIsNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return legalEntityModel;
    }
    
    public LegalEntityModel setLegalEntityDoingBusinessAs(LegalEntityModel legalEntityModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	legalEntityModel.setLegalEntityDoingBusinessAs(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		legalEntityModel.setIsDoingBusinessAsFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
    	return legalEntityModel;
    }
    
    public LegalEntityModel setLegalEntityTaxId(LegalEntityModel legalEntityModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	legalEntityModel.setLegalEntityTaxId(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		legalEntityModel.setIsTaxIdFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return legalEntityModel;
    }
	
    public LegalEntityModel setLegalEntityAnnualCreditCardSalesVolume(LegalEntityModel legalEntityModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		legalEntityModel.setIsAnnualCreditCardSalesVolumeFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return legalEntityModel;
    }
    
    public LegalEntityModel setLegalEntityHasAcceptedCreditCards(LegalEntityModel legalEntityModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	legalEntityModel.setLegalEntityHasAcceptedCreditCards(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		legalEntityModel.setIsHasAcceptedCreditCardsFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return legalEntityModel;
    }
	
	public LegalEntityModel setLegalEntityContactPhone(LegalEntityModel legalEntityModel, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
		legalEntityModel.setLegalEntityContactPhone(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		legalEntityModel.setIsContactPhoneFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return legalEntityModel;
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
	
	
	public Principal setFirstName(Principal principal, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	principal.setFirstName(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		principal.setIsFirstNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return principal;
	}
	
	public Principal setLastName(Principal principal, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	principal.setLastName(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		principal.setIsLastNameFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return principal;
	}
	
	public Principal setEmailAddress(Principal principal, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	principal.setEmailAddress(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		principal.setIsEmailAddressFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return principal;
	}
	
	public Principal setContactPhone(Principal principal, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	principal.setContactPhone(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		principal.setIsContactPhoneFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return principal;
	}
	
	public Principal setDateOfBirth(Principal principal, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	principal.setDateOfBirth(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		principal.setIsDateOfBirthFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return principal;
	}
	
	public Principal setDriversLicense(Principal principal, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	principal.setDriversLicense(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		principal.setIsDriversLicenseFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return principal;
	}
	
	public Principal setDriversLicenseState(Principal principal, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	principal.setDriversLicenseState(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		principal.setIsDriversLicenseStateFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return principal;
	}
	
	public Principal setSsn(Principal principal, String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
    	principal.setSsn(mappingService.fetchMappedValue(salesforceField, defaultValue, isDefaultDisabled,selectedOpportunityId));
		principal.setIsSsnFromOpportunity(mappingService.isOpportunityMappedAndAccessedFromAccount(salesforceField, isDefaultDisabled));
		return principal;
	}
	
	public Boolean areRequiredFieldsPresent(LegalEntityModel legalEntityModel, Boolean showErrorMessageOnPage){
		Boolean isAllRequiredFieldsPresent = true;
        if(String.isEmpty(legalEntityModel.getLegalEntityName())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Legal Entity Name is Required');
            }
    
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress1())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Legal Entity\'s Street Address 1 is Required');
            }
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getCountryCode())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Legal Entity\'s Country Code is Required');
            }
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getLastName())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Company Representative\'s Last Name is Required');
            }
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getFirstName())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Company Representative\'s First Name is Required');
            }
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityType())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Legal Entity Type is Required');
            }    
        }else{
            if(legalEntityModel.getLegalEntityType().equalsIgnoreCase(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name())){
                if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getCity())){
                    isAllRequiredFieldsPresent = false;
                    if(showErrorMessageOnPage){
						ApexPageUtil.addErrorMessage('Legal Entity\'s City is Required');
            		}    
                }
                if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getStateProvince())){
                    isAllRequiredFieldsPresent = false;
                    if(showErrorMessageOnPage){
						ApexPageUtil.addErrorMessage('Legal Entity\'s State/Province is Required');
            		}    
                }
                if(String.isEmpty(legalEntityModel.getLegalEntityAddress().getPostalCode())){
                    isAllRequiredFieldsPresent = false;
                    if(showErrorMessageOnPage){
						ApexPageUtil.addErrorMessage('Legal Entity\'s Postal Code is Required');
            		}    
                }
                if(String.isEmpty(legalEntityModel.getLegalEntityPrincipal().getSsn())){
                    isAllRequiredFieldsPresent = false;
                    if(showErrorMessageOnPage){
						ApexPageUtil.addErrorMessage('Company Representative\'s SSN is Required');
            		}    
                }
            }else{
                if(String.isEmpty(legalEntityModel.getLegalEntityTaxId())){
                    isAllRequiredFieldsPresent = false;
                    if(showErrorMessageOnPage){
						ApexPageUtil.addErrorMessage('Legal Entity\'s Tax ID is Required');
            		}    
                }
            }
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Annual Credit Card Sales Volume is Required');
            }
        }
        if(String.isEmpty(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
            isAllRequiredFieldsPresent = false;
            if(showErrorMessageOnPage){
				ApexPageUtil.addErrorMessage('Accepted Credit Cards in the Past is Required');
            }
        }
        return isAllRequiredFieldsPresent;
	}
	
	public Boolean isLegalEntityValid(LegalEntityModel legalEntityModel, Boolean showErrorMessageOnPage){
		Boolean isInputValid = true;
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityName())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityName(), 60)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s Name cannot exceed 60 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityDoingBusinessAs())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityDoingBusinessAs(), 60)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Doing Business As cannot exceed 60 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress1())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStreetAddress1(), 60)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s Street Address 1 cannot exceed 60 characters');
            	}
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityContactPhone())){
            if(!ValidationUtil.validateInteger(legalEntityModel.getLegalEntityContactPhone())
            || legalEntityModel.getLegalEntityContactPhone().length() != 10){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s Contact Phone must be 10 digits');
           		}
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStreetAddress2())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStreetAddress2(), 60)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s Street Address 2 cannot exceed 60 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getCity())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getCity(), 20)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s City cannot exceed 20 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getStateProvince())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getStateProvince(), 2)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s State/Province cannot exceed 2 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getPostalCode())){
        	if(!ValidationUtil.validateInteger(legalEntityModel.getLegalEntityAddress().getPostalCode()) 
            		|| legalEntityModel.getLegalEntityAddress().getPostalCode().length() != 5){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s Postal Code must be 5 digits');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityAddress().getCountryCode())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityAddress().getCountryCode(), 3)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s Country Code cannot exceed 3 characters');
            	}
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress1())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress1(), 60)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Street Address 1 cannot exceed 60 characters');
            	}
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress2())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress2(), 60)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Street Address 2 cannot exceed 60 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getAddress().getCity())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getAddress().getCity(), 20)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s City cannot exceed 20 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getAddress().getStateProvince())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getAddress().getStateProvince(), 2)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s State/Province cannot exceed 2 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getAddress().getPostalCode())){
        	if(!ValidationUtil.validateInteger(legalEntityModel.getLegalEntityPrincipal().getAddress().getPostalCode()) 
            		|| legalEntityModel.getLegalEntityPrincipal().getAddress().getPostalCode().length() != 5){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Postal Code must be 5 digits');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getAddress().getCountryCode())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getAddress().getCountryCode(), 3)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Country Code cannot exceed 3 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getFirstName())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getFirstName(), 20)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s First Name cannot exceed 20 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getLastName())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getLastName(), 20)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Last Name cannot exceed 20 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getEmailAddress())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getEmailAddress(), 100)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Email Address cannot exceed 100 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getContactPhone())){
            if(!ValidationUtil.validateInteger(legalEntityModel.getLegalEntityPrincipal().getContactPhone())
            || legalEntityModel.getLegalEntityPrincipal().getContactPhone().length() != 10){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Contact Phone must be 10 digits');
           		}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDateOfBirth())){
            if(!ValidationUtil.validateDate(legalEntityModel.getLegalEntityPrincipal().getDateOfBirth())){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Date of Birth is not in yyyy-mm-dd format');
            	}
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDriversLicense())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getDriversLicense(), 25)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Drivers License cannot exceed 25 characters');
            	}
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState(), 2)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s Drivers License State cannot exceed 2 characters');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityPrincipal().getSsn())){
            if(!ValidationUtil.validateInteger(legalEntityModel.getLegalEntityPrincipal().getSsn())
            || legalEntityModel.getLegalEntityPrincipal().getSsn().length() != 9){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Company Representative\'s SSN must be 9 digits');
            	}
            }
        }
        if(String.isNotEmpty(legalEntityModel.getLegalEntityTaxId())){
            if(!ValidationUtil.validateString(legalEntityModel.getLegalEntityTaxId(), 9)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s Tax ID cannot exceed 9 characters');
            	}
            }
        }
        
		if(String.isNotEmpty(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())){
            if(!ValidationUtil.validateInteger(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume())
            || !ValidationUtil.validateString(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), 23)){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s Annual Credit Card Sales Volume cannot exceed 23 digits');
            	}
            }
        }
        
        if(String.isNotEmpty(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
            if(!ValidationUtil.validateBoolean(legalEntityModel.getLegalEntityHasAcceptedCreditCards())){
                isInputValid = false;
                if(showErrorMessageOnPage){
					ApexPageUtil.addErrorMessage('Legal Entity\'s Accepted Credit Cards in the Past should be either true or false');
            	}
            }
        }
        return isInputValid;
	}
}