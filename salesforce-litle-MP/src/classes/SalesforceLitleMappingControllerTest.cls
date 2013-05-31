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
    static testMethod void testLegalEntityModel() {
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
        subMerchantModel.setSubMerchantAmexMid(testString);
        salesforceLitleMappingController.setSubMerchantModel(subMerchantModel);
        System.assertNotEquals(salesforceLitleMappingController.getSubMerchantModel(), null);
        System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantAmexMid(), testString);
    }
    
    // Test salesforce fields
    static testMethod void testSalesforceFields() {
        SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
        System.assert(salesforceLitleMappingController.getSalesforceFields().size()!= 0);
    }

	static testMethod void testOnSelectChangeLegalEntityName(){
	 	SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityName(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityName(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityName();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityNameDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityName(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityName(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityName();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityNameDefaultDisabled(), false);
	 }
	 
	 
	 static testMethod void testOnSelectChangeLegalEntityType(){
	 	SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityType(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityType(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityType();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityTypeDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityType(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityType(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityType();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityTypeDefaultDisabled(), false);
	 	
	}
	
	
	static testMethod void testOnSelectChangeLegalEntityStreetAddress1(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityStreetAddress1(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityStreetAddress1(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress1();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityStreetAddress1DefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityStreetAddress1(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityStreetAddress1(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityStreetAddress1DefaultDisabled(), false);
		 
	}
	
	
	static testMethod void testOnSelectChangeLegalEntityStreetAddress2(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityStreetAddress2(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityStreetAddress2(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress2();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityStreetAddress2DefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityStreetAddress2(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityStreetAddress2(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityStreetAddress2DefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityCity(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityCity(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityCity(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityCity();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityCityDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityCity(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityCity(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityCity();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityCityDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityStateProvince(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityStateProvince(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityStateProvince(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityStateProvince();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityStateProvinceDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityStateProvince(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityStateProvince(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityStateProvince();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityStateProvinceDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPostalCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityPostalCode(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityPostalCode(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPostalCode();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityPostalCodeDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityPostalCode(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityPostalCode(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPostalCode();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityPostalCodeDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityCountryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityCountryCode(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityCountryCode(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityCountryCode();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityCountryCodeDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityCountryCode(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityCountryCode(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityCountryCode();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityCountryCodeDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityFirstFirstFirstName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityFirstName(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityFirstName(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityFirstName();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityFirstNameDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityFirstName(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityFirstName(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityFirstName();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityFirstNameDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityLastLastLastName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityLastName(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityLastName(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityLastName();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityLastNameDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityLastName(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityLastName(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityLastName();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityLastNameDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityEmailAddress(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityEmailAddress(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityEmailAddress(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityEmailAddress();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityEmailAddressDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityEmailAddress(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityEmailAddress(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityEmailAddress();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityEmailAddressDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityContactPhone(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityContactPhone(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityContactPhone(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityContactPhone();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityContactPhoneDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityContactPhone(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityContactPhone(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityContactPhone();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityContactPhoneDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityDateOfBirth(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityDateOfBirth(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityDateOfBirth(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityDateOfBirth();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityDateOfBirthDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityDateOfBirth(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityDateOfBirth(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityDateOfBirth();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityDateOfBirthDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityDriversLicense(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityDriversLicense(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityDriversLicense(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityDriversLicense();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityDriversLicenseDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityDriversLicense(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityDriversLicense(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityDriversLicense();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityDriversLicenseDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityDriversLicenseState(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityDriversLicenseState(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityDriversLicenseState(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityDriversLicenseState();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityDriversLicenseStateDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityDriversLicenseState(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityDriversLicenseState(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityDriversLicenseState();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityDriversLicenseStateDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntitySsn(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntitySsn(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntitySsn(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntitySsn();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntitySsnDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntitySsn(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntitySsn(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntitySsn();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntitySsnDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityTaxId(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityTaxId(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityTaxId(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityTaxId();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityTaxIdDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityTaxId(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityTaxId(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityTaxId();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityTaxIdDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityIsExclusiveToPsp(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityIsExclusiveToPsp(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityIsExclusiveToPsp(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityIsExclusiveToPsp();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityIsExclusiveToPspDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityIsExclusiveToPsp(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityIsExclusiveToPsp(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityIsExclusiveToPsp();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityIsExclusiveToPspDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityIsPciComplianceValidated(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityIsPciComplianceValidated(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityIsPciComplianceValidated(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityIsPciComplianceValidated();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityIsPciComplianceValidatedDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityIsPciComplianceValidated(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityIsPciComplianceValidated(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityIsPciComplianceValidated();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityIsPciComplianceValidatedDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPciLevel(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityPciLevel(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityPciLevel(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPciLevel();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityPciLevelDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityPciLevel(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityPciLevel(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPciLevel();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityPciLevelDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityScanningVendor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityScanningVendor(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityScanningVendor(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityScanningVendor();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityScanningVendorDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityScanningVendor(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityScanningVendor(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityScanningVendor();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityScanningVendorDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityQualifiedSecurityAssessor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityQualifiedSecurityAssessor(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityQualifiedSecurityAssessor(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityQualifiedSecurityAssessor();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityQualifiedSecurityAssessorDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityQualifiedSecurityAssessor(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityQualifiedSecurityAssessor(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityQualifiedSecurityAssessor();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityQualifiedSecurityAssessorDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityMostRecentlyPassedScan(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityMostRecentlyPassedScan(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityMostRecentlyPassedScan(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityMostRecentlyPassedScan();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityMostRecentlyPassedScanDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityMostRecentlyPassedScan(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityMostRecentlyPassedScan(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityMostRecentlyPassedScan();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityMostRecentlyPassedScanDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityReportOnCompliance(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityReportOnCompliance(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityReportOnCompliance(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityReportOnCompliance();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityReportOnComplianceDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityReportOnCompliance(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityReportOnCompliance(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityReportOnCompliance();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityReportOnComplianceDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityAnnualCreditCardSalesVolume(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityAnnualCreditCardSalesVolume(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityAnnualCreditCardSalesVolume(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityAnnualCreditCardSalesVolume();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityAnnualCreditCardSalesVolumeDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityAnnualCreditCardSalesVolume(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityAnnualCreditCardSalesVolume(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityAnnualCreditCardSalesVolume();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityAnnualCreditCardSalesVolumeDefaultDisabled(), false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityHasAcceptedCreditCards(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.getLegalEntityModel().setLegalEntityHasAcceptedCreditCards(testString);
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityHasAcceptedCreditCards(), testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityHasAcceptedCreditCards();
	 	System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityHasAcceptedCreditCardsDefaultDisabled(), true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.getLegalEntityModel().setLegalEntityHasAcceptedCreditCards(null);
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getLegalEntityHasAcceptedCreditCards(), null);
		salesforceLitleMappingController.onSelectChangeLegalEntityHasAcceptedCreditCards();
		System.assertEquals(salesforceLitleMappingController.getLegalEntityModel().getIsLegalEntityHasAcceptedCreditCardsDefaultDisabled(), false);
	 }
	
	
	//Sub merchant on change listeners
	static testMethod void testOnSelectChangeSubMerchantStreetAddress1(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantStreetAddress1(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantStreetAddress1(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantStreetAddress1DefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantStreetAddress1(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantStreetAddress1(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantStreetAddress1DefaultDisabled(), false);		
	}
	
	
	static testMethod void testOnSelectChangeSubMerchantStreetAddress2(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantStreetAddress2(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantStreetAddress2(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantStreetAddress2DefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantStreetAddress2(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantStreetAddress2(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantStreetAddress2DefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCity(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantCity(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantCity(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCity();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantCityDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantCity(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantCity(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCity();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantCityDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantStateProvince(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantStateProvince(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantStateProvince(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantStateProvince();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantStateProvinceDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantStateProvince(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantStateProvince(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantStateProvince();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantStateProvinceDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantPostalCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantPostalCode(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantPostalCode(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantPostalCode();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantPostalCodeDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantPostalCode(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantPostalCode(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantPostalCode();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantPostalCodeDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCountryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantCountryCode(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantCountryCode(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCountryCode();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantCountryCodeDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantCountryCode(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantCountryCode(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCountryCode();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantCountryCodeDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantAmexMid(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantAmexMid(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantAmexMid(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantAmexMid();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantAmexMidDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantAmexMid(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantAmexMid(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantAmexMid();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantAmexMidDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantBankAccountNumber(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantBankAccountNumber(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantBankAccountNumber(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankAccountNumber();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantBankAccountNumberDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantBankAccountNumber(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantBankAccountNumber(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankAccountNumber();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantBankAccountNumberDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantBankRoutingNumber(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantBankRoutingNumber(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantBankRoutingNumber(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankRoutingNumber();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantBankRoutingNumberDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantBankRoutingNumber(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantBankRoutingNumber(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankRoutingNumber();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantBankRoutingNumberDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCreateCredentials(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantCreateCredentials(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantCreateCredentials(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCreateCredentials();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantCreateCredentialsDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantCreateCredentials(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantCreateCredentials(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCreateCredentials();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantCreateCredentialsDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCustomerServiceNumber(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantCustomerServiceNumber(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantCustomerServiceNumber(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCustomerServiceNumber();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantCustomerServiceNumberDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantCustomerServiceNumber(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantCustomerServiceNumber(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCustomerServiceNumber();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantCustomerServiceNumberDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantDiscoverConveyMid(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantDiscoverConveyMid(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantDiscoverConveyMid(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantDiscoverConveyMid();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantDiscoverConveyMidDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantDiscoverConveyMid(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantDiscoverConveyMid(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantDiscoverConveyMid();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantDiscoverConveyMidDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantHardCodeBillingDescriptor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantHardCodeBillingDescriptor(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantHardCodeBillingDescriptor(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantHardCodeBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantHardCodeBillingDescriptorDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantHardCodeBillingDescriptor(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantHardCodeBillingDescriptor(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantHardCodeBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantHardCodeBillingDescriptorDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantMaxTransactionAmount(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantMaxTransactionAmount(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantMaxTransactionAmount(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantMaxTransactionAmount();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantMaxTransactionAmountDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantMaxTransactionAmount(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantMaxTransactionAmount(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantMaxTransactionAmount();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantMaxTransactionAmountDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantMerchantCategoryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantMerchantCategoryCode(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantMerchantCategoryCode(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantCategoryCode();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantMerchantCategoryCodeDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantMerchantCategoryCode(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantMerchantCategoryCode(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantCategoryCode();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantMerchantCategoryCodeDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantMerchantName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantMerchantName(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantMerchantName(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantName();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantMerchantNameDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantMerchantName(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantMerchantName(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantName();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantMerchantNameDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantFirstName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantFirstName(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantFirstName(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantFirstName();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantFirstNameDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantFirstName(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantFirstName(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantFirstName();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantFirstNameDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantLastName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantLastName(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantLastName(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantLastName();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantLastNameDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantLastName(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantLastName(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantLastName();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantLastNameDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantEmailAddress(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantEmailAddress(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantEmailAddress(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantEmailAddress();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantEmailAddressDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantEmailAddress(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantEmailAddress(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantEmailAddress();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantEmailAddressDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantPhone(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantPhone(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantPhone(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantPhone();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantPhoneDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantPhone(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantPhone(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantPhone();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantPhoneDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantPspMerchantId(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantPspMerchantId(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantPspMerchantId(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantPspMerchantId();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantPspMerchantIdDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantPspMerchantId(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantPspMerchantId(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantPspMerchantId();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantPspMerchantIdDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantUrl(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantUrl(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantUrl(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantUrl();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantUrlDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchantUrl(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchantUrl(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchantUrl();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchantUrlDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchanteCheckBillingDescriptor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchanteCheckBillingDescriptor(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchanteCheckBillingDescriptor(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchanteCheckBillingDescriptorDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchanteCheckBillingDescriptor(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchanteCheckBillingDescriptor(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchanteCheckBillingDescriptorDefaultDisabled(), false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchanteCheckCompanyName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		// test if textbox is disabled when something is selected in the select options
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchanteCheckCompanyName(testString);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchanteCheckCompanyName(), testString);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckCompanyName();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchanteCheckCompanyNameDefaultDisabled(), true);
		salesforceLitleMappingController.getSubMerchantModel().setSubMerchanteCheckCompanyName(null);
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getSubMerchanteCheckCompanyName(), null);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckCompanyName();
		System.assertEquals(salesforceLitleMappingController.getSubMerchantModel().getIsSubMerchanteCheckCompanyNameDefaultDisabled(), false);		
	}
	
	static testMethod void testSaveMappings(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		salesforceLitleMappingController.saveMappings();
	}
	
	     
}