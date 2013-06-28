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
			if(String.isNotEmpty(mappingObject.legalEntityIsExclusiveToPsp__c) && mappingObject.legalEntityIsExclusiveToPsp__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityIsPciComplianceValidated__c) && mappingObject.legalEntityIsPciComplianceValidated__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityMostRecentlyPassedScan__c) && mappingObject.legalEntityMostRecentlyPassedScan__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityName__c) && mappingObject.legalEntityName__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityPciLevel__c) && mappingObject.legalEntityPciLevel__c.startsWith(sObjectType)) {
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
			if(String.isNotEmpty(mappingObject.legalEntityQualifiedSecurityAssessor__c) && mappingObject.legalEntityQualifiedSecurityAssessor__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityReportOnCompliance__c) && mappingObject.legalEntityReportOnCompliance__c.startsWith(sObjectType)) {
				return true;
			}
			if(String.isNotEmpty(mappingObject.legalEntityScanningVendor__c) && mappingObject.legalEntityScanningVendor__c.startsWith(sObjectType)) {
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

}