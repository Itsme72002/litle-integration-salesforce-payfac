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
private class SalesforceLitleMappingControllerTest {
	private static final String testString = 'test';

	// Test legal entity model
    /*static testMethod void testLegalEntityModel() {
        SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
        System.assertNotEquals(salesforceLitleMappingController.getLegalEntityModel(), null);
        LegalEntityModel legalEntityModel = new LegalEntityModel();
        //String annualCreditCardSalesVolume = '300';
        legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(testString);
        salesforceLitleMappingController.setLegalEntityModel(legalEntityModel);
        System.assertNotEquals(salesforceLitleMappingController.getLegalEntityModel(), null);
        System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityAnnualCreditCardSalesVolume(), testString);
    }
    
    // Test sub merchant model
    static testMethod void testSubMerchantModel() {
        SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
        System.assertNotEquals(salesforceLitleMappingController.getSubMerchantModel(), null);
        SubMerchantModel subMerchantModel = new SubMerchantModel();
        //String subMerchantAmexMid = '12345';
        subMerchantModel.setSubMerchantAmexMid( = null
        salesforceLitleMappingController.setSubMerchantModel(subMerchantModel);
        System.assertNotEquals(salesforceLitleMappingController.getSubMerchantModel(), null);
        System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantAmexMid(), testString);
    }*/
    
    // Test salesforce fields
    static testMethod void testSalesforceFields() {
        SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
        System.assert(salesforceLitleMappingController.getSalesforceFields().size()!= 0);
    }

	static testMethod void testOnSelectChangeLegalEntityName(){
	 	SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityName__c, null);
	 	// set value to disable the textbox
	 	salesforceLitleMappingController.currentMappings.legalEntityName__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityName__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityName();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityNameX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityName__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityNameX__c, false);
	 }
	 
	 
	 static testMethod void testOnSelectChangeLegalEntityType(){
	 	SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityType__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityType__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityType__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityType();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTypeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityType__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityType__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityType();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTypeX__c, false);
	 	
	}
	
	
	static testMethod void testOnSelectChangeLegalEntityStreetAddress1(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress1();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1X__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1X__c, false);
		 
	}
	
	
	static testMethod void testOnSelectChangeLegalEntityStreetAddress2(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress2();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2X__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2X__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityCity(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCity__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityCity__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCity__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityCity();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCityX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityCity__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCity__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityCity();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCityX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityStateProvince(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityStateProvince();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvinceX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityStateProvince();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvinceX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPostalCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPostalCode();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCodeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPostalCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCodeX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityCountryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityCountryCode();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCodeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityCountryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCodeX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityFirstName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityFirstName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityFirstName__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityFirstName__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityFirstName();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityFirstNameX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityFirstName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityFirstName__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityFirstName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityFirstNameX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityLastName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityLastName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityLastName__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityLastName__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityLastName();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityLastNameX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityLastName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityLastName__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityLastName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityLastNameX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityEmailAddress(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityEmailAddress__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityEmailAddress__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityEmailAddress__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityEmailAddress();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityEmailAddressX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityEmailAddress__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityEmailAddress__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityEmailAddress();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityEmailAddressX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityContactPhone(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityContactPhone();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhoneX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityContactPhone();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhoneX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityDateOfBirth(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDateOfBirth__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityDateOfBirth__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDateOfBirth__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityDateOfBirth();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDateOfBirthX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityDateOfBirth__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDateOfBirth__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityDateOfBirth();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDateOfBirthX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityDriversLicense(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicense__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityDriversLicense__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicense__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityDriversLicense();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityDriversLicense__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicense__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityDriversLicense();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityDriversLicenseState(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseState__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseState__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseState__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityDriversLicenseState();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseStateX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseState__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseState__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityDriversLicenseState();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseStateX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntitySsn(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntitySsn__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntitySsn__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntitySsn__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntitySsn();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntitySsnX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntitySsn__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntitySsn__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntitySsn();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntitySsnX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityTaxId(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxId__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityTaxId__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxId__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityTaxId();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxIdX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityTaxId__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxId__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityTaxId();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxIdX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityIsExclusiveToPsp(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPsp__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPsp__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPsp__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityIsExclusiveToPsp();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPspX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPsp__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPsp__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityIsExclusiveToPsp();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPspX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityIsPciComplianceValidated(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidated__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidated__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidated__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityIsPciComplianceValidated();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidatedX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidated__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidated__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityIsPciComplianceValidated();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidatedX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPciLevel(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPciLevel__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPciLevel__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPciLevel__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPciLevel();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPciLevelX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPciLevel__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPciLevel__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPciLevel();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPciLevelX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityScanningVendor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityScanningVendor__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityScanningVendor__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityScanningVendor__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityScanningVendor();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityScanningVendorX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityScanningVendor__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityScanningVendor__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityScanningVendor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityScanningVendorX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityQualifiedSecurityAssessor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessor__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessor__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessor__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityQualifiedSecurityAssessor();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessorX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessor__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessor__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityQualifiedSecurityAssessor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessorX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityMostRecentlyPassedScan(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScan__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScan__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScan__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityMostRecentlyPassedScan();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScanX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScan__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScan__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityMostRecentlyPassedScan();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScanX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityReportOnCompliance(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityReportOnCompliance__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityReportOnCompliance__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityReportOnCompliance__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityReportOnCompliance();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityReportOnComplianceX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityReportOnCompliance__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityReportOnCompliance__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityReportOnCompliance();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityReportOnComplianceX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityAnnualCreditCardSalesVolume(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityAnnualCreditCardSalesVolume();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityAnnualCreditCardSalesVolume();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityHasAcceptedCreditCards(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityHasAcceptedCreditCards();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityHasAcceptedCreditCards();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsX__c, false);
	 }
	
	
	//Sub merchant on change listeners
	static testMethod void testOnSelectChangeSubMerchantStreetAddress1(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1X__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1X__c, false);		
	}
	
	
	static testMethod void testOnSelectChangeSubMerchantStreetAddress2(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2X__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2X__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCity(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCity__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantCity__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCity__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCity();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCityX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantCity__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCity__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCity();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCityX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantStateProvince(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantStateProvince();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvinceX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantStateProvince();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvinceX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantPostalCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantPostalCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCodeX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantPostalCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCodeX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCountryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCountryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCodeX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCountryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCodeX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantAmexMid(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantAmexMid();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMidX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantAmexMid();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMidX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantBankAccountNumber(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankAccountNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankAccountNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantBankRoutingNumber(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankRoutingNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankRoutingNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCreateCredentials(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCreateCredentials();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCreateCredentials();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCustomerServiceNumber(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCustomerServiceNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCustomerServiceNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantDiscoverConveyMid(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantDiscoverConveyMid();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantDiscoverConveyMid();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantHardCodeBillingDescriptor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantHardCodeBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptorX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantHardCodeBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptorX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantMaxTransactionAmount(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantMaxTransactionAmount();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantMaxTransactionAmount();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantMerchantCategoryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantCategoryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantCategoryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantMerchantName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantNameX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantNameX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantFirstName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantFirstName__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstName__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantFirstName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstNameX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantFirstName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstName__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantFirstName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstNameX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantLastName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantLastName__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastName__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantLastName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastNameX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantLastName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastName__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantLastName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastNameX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantEmailAddress(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantEmailAddress();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddressX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantEmailAddress();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddressX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantPhone(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhone__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantPhone__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhone__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantPhone();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhoneX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantPhone__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhone__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantPhone();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhoneX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantPspMerchantId(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantPspMerchantId();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantPspMerchantId();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantUrl(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrl__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantUrl__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrl__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantUrl();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrlX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantUrl__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrl__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantUrl();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrlX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchanteCheckBillingDescriptor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptorX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptorX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchanteCheckCompanyName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckCompanyName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckCompanyName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameX__c, false);		
	}
	
	// test for reset status
	static testMethod void testResetStatus(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// check initial values to be false
		System.assertEquals(salesforceLitleMappingController.errorStatus, false);
		System.assertEquals(salesforceLitleMappingController.savingStatus, false);
		
		// set values to true and check setter/getter methods
		salesforceLitleMappingController.errorStatus = true;
		salesforceLitleMappingController.savingStatus = true;
		System.assertEquals(salesforceLitleMappingController.errorStatus, true);
		System.assertEquals(salesforceLitleMappingController.savingStatus, true);
		
		// check resetStatus()
		salesforceLitleMappingController.resetStatus();
		System.assertEquals(salesforceLitleMappingController.errorStatus, false);
		System.assertEquals(salesforceLitleMappingController.savingStatus, false);
	}
	
	static testMethod void testRemoveDisabledText(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// set values in textboxes
		setAllValuesInCustomObjectDefaultTextbox(testString, salesforceLitleMappingController); 
		//check if values are properly set
		assertAllValuesInCustomObjectDefaultTextbox(testString, salesforceLitleMappingController);
		// check if values are unchanged after removeDisabledText method
		salesforceLitleMappingController.removeDisabledText();
		setAllValuesInCustomObjectDefaultTextbox(testString, salesforceLitleMappingController);
		// disable all the textboxes
		setAllValuesInCustomObjectDisabledFlag(true, salesforceLitleMappingController);
		// check if all textbox values are reset
		salesforceLitleMappingController.removeDisabledText();
		assertAllValuesInCustomObjectDefaultTextbox('', salesforceLitleMappingController);
		
	}
	
	static void setAllValuesInCustomObjectDisabledFlag(Boolean flag, SalesforceLitleMappingController salesforceLitleMappingController){
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1X__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2X__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantCityX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantStateProvinceX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantPostalCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantCountryCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantAmexMidX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptorX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantMerchantNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantFirstNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantLastNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantEmailAddressX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantPhoneX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantUrlX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptorX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityTypeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1X__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2X__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityCityX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityStateProvinceX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPostalCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityCountryCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityFirstNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityLastNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityEmailAddressX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityContactPhoneX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityDateOfBirthX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseStateX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntitySsnX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityTaxIdX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPspX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidatedX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPciLevelX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityScanningVendorX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessorX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScanX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityReportOnComplianceX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsX__c = flag;
	}
	
	static void setAllValuesInCustomObjectDefaultTextbox(String stringToSet, SalesforceLitleMappingController salesforceLitleMappingController){
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantCityD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantStateProvinceD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantPostalCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantCountryCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantAmexMidD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantMerchantNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantFirstNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantLastNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantEmailAddressD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantPhoneD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantUrlD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameD__c = stringToSet;
		salesforceLitleMappingController.currentMappings.legalEntityNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityTypeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityCityD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityStateProvinceD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPostalCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityCountryCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityFirstNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityLastNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityEmailAddressD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityContactPhoneD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityDateOfBirthD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseStateD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntitySsnD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityTaxIdD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPspD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidatedD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPciLevelD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityScanningVendorD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessorD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScanD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityReportOnComplianceD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsD__c = stringToSet;  
		
	}
	
	static void assertAllValuesInCustomObjectDefaultTextbox(String stringToCheck, SalesforceLitleMappingController salesforceLitleMappingController){
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1D__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2D__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCityD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvinceD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCodeD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCodeD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMidD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantNameD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstNameD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastNameD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddressD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhoneD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrlD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameD__c, stringToCheck);
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityNameD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTypeD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1D__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2D__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCityD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvinceD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCodeD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCodeD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityFirstNameD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityLastNameD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityEmailAddressD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhoneD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDateOfBirthD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDriversLicenseStateD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntitySsnD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxIdD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsExclusiveToPspD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityIsPciComplianceValidatedD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPciLevelD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityScanningVendorD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityQualifiedSecurityAssessorD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityMostRecentlyPassedScanD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityReportOnComplianceD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeD__c, stringToCheck); 
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsD__c, stringToCheck);  
		
	}
	
	static testMethod void testSaveMappings(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		//List<SalesforceLitleMappingsObject__c> mappingRecords 
    		//	= [select id, name, subMerchantStreetAddress1__c, subMerchantStreetAddress2__c, subMerchantCity__c, subMerchantStateProvince__c, subMerchantPostalCode__c, subMerchantCountryCode__c, subMerchantAmexMid__c, subMerchantBankAccountNumber__c, subMerchantBankRoutingNumber__c, subMerchantCreateCredentials__c, subMerchantCustomerServiceNumber__c, subMerchantDiscoverConveyMid__c, subMerchantHardCodeBillingDescriptor__c, subMerchantMaxTransactionAmount__c, subMerchantMerchantCategoryCode__c, subMerchantMerchantName__c, subMerchantFirstName__c, subMerchantLastName__c, subMerchantEmailAddress__c, subMerchantPhone__c, subMerchantPspMerchantId__c, subMerchantUrl__c, subMerchanteCheckBillingDescriptor__c, subMerchanteCheckCompanyName__c, subMerchantStreetAddress1D__c, subMerchantStreetAddress2D__c, subMerchantCityD__c, subMerchantStateProvinceD__c, subMerchantPostalCodeD__c, subMerchantCountryCodeD__c, subMerchantAmexMidD__c, subMerchantBankAccountNumberD__c, subMerchantBankRoutingNumberD__c, subMerchantCreateCredentialsD__c, subMerchantCustomerServiceNumberD__c, subMerchantDiscoverConveyMidD__c, subMerchantHardCodeBillingDescD__c, subMerchantMaxTransactionAmountD__c, subMerchantMerchantCategoryCodeD__c, subMerchantMerchantNameD__c, subMerchantFirstNameD__c, subMerchantLastNameD__c, subMerchantEmailAddressD__c, subMerchantPhoneD__c, subMerchantPspMerchantIdD__c, subMerchantUrlD__c, subMerchanteCheckBillingDescD__c, subMerchanteCheckCompanyNameD__c, subMerchantStreetAddress1X__c, subMerchantStreetAddress2X__c, subMerchantCityX__c, subMerchantStateProvinceX__c, subMerchantPostalCodeX__c, subMerchantCountryCodeX__c, subMerchantAmexMidX__c, subMerchantBankAccountNumberX__c, subMerchantBankRoutingNumberX__c, subMerchantCreateCredentialsX__c, subMerchantCustomerServiceNumberX__c, subMerchantDiscoverConveyMidX__c, subMerchantHardCodeBillingDescriptorX__c, subMerchantMaxTransactionAmountX__c, subMerchantMerchantCategoryCodeX__c, subMerchantMerchantNameX__c, subMerchantFirstNameX__c, subMerchantLastNameX__c, subMerchantEmailAddressX__c, subMerchantPhoneX__c, subMerchantPspMerchantIdX__c, subMerchantUrlX__c, subMerchanteCheckBillingDescriptorX__c, subMerchanteCheckCompanyNameX__c, legalEntityName__c, legalEntityType__c, legalEntityStreetAddress1__c, legalEntityStreetAddress2__c, legalEntityCity__c, legalEntityStateProvince__c, legalEntityPostalCode__c, legalEntityCountryCode__c, legalEntityFirstName__c, legalEntityLastName__c, legalEntityEmailAddress__c, legalEntityContactPhone__c, legalEntityDateOfBirth__c, legalEntityDriversLicense__c, legalEntityDriversLicenseState__c, legalEntitySsn__c, legalEntityTaxId__c, legalEntityIsExclusiveToPsp__c, legalEntityIsPciComplianceValidated__c, legalEntityPciLevel__c, legalEntityScanningVendor__c, legalEntityQualifiedSecurityAssessor__c, legalEntityMostRecentlyPassedScan__c, legalEntityReportOnCompliance__c, legalEntityAnnualCreditCardSalesVolume__c, legalEntityHasAcceptedCreditCards__c, legalEntityNameD__c, legalEntityTypeD__c, legalEntityStreetAddress1D__c, legalEntityStreetAddress2D__c, legalEntityCityD__c, legalEntityStateProvinceD__c, legalEntityPostalCodeD__c, legalEntityCountryCodeD__c, legalEntityFirstNameD__c, legalEntityLastNameD__c, legalEntityEmailAddressD__c, legalEntityContactPhoneD__c, legalEntityDateOfBirthD__c, legalEntityDriversLicenseD__c, legalEntityDriversLicenseStateD__c, legalEntitySsnD__c, legalEntityTaxIdD__c, legalEntityIsExclusiveToPspD__c, legalEntityIsPciComplianceValidatedD__c, legalEntityPciLevelD__c, legalEntityScanningVendorD__c, legalEntityQualifiedSecurityAssessorD__c, legalEntityMostRecentlyPassedScanD__c, legalEntityReportOnComplianceD__c, legalEntityAnnualCreditCardSalesVolumeD__c, legalEntityHasAcceptedCreditCardsD__c, legalEntityNameX__c, legalEntityTypeX__c, legalEntityStreetAddress1X__c, legalEntityStreetAddress2X__c, legalEntityCityX__c, legalEntityStateProvinceX__c, legalEntityPostalCodeX__c, legalEntityCountryCodeX__c, legalEntityFirstNameX__c, legalEntityLastNameX__c, legalEntityEmailAddressX__c, legalEntityContactPhoneX__c, legalEntityDateOfBirthX__c, legalEntityDriversLicenseX__c, legalEntityDriversLicenseStateX__c, legalEntitySsnX__c, legalEntityTaxIdX__c, legalEntityIsExclusiveToPspX__c, legalEntityIsPciComplianceValidatedX__c, legalEntityPciLevelX__c, legalEntityScanningVendorX__c, legalEntityQualifiedSecurityAssessorX__c, legalEntityMostRecentlyPassedScanX__c, legalEntityReportOnComplianceX__c, legalEntityAnnualCreditCardSalesVolumeX__c, legalEntityHasAcceptedCreditCardsX__c  from SalesforceLitleMappingsObject__c limit 1];
    	
	 	//salesforceLitleMappingController.currentMappings = null;
	 	try{
	 		//salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c = 'hello';
			salesforceLitleMappingController.saveMappings();
	 	}catch(DMLException e){
	 		System.assertEquals(true, salesforceLitleMappingController.errorStatus);
	 	}
	}
	
	static testMethod void testCancelMappings(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		salesforceLitleMappingController.cancelMappings();
		//Apexpages.currentPage().
	}
	
	static testMethod void testCancelMappingsPageRedirect(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		apexpages.currentpage().getparameters().put('id' , testString);
		salesforceLitleMappingController.cancelMappings();
		//Apexpages.currentPage().
	}
	
	static testMethod void testSaveMappingsPageRedirect(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		apexpages.currentpage().getparameters().put('id' , testString);
		salesforceLitleMappingController.saveMappings();
		//Apexpages.currentPage().
	}     
}