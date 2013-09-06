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
public class MappingObjectUtil {
	
	//returns true if the given mapping object has the any mapping of the given
	//sobject type
	public static Boolean isSobjectTypePresentInMapping(SalesforceLitleMappingsObject__c mappingObject, String sObjectType){
		if(mappingObject != null && String.isNotEmpty(sObjectType)){
			if(String.isNotEmpty(mappingObject.legalEntityAnnualCreditCardSalesVolume__c) && mappingObject.legalEntityAnnualCreditCardSalesVolume__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityCity__c) && mappingObject.legalEntityCity__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityContactPhone__c) && mappingObject.legalEntityContactPhone__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityCountryCode__c) && mappingObject.legalEntityCountryCode__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityDoingBusinessAs__c) && mappingObject.legalEntityDoingBusinessAs__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalEmailAddress__c) && mappingObject.legalEntityPrincipalEmailAddress__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityHasAcceptedCreditCards__c) && mappingObject.legalEntityHasAcceptedCreditCards__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityName__c) && mappingObject.legalEntityName__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPostalCode__c) && mappingObject.legalEntityPostalCode__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalDateOfBirth__c) && mappingObject.legalEntityPrincipalDateOfBirth__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalDriversLicense__c) && mappingObject.legalEntityPrincipalDriversLicense__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalDriversLicenseState__c) && mappingObject.legalEntityPrincipalDriversLicenseState__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalFirstName__c) && mappingObject.legalEntityPrincipalFirstName__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalLastName__c) && mappingObject.legalEntityPrincipalLastName__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalSsn__c) && mappingObject.legalEntityPrincipalSsn__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalContactPhone__c) && mappingObject.legalEntityPrincipalContactPhone__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalCity__c) && mappingObject.legalEntityPrincipalCity__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalCountryCode__c) && mappingObject.legalEntityPrincipalCountryCode__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalPostalCode__c) && mappingObject.legalEntityPrincipalPostalCode__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalStateProvince__c) && mappingObject.legalEntityPrincipalStateProvince__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalStreetAddress1__c) && mappingObject.legalEntityPrincipalStreetAddress1__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPrincipalStreetAddress2__c) && mappingObject.legalEntityPrincipalStreetAddress2__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityStateProvince__c) && mappingObject.legalEntityStateProvince__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityStreetAddress1__c) && mappingObject.legalEntityStreetAddress1__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityStreetAddress2__c) && mappingObject.legalEntityStreetAddress2__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityTaxId__c) && mappingObject.legalEntityTaxId__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantAmexMid__c) && mappingObject.subMerchantAmexMid__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantBankAccountNumber__c) && mappingObject.subMerchantBankAccountNumber__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantBankRoutingNumber__c) && mappingObject.subMerchantBankRoutingNumber__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantCity__c) && mappingObject.subMerchantCity__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantCountryCode__c) && mappingObject.subMerchantCountryCode__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantCreateCredentials__c) && mappingObject.subMerchantCreateCredentials__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantCustomerServiceNumber__c) && mappingObject.subMerchantCustomerServiceNumber__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantDiscoverConveyMid__c) && mappingObject.subMerchantDiscoverConveyMid__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchanteCheckBillingDescriptor__c) && mappingObject.subMerchanteCheckBillingDescriptor__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchanteCheckCompanyName__c) && mappingObject.subMerchanteCheckCompanyName__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantEmailAddress__c) && mappingObject.subMerchantEmailAddress__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantFirstName__c) && mappingObject.subMerchantFirstName__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantHardCodeBillingDescriptor__c) && mappingObject.subMerchantHardCodeBillingDescriptor__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantLastName__c) && mappingObject.subMerchantLastName__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantMaxTransactionAmount__c) && mappingObject.subMerchantMaxTransactionAmount__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantMerchantCategoryCode__c) && mappingObject.subMerchantMerchantCategoryCode__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantMerchantName__c) && mappingObject.subMerchantMerchantName__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantPhone__c) && mappingObject.subMerchantPhone__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantPostalCode__c) && mappingObject.subMerchantPostalCode__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantPspMerchantId__c) && mappingObject.subMerchantPspMerchantId__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantStateProvince__c) && mappingObject.subMerchantStateProvince__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantStreetAddress1__c) && mappingObject.subMerchantStreetAddress1__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantStreetAddress2__c) && mappingObject.subMerchantStreetAddress2__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.subMerchantUrl__c) && mappingObject.subMerchantUrl__c.startsWith(sObjectType)) {
				return true;
			}
		}
		return false;
				
	}
	
	public static SalesforceLitleMappingsObject__c getCurrentMappings(){
		SalesforceLitleMappingsObject__c mappingObject;
		List<SalesforceLitleMappingsObject__c> mappingObjects = [select id, name, litleEnvironment__c, legalEntityAnnualCreditCardSalesVolume__c, legalEntityAnnualCreditCardSalesVolumeD__c, legalEntityAnnualCreditCardSalesVolumeX__c, legalEntityCity__c, legalEntityCityD__c, legalEntityCityX__c, legalEntityContactPhone__c, legalEntityContactPhoneD__c, legalEntityContactPhoneX__c, legalEntityCountryCode__c, legalEntityCountryCodeD__c, legalEntityCountryCodeX__c, legalEntityDateOfBirth__c, legalEntityDateOfBirthX__c, legalEntityDoingBusinessAs__c, legalEntityDoingBusinessAsD__c, legalEntityDoingBusinessAsX__c, legalEntityPrincipalEmailAddress__c, legalEntityPrincipalEmailAddressD__c, legalEntityPrincipalEmailAddressX__c, legalEntityHasAcceptedCreditCards__c, legalEntityHasAcceptedCreditCardsD__c, legalEntityHasAcceptedCreditCardsX__c, legalEntityName__c, legalEntityNameD__c, legalEntityNameX__c, legalEntityPostalCode__c, legalEntityPostalCodeD__c, legalEntityPostalCodeX__c, legalEntityPrincipalDateOfBirth__c, legalEntityPrincipalDateOfBirthD__c, legalEntityPrincipalDateOfBirthX__c, legalEntityPrincipalDriversLicense__c, legalEntityPrincipalDriversLicenseD__c, legalEntityPrincipalDriversLicenseState__c, legalEntityPrincipalDriversLicenseStateD__c, legalEntityPrincipalDriversLicenseStateX__c, legalEntityPrincipalDriversLicenseX__c, legalEntityPrincipalFirstName__c, legalEntityPrincipalFirstNameD__c, legalEntityPrincipalFirstNameX__c, legalEntityPrincipalLastName__c, legalEntityPrincipalLastNameD__c, legalEntityPrincipalLastNameX__c, legalEntityPrincipalSsn__c, legalEntityPrincipalSsnD__c, legalEntityPrincipalSsnX__c, legalEntityStateProvince__c, legalEntityStateProvinceD__c, legalEntityStateProvinceX__c, legalEntityStreetAddress1__c, legalEntityStreetAddress1D__c, legalEntityStreetAddress1X__c, legalEntityStreetAddress2__c, legalEntityStreetAddress2D__c, legalEntityStreetAddress2X__c, legalEntityTaxId__c, legalEntityTaxIdD__c, legalEntityTaxIdX__c, legalEntityType__c, legalEntityTypeD__c, legalEntityTypeX__c, merchantPassword__c, merchantUsername__c, subMerchantAmexMid__c, subMerchantAmexMidD__c, subMerchantAmexMidX__c, subMerchantBankAccountNumber__c, subMerchantBankAccountNumberD__c, subMerchantBankAccountNumberX__c, subMerchantBankRoutingNumber__c, subMerchantBankRoutingNumberD__c, subMerchantBankRoutingNumberX__c, subMerchantCity__c, subMerchantCityD__c, subMerchantCityX__c, subMerchantCountryCode__c, subMerchantCountryCodeD__c, subMerchantCountryCodeX__c, subMerchantCreateCredentials__c, subMerchantCreateCredentialsD__c, subMerchantCreateCredentialsX__c, subMerchantCustomerServiceNumber__c, subMerchantCustomerServiceNumberD__c, subMerchantCustomerServiceNumberX__c, subMerchantDiscoverConveyMid__c, subMerchantDiscoverConveyMidD__c, subMerchantDiscoverConveyMidX__c, subMerchanteCheckBillingDescD__c, subMerchanteCheckBillingDescriptor__c, subMerchanteCheckBillingDescriptorX__c, subMerchanteCheckCompanyName__c, subMerchanteCheckCompanyNameD__c, subMerchanteCheckCompanyNameX__c, subMerchantEmailAddress__c, subMerchantEmailAddressD__c, subMerchantEmailAddressX__c, subMerchantFirstName__c, subMerchantFirstNameD__c, subMerchantFirstNameX__c, subMerchantHardCodeBillingDescD__c, subMerchantHardCodeBillingDescriptor__c, subMerchantHardCodeBillingDescriptorX__c, subMerchantLastName__c, subMerchantLastNameD__c, subMerchantLastNameX__c, subMerchantMaxTransactionAmount__c, subMerchantMaxTransactionAmountD__c, subMerchantMaxTransactionAmountX__c, subMerchantMerchantCategoryCode__c, subMerchantMerchantCategoryCodeD__c, subMerchantMerchantCategoryCodeX__c, subMerchantMerchantName__c, subMerchantMerchantNameD__c, subMerchantMerchantNameX__c, subMerchantPhone__c, subMerchantPhoneD__c, subMerchantPhoneX__c, subMerchantPostalCode__c, subMerchantPostalCodeD__c, subMerchantPostalCodeX__c, subMerchantPspMerchantId__c, subMerchantPspMerchantIdD__c, subMerchantPspMerchantIdX__c, subMerchantStateProvince__c, subMerchantStateProvinceD__c, subMerchantStateProvinceX__c, subMerchantStreetAddress1__c, subMerchantStreetAddress1D__c, subMerchantStreetAddress1X__c, subMerchantStreetAddress2__c, subMerchantStreetAddress2D__c, subMerchantStreetAddress2X__c, subMerchantUrl__c, subMerchantUrlD__c, subMerchantUrlX__c, legalEntityPrincipalContactPhone__c, legalEntityPrincipalContactPhoneD__c, legalEntityPrincipalContactPhoneX__c, legalEntityPrincipalCity__c, legalEntityPrincipalCityD__c, legalEntityPrincipalCityX__c, legalEntityPrincipalCountryCode__c, legalEntityPrincipalCountryCodeD__c, legalEntityPrincipalCountryCodeX__c, legalEntityPrincipalPostalCode__c, legalEntityPrincipalPostalCodeD__c, legalEntityPrincipalPostalCodeX__c, legalEntityPrincipalStateProvince__c, legalEntityPrincipalStateProvinceD__c, legalEntityPrincipalStateProvinceX__c, legalEntityPrincipalStreetAddress1__c, legalEntityPrincipalStreetAddress1D__c, legalEntityPrincipalStreetAddress1X__c, legalEntityPrincipalStreetAddress2__c, legalEntityPrincipalStreetAddress2D__c, legalEntityPrincipalStreetAddress2X__c from SalesforceLitleMappingsObject__c limit 1];
        if(!mappingObjects.isEmpty()){ 
        	mappingObject = mappingObjects.get(0);
        }
        return mappingObject;
	}

}