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

	//Test the Legal Entity Name
    static testMethod void testLegalEntityName(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityName is null initially
        System.assertEquals(legalEntityModel.getLegalEntityName(), null);
        String legalEntityName = 'Test Name';
        legalEntityModel.setLegalEntityName(legalEntityName);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityName(), legalEntityName);
    }
    
    static testMethod void testLegalEntityType(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityType is null initially
        System.assertEquals(legalEntityModel.getLegalEntityType(), null);
        String legalEntityType = 'Test Type';
        legalEntityModel.setLegalEntityType(legalEntityType);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityType(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityType(), legalEntityType);
    }
    
    static testMethod void testLegalEntityStreetAddress1(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress1(), null);
        String legalEntityStreetAddress1 = 'TestAdd1';
        legalEntityModel.setLegalEntityStreetAddress1(legalEntityStreetAddress1);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityStreetAddress1(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress1(), legalEntityStreetAddress1);
    }
    
    static testMethod void testLegalEntityStreetAddress2(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress2(), null);
        String legalEntityStreetAddress2 = 'TestAdd2';
        legalEntityModel.setLegalEntityStreetAddress2(legalEntityStreetAddress2);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityStreetAddress2(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityStreetAddress2(), legalEntityStreetAddress2);
    }
    
    static testMethod void testLegalEntityCity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityCity(), null);
        String legalEntityCity = 'TestCity';
        legalEntityModel.setLegalEntityCity(legalEntityCity);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityCity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityCity(), legalEntityCity);
    }
    
    static testMethod void testLegalEntityStateProvince(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityStateProvince(), null);
        String legalEntityStateProvince = 'Test Name';
        legalEntityModel.setLegalEntityStateProvince(legalEntityStateProvince);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityStateProvince(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityStateProvince(), legalEntityStateProvince);
    }
    
    static testMethod void testLegalEntityPostalCode(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityPostalCode(), null);
        String legalEntityPostalCode = 'Test Name';
        legalEntityModel.setLegalEntityPostalCode(legalEntityPostalCode);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityPostalCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityPostalCode(), legalEntityPostalCode);
    }
    
    static testMethod void testLegalEntityCountryCode(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityCountryCode(), null);
        String legalEntityCountryCode = 'Test Name';
        legalEntityModel.setLegalEntityCountryCode(legalEntityCountryCode);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityCountryCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityCountryCode(), legalEntityCountryCode);
    }
    
    static testMethod void testLegalEntityFirstName(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityFirstName(), null);
        String legalEntityFirstName = 'Test Name';
        legalEntityModel.setLegalEntityFirstName(legalEntityFirstName);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityFirstName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityFirstName(), legalEntityFirstName);
    }
    
    static testMethod void testLegalEntityLastName(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityLastName(), null);
        String legalEntityLastName = 'Test Name';
        legalEntityModel.setLegalEntityLastName(legalEntityLastName);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityLastName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityLastName(), legalEntityLastName);
    }
    
    static testMethod void testLegalEntityEmailAddress(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityEmailAddress(), null);
        String legalEntityEmailAddress = 'Test Name';
        legalEntityModel.setLegalEntityEmailAddress(legalEntityEmailAddress);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityEmailAddress(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityEmailAddress(), legalEntityEmailAddress);
    }
    
    static testMethod void testLegalEntityContactPhone(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityContactPhone(), null);
        String legalEntityContactPhone = 'Test Name';
        legalEntityModel.setLegalEntityContactPhone(legalEntityContactPhone);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityContactPhone(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityContactPhone(), legalEntityContactPhone);
    }
    
    static testMethod void testLegalEntityDateOfBirth(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDateOfBirth(), null);
        String legalEntityDateOfBirth = 'Test Name';
        legalEntityModel.setLegalEntityDateOfBirth(legalEntityDateOfBirth);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDateOfBirth(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDateOfBirth(), legalEntityDateOfBirth);
    }
    
    static testMethod void testLegalEntityDriversLicense(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicense(), null);
        String legalEntityDriversLicense = 'Test Name';
        legalEntityModel.setLegalEntityDriversLicense(legalEntityDriversLicense);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDriversLicense(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicense(), legalEntityDriversLicense);
    }
    
    static testMethod void testLegalEntityDriversLicenseState(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicenseState(), null);
        String legalEntityDriversLicenseState = 'Test Name';
        legalEntityModel.setLegalEntityDriversLicenseState(legalEntityDriversLicenseState);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDriversLicenseState(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDriversLicenseState(), legalEntityDriversLicenseState);
    }
    
    static testMethod void testLegalEntitySsn(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntitySsn(), null);
        String legalEntitySsn = 'Test Name';
        legalEntityModel.setLegalEntitySsn(legalEntitySsn);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntitySsn(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntitySsn(), legalEntitySsn);
    }
    
    static testMethod void testLegalEntityTaxId(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityTaxId(), null);
        String legalEntityTaxId = 'Test Name';
        legalEntityModel.setLegalEntityTaxId(legalEntityTaxId);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityTaxId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityTaxId(), legalEntityTaxId);
    }
    
    static testMethod void testLegalEntityIsExclusiveToPsp(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityIsExclusiveToPsp(), null);
        String legalEntityIsExclusiveToPsp = 'Test Name';
        legalEntityModel.setLegalEntityIsExclusiveToPsp(legalEntityIsExclusiveToPsp);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityIsExclusiveToPsp(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityIsExclusiveToPsp(), legalEntityIsExclusiveToPsp);
    }
    
    static testMethod void testLegalEntityIsPciComplianceValidated(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityIsPciComplianceValidated(), null);
        String legalEntityIsPciComplianceValidated = 'Test Name';
        legalEntityModel.setLegalEntityIsPciComplianceValidated(legalEntityIsPciComplianceValidated);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityIsPciComplianceValidated(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityIsPciComplianceValidated(), legalEntityIsPciComplianceValidated);
    }
    
    static testMethod void testLegalEntityPciLevel(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityPciLevel(), null);
        String legalEntityPciLevel = 'Test Name';
        legalEntityModel.setLegalEntityPciLevel(legalEntityPciLevel);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityPciLevel(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityPciLevel(), legalEntityPciLevel);
    }
    
    static testMethod void testLegalEntityScanningVendor(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityScanningVendor(), null);
        String legalEntityScanningVendor = 'Test Name';
        legalEntityModel.setLegalEntityScanningVendor(legalEntityScanningVendor);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityScanningVendor(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityScanningVendor(), legalEntityScanningVendor);
    }
    
    static testMethod void testLegalEntityQualifiedSecurityAssessor(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityQualifiedSecurityAssessor(), null);
        String legalEntityQualifiedSecurityAssessor = 'Test Name';
        legalEntityModel.setLegalEntityQualifiedSecurityAssessor(legalEntityQualifiedSecurityAssessor);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityQualifiedSecurityAssessor(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityQualifiedSecurityAssessor(), legalEntityQualifiedSecurityAssessor);
    }
    
    static testMethod void testLegalEntityMostRecentlyPassedScan(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityMostRecentlyPassedScan(), null);
        String legalEntityMostRecentlyPassedScan = 'Test Name';
        legalEntityModel.setLegalEntityMostRecentlyPassedScan(legalEntityMostRecentlyPassedScan);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityMostRecentlyPassedScan(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityMostRecentlyPassedScan(), legalEntityMostRecentlyPassedScan);
    }
    
    static testMethod void testLegalEntityReportOnCompliance(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityReportOnCompliance(), null);
        String legalEntityReportOnCompliance = 'Test Name';
        legalEntityModel.setLegalEntityReportOnCompliance(legalEntityReportOnCompliance);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityReportOnCompliance(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityReportOnCompliance(), legalEntityReportOnCompliance);
    }
    
    static testMethod void testLegalEntityAnnualCreditCardSalesVolume(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), null);
        String legalEntityAnnualCreditCardSalesVolume = 'Test Name';
        legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(legalEntityAnnualCreditCardSalesVolume);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), legalEntityAnnualCreditCardSalesVolume);
    }
    
    static testMethod void testLegalEntityHasAcceptedCreditCards(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCards(), null);
        String legalEntityHasAcceptedCreditCards = 'Test Name';
        legalEntityModel.setLegalEntityHasAcceptedCreditCards(legalEntityHasAcceptedCreditCards);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCards(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCards(), legalEntityHasAcceptedCreditCards);
    }
    
}