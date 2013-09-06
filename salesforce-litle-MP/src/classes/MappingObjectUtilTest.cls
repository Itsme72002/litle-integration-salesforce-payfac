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
    
    static testMethod void getCurrentMappings_NoRecord(){
    	SalesforceLitleMappingsObject__c mapping = MappingObjectUtil.getCurrentMappings();
    	System.assertEquals(null, mapping);
    }
    
    static testMethod void getCurrentMappings_RecordPresent(){
    	SalesforceLitleMappingsObject__c mappingObject= new SalesforceLitleMappingsObject__c();
		mappingObject.subMerchantUrl__c = 'Opportunity.Name';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
		SalesforceLitleMappingsObject__c mapping = MappingObjectUtil.getCurrentMappings();
    	System.assertNotEquals(null, mapping);
    	System.assertEquals('CERT', mapping.litleEnvironment__c);
    	System.assertEquals('Opportunity.Name', mapping.subMerchantUrl__c);
    }
}