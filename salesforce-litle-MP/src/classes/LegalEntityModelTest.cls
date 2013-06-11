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
private class LegalEntityModelTest {
	
	public static final String testString = 'test';

	//Test the Legal Entity Name
    static testMethod void testLegalEntityName(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityName is null initially
        System.assertEquals(legalEntityModel.getLegalEntityName(), null);
        legalEntityModel.setLegalEntityName(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityName(), testString);
    }
    
    static testMethod void testLegalEntityType(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityType is null initially
        System.assertEquals(legalEntityModel.getLegalEntityType(), null);
        legalEntityModel.setLegalEntityType(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityType(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityType(), testString);
    }
    
    
    static testMethod void testLegalEntityDoingBusinessAs(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityType is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDoingBusinessAs(), null);
        legalEntityModel.setLegalEntityDoingBusinessAs(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDoingBusinessAs(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDoingBusinessAs(), testString);
    }
    static testMethod void testLegalEntityStreetAddress1(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress1(), null);
        legalEntityModel.setLegalEntityStreetAddress1(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityStreetAddress1(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress1(), testString);
    }
    
    static testMethod void testLegalEntityStreetAddress2(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress2(), null);
        legalEntityModel.setLegalEntityStreetAddress2(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityStreetAddress2(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress2(), testString);
    }
    
    static testMethod void testLegalEntityCity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityCity(), null);
        legalEntityModel.setLegalEntityCity(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityCity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityCity(), testString);
    }
    
    static testMethod void testLegalEntityStateProvince(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityStateProvince(), null);
        legalEntityModel.setLegalEntityStateProvince(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityStateProvince(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityStateProvince(), testString);
    }
    
    static testMethod void testLegalEntityPostalCode(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityPostalCode(), null);
        legalEntityModel.setLegalEntityPostalCode(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityPostalCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityPostalCode(), testString);
    }
    
    static testMethod void testLegalEntityCountryCode(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityCountryCode(), null);
        legalEntityModel.setLegalEntityCountryCode(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityCountryCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityCountryCode(), testString);
    }
    
    static testMethod void testLegalEntityFirstName(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityFirstName(), null);
        legalEntityModel.setLegalEntityFirstName(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityFirstName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityFirstName(), testString);
    }
    
    static testMethod void testLegalEntityLastName(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityLastName(), null);
        legalEntityModel.setLegalEntityLastName(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityLastName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityLastName(), testString);
    }
    
    static testMethod void testLegalEntityEmailAddress(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityEmailAddress(), null);
        legalEntityModel.setLegalEntityEmailAddress(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityEmailAddress(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityEmailAddress(), testString);
    }
    
    static testMethod void testLegalEntityContactPhone(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityContactPhone(), null);
        legalEntityModel.setLegalEntityContactPhone(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityContactPhone(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityContactPhone(), testString);
    }
    
    static testMethod void testLegalEntityDateOfBirth(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDateOfBirth(), null);
        legalEntityModel.setLegalEntityDateOfBirth(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDateOfBirth(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDateOfBirth(), testString);
    }
    
    static testMethod void testLegalEntityDriversLicense(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicense(), null);
        legalEntityModel.setLegalEntityDriversLicense(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDriversLicense(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicense(), testString);
    }
    
    static testMethod void testLegalEntityDriversLicenseState(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicenseState(), null);
        legalEntityModel.setLegalEntityDriversLicenseState(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDriversLicenseState(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicenseState(), testString);
    }
    
    static testMethod void testLegalEntitySsn(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntitySsn(), null);
        legalEntityModel.setLegalEntitySsn(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntitySsn(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntitySsn(), testString);
    }
    
    static testMethod void testLegalEntityTaxId(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityTaxId(), null);
        legalEntityModel.setLegalEntityTaxId(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityTaxId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityTaxId(), testString);
    }
    
    static testMethod void testLegalEntityIsExclusiveToPsp(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityIsExclusiveToPsp(), null);
        legalEntityModel.setLegalEntityIsExclusiveToPsp(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityIsExclusiveToPsp(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityIsExclusiveToPsp(), testString);
    }
    
    static testMethod void testLegalEntityIsPciComplianceValidated(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityIsPciComplianceValidated(), null);
        legalEntityModel.setLegalEntityIsPciComplianceValidated(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityIsPciComplianceValidated(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityIsPciComplianceValidated(), testString);
    }
    
    static testMethod void testLegalEntityPciLevel(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityPciLevel(), null);
        legalEntityModel.setLegalEntityPciLevel(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityPciLevel(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityPciLevel(), testString);
    }
    
    static testMethod void testLegalEntityScanningVendor(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityScanningVendor(), null);
        legalEntityModel.setLegalEntityScanningVendor(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityScanningVendor(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityScanningVendor(), testString);
    }
    
    static testMethod void testLegalEntityQualifiedSecurityAssessor(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityQualifiedSecurityAssessor(), null);
        legalEntityModel.setLegalEntityQualifiedSecurityAssessor(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityQualifiedSecurityAssessor(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityQualifiedSecurityAssessor(), testString);
    }
    
    static testMethod void testLegalEntityMostRecentlyPassedScan(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityMostRecentlyPassedScan(), null);
        legalEntityModel.setLegalEntityMostRecentlyPassedScan(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityMostRecentlyPassedScan(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityMostRecentlyPassedScan(), testString);
    }
    
    static testMethod void testLegalEntityReportOnCompliance(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityReportOnCompliance(), null);
        legalEntityModel.setLegalEntityReportOnCompliance(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityReportOnCompliance(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityReportOnCompliance(), testString);
    }
    
    static testMethod void testLegalEntityAnnualCreditCardSalesVolume(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), null);
        legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), testString);
    }
    
    static testMethod void testLegalEntityHasAcceptedCreditCards(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCards(), null);
        legalEntityModel.setLegalEntityHasAcceptedCreditCards(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCards(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCards(), testString);
    }
    
    
    
    
    /*
        static testMethod void testLegalEntityNameDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityName is null initially
        System.assertEquals(legalEntityModel.getLegalEntityNameDefault(), null);
        legalEntityModel.setLegalEntityNameDefault(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityNameDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityNameDefault(), testString);
    }
    
    static testMethod void testLegalEntityTypeDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityType is null initially
        System.assertEquals(legalEntityModel.getLegalEntityTypeDefault(), null);
        legalEntityModel.setLegalEntityTypeDefault(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityTypeDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityTypeDefault(), testString);
    }
    
    static testMethod void testLegalEntityStreetAddress1Default(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress1Default(), null);
        legalEntityModel.setLegalEntityStreetAddress1Default(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityStreetAddress1Default(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress1Default(), testString);
    }
    
    static testMethod void testLegalEntityStreetAddress2Default(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress2Default(), null);
        legalEntityModel.setLegalEntityStreetAddress2Default(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityStreetAddress2Default(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress2Default(), testString);
    }
    
    static testMethod void testLegalEntityCityDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityCityDefault(), null);
        legalEntityModel.setLegalEntityCityDefault(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityCityDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityCityDefault(), testString);
    }
    
    static testMethod void testLegalEntityStateProvinceDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityStateProvinceDefault(), null);
        legalEntityModel.setLegalEntityStateProvinceDefault(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityStateProvinceDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityStateProvinceDefault(), testString);
    }
    
    static testMethod void testLegalEntityPostalCodeDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityPostalCodeDefault(), null);
        legalEntityModel.setLegalEntityPostalCodeDefault(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityPostalCodeDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityPostalCodeDefault(), testString);
    }
    
    static testMethod void testLegalEntityCountryCodeDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityCountryCodeDefault(), null);
        legalEntityModel.setLegalEntityCountryCodeDefault(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityCountryCodeDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityCountryCodeDefault(), testString);
    }
    
    static testMethod void testLegalEntityFirstNameDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityFirstNameDefault(), null);
        legalEntityModel.setLegalEntityFirstNameDefault(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityFirstNameDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityFirstNameDefault(), testString);
    }
    
    static testMethod void testLegalEntityLastNameDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityLastNameDefault(), null);
        legalEntityModel.setLegalEntityLastNameDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityLastNameDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityLastNameDefault(), testString);
    }
    
    static testMethod void testLegalEntityEmailAddressDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityEmailAddressDefault(), null);
        legalEntityModel.setLegalEntityEmailAddressDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityEmailAddressDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityEmailAddressDefault(), testString);
    }
    
    static testMethod void testLegalEntityContactPhoneDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityContactPhoneDefault(), null);
        legalEntityModel.setLegalEntityContactPhoneDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityContactPhoneDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityContactPhoneDefault(), testString);
    }
    
    static testMethod void testLegalEntityDateOfBirthDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDateOfBirthDefault(), null);
        legalEntityModel.setLegalEntityDateOfBirthDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDateOfBirthDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDateOfBirthDefault(), testString);
    }
    
    static testMethod void testLegalEntityDriversLicenseDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicenseDefault(), null);
        legalEntityModel.setLegalEntityDriversLicenseDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDriversLicenseDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicenseDefault(), testString);
    }
    
    static testMethod void testLegalEntityDriversLicenseStateDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicenseStateDefault(), null);
        legalEntityModel.setLegalEntityDriversLicenseStateDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDriversLicenseStateDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicenseStateDefault(), testString);
    }
    
    static testMethod void testLegalEntitySsnDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntitySsnDefault(), null);
        legalEntityModel.setLegalEntitySsnDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntitySsnDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntitySsnDefault(), testString);
    }
    
    static testMethod void testLegalEntityTaxIdDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityTaxIdDefault(), null);
        legalEntityModel.setLegalEntityTaxIdDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityTaxIdDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityTaxIdDefault(), testString);
    }
    
    static testMethod void testLegalEntityIsExclusiveToPspDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityIsExclusiveToPspDefault(), null);
        legalEntityModel.setLegalEntityIsExclusiveToPspDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityIsExclusiveToPspDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityIsExclusiveToPspDefault(), testString);
    }
    
    static testMethod void testLegalEntityIsPciComplianceValidatedDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityIsPciComplianceValidatedDefault(), null);
        legalEntityModel.setLegalEntityIsPciComplianceValidatedDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityIsPciComplianceValidatedDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityIsPciComplianceValidatedDefault(), testString);
    }
    
    static testMethod void testLegalEntityPciLevelDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityPciLevelDefault(), null);
        legalEntityModel.setLegalEntityPciLevelDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityPciLevelDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityPciLevelDefault(), testString);
    }
    
    static testMethod void testLegalEntityScanningVendorDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityScanningVendorDefault(), null);
        legalEntityModel.setLegalEntityScanningVendorDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityScanningVendorDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityScanningVendorDefault(), testString);
    }
    
    static testMethod void testLegalEntityQualifiedSecurityAssessorDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityQualifiedSecurityAssessorDefault(), null);
        legalEntityModel.setLegalEntityQualifiedSecurityAssessorDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityQualifiedSecurityAssessorDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityQualifiedSecurityAssessorDefault(), testString);
    }
    
    static testMethod void testLegalEntityMostRecentlyPassedScanDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityMostRecentlyPassedScanDefault(), null);
        legalEntityModel.setLegalEntityMostRecentlyPassedScanDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityMostRecentlyPassedScanDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityMostRecentlyPassedScanDefault(), testString);
    }
    
    static testMethod void testLegalEntityReportOnComplianceDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityReportOnComplianceDefault(), null);
        legalEntityModel.setLegalEntityReportOnComplianceDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityReportOnComplianceDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityReportOnComplianceDefault(), testString);
    }
    
    static testMethod void testLegalEntityAnnualCreditCardSalesVolumeDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolumeDefault(), null);
        legalEntityModel.setLegalEntityAnnualCreditCardSalesVolumeDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolumeDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolumeDefault(), testString);
    }
    
    static testMethod void testLegalEntityHasAcceptedCreditCardsDefault(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCardsDefault(), null);
        legalEntityModel.setLegalEntityHasAcceptedCreditCardsDefault(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCardsDefault(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCardsDefault(), testString);
    }*/
}