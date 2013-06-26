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
    
    static testMethod void testLegalEntityAddress(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	Address address = new Address();
    	address.setStreetaddress1(testString);
    	address.setStreetAddress2(testString);
    	address.setCity(testString);
    	address.setStateProvince(testString);
    	address.setPostalCode(testString);
    	address.setCountryCode(testString);
        // Check if the LegalEntityType is null initially
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getStreetAddress1(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getStreetAddress2(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getCity(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getStateProvince(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getPostalCode(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getCountryCode(), null);
        legalEntityModel.setLegalEntityAddress(address);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityAddress(), null);
        // and then confirm if the value is set correctly
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
    
    static testMethod void testLegalEntityPrincipal(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	Address address = new Address();
    	address.setStreetaddress1(testString);
    	address.setStreetAddress2(testString);
    	address.setCity(testString);
    	address.setStateProvince(testString);
    	address.setPostalCode(testString);
    	address.setCountryCode(testString);
        // Check if the LegalEntityType is null initially
        //System.assertEquals(legalEntityModel.getLegalEntityPrincipal(), null);
        Principal principal = new Principal();
        principal.setAddress(address);
        principal.setFirstName(testString);
		principal.setLastName(testString);
		principal.setEmailAddress(testString);
		principal.setContactPhone(testString);
		principal.setDateOfBirth(testString);
		principal.setDriversLicense(testString);
		principal.setDriversLicenseState(testString);
		principal.setSsn(testString);
        legalEntityModel.setLegalEntityPrincipal(principal);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityPrincipal(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityPrincipal(), principal);
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
    
     static testMethod void testLegalEntityPci(){
     	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        //System.assertEquals(legalEntityModel.getLegalEntityPci(), null);
        System.assertEquals(legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp(), null);
        System.assertEquals(legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated(), null);
        System.assertEquals(legalEntityModel.getLegalEntityPci().getPciLevel(), null);
        System.assertEquals(legalEntityModel.getLegalEntityPci().getScanningVendor(), null);
        System.assertEquals(legalEntityModel.getLegalEntityPci().getQualifiedSecurityAssessor(), null);
        System.assertEquals(legalEntityModel.getLegalEntityPci().getMostRecentlyPassedScan(), null);
        System.assertEquals(legalEntityModel.getLegalEntityPci().getReportOnCompliance(), null);
        
        PCI pci = new PCI();
        pci.setIsExclusiveToPsp(testString);
        pci.setIsPciComplianceValidated(testString);
        pci.setPciLevel(testString);
        pci.setScanningVendor(testString);
        pci.setQualifiedSecurityAssessor(testString);
        pci.setMostRecentlyPassedScan(testString);
        pci.setReportOnCompliance(testString);
        legalEntityModel.setLegalEntityPci(pci);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityPci(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityPci(), pci);
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
    
    static testMethod void testLegalEntityId(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityId(), null);
        legalEntityModel.setLegalEntityId(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityId(), testString);
    }
    
    static testMethod void testNameFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsNameFromOpportunity(), false);
        legalEntityModel.setIsNameFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsNameFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsNameFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityDoingBusinessAsFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsDoingBusinessAsFromOpportunity(), false);
        legalEntityModel.setIsDoingBusinessAsFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsDoingBusinessAsFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsDoingBusinessAsFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityContactPhoneFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsContactPhoneFromOpportunity(), false);
        legalEntityModel.setIsContactPhoneFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsContactPhoneFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsContactPhoneFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityTaxIdFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsTaxIdFromOpportunity(), false);
        legalEntityModel.setIsTaxIdFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsTaxIdFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsTaxIdFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityAnnualCreditCardSalesVolumeFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsAnnualCreditCardSalesVolumeFromOpportunity(), false);
        legalEntityModel.setIsAnnualCreditCardSalesVolumeFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsAnnualCreditCardSalesVolumeFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsAnnualCreditCardSalesVolumeFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityHasAcceptedCreditCardsFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsHasAcceptedCreditCardsFromOpportunity(), false);
        legalEntityModel.setIsHasAcceptedCreditCardsFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsHasAcceptedCreditCardsFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsHasAcceptedCreditCardsFromOpportunity(), true);
    }
    
   
    
    
}