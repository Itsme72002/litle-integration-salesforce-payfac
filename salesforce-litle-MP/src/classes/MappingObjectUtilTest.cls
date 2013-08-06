/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class MappingObjectUtilTest {

    static testMethod void testIsSobjectTypePresentInMapping() {
        SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityAnnualCreditCardSalesVolume__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityCity__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityContactPhone__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityCountryCode__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityDoingBusinessAs__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalEmailAddress__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityHasAcceptedCreditCards__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityName__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPostalCode__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalDateOfBirth__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalDriversLicense__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalDriversLicenseState__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalFirstName__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalLastName__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalSsn__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalContactPhone__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalCity__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalCountryCode__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalPostalCode__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalStateProvince__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalStreetAddress1__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityPrincipalStreetAddress2__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityStateProvince__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityStreetAddress1__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityStreetAddress2__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.legalEntityTaxId__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantAmexMid__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantBankAccountNumber__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantBankRoutingNumber__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantCity__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantCountryCode__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantCreateCredentials__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantCustomerServiceNumber__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantDiscoverConveyMid__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchanteCheckBillingDescriptor__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchanteCheckCompanyName__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantEmailAddress__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantFirstName__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantHardCodeBillingDescriptor__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantLastName__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantMaxTransactionAmount__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantMerchantCategoryCode__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantMerchantName__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantPhone__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantPostalCode__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantPspMerchantId__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantStateProvince__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantStreetAddress1__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantStreetAddress2__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		
		mappingObject = new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantUrl__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		System.assert(MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, 'Opportunity'));
		 delete mappingObject;
		 
		System.assert(!MappingObjectUtil.isSobjectTypePresentInMapping(null, 'Opportunity'));
		System.assert(!MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, ''));
		System.assert(!MappingObjectUtil.isSobjectTypePresentInMapping(mappingObject, null));
		

    }
}