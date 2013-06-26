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
private class PCITest {
	
	public static final String testString = 'test';

    static testMethod void testPciIsExclusiveToPsp(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getIsExclusiveToPsp(), null);
        pci.setIsExclusiveToPsp(testString);
        // Last check if the value is set
        System.assertNotEquals(pci.getIsExclusiveToPsp(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getIsExclusiveToPsp(), testString);
    }
    
    static testMethod void testPciIsPciComplianceValidated(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getIsPciComplianceValidated(), null);
        pci.setIsPciComplianceValidated(testString);
        // Last check if the value is set
        System.assertNotEquals(pci.getIsPciComplianceValidated(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getIsPciComplianceValidated(), testString);
    }
    
    static testMethod void testPciPciLevel(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getPciLevel(), null);
        pci.setPciLevel(testString);
        // Last check if the value is set
        System.assertNotEquals(pci.getPciLevel(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getPciLevel(), testString);
    }
    
    static testMethod void testPciScanningVendor(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getScanningVendor(), null);
        pci.setScanningVendor(testString);
        // Last check if the value is set
        System.assertNotEquals(pci.getScanningVendor(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getScanningVendor(), testString);
    }
    
    static testMethod void testPciQualifiedSecurityAssessor(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getQualifiedSecurityAssessor(), null);
        pci.setQualifiedSecurityAssessor(testString);
        // Last check if the value is set
        System.assertNotEquals(pci.getQualifiedSecurityAssessor(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getQualifiedSecurityAssessor(), testString);
    }
    
    static testMethod void testPciMostRecentlyPassedScan(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getMostRecentlyPassedScan(), null);
        pci.setMostRecentlyPassedScan(testString);
        // Last check if the value is set
        System.assertNotEquals(pci.getMostRecentlyPassedScan(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getMostRecentlyPassedScan(), testString);
    }
    
    static testMethod void testPciReportOnCompliance(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getReportOnCompliance(), null);
        pci.setReportOnCompliance(testString);
        // Last check if the value is set
        System.assertNotEquals(pci.getReportOnCompliance(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getReportOnCompliance(), testString);
    }
    
    static testMethod void testIsIsExclusiveToPspFromOpportunity(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getIsIsExclusiveToPspFromOpportunity(), false);
        pci.setIsIsExclusiveToPspFromOpportunity(true);
        // Last check if the value is set
        System.assertNotEquals(pci.getIsIsExclusiveToPspFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getIsIsExclusiveToPspFromOpportunity(), true);
    }
    
    static testMethod void testIsIsPciComplianceValidatedFromOpportunity(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getIsIsPciComplianceValidatedFromOpportunity(), false);
        pci.setIsIsPciComplianceValidatedFromOpportunity(true);
        // Last check if the value is set
        System.assertNotEquals(pci.getIsIsPciComplianceValidatedFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getIsIsPciComplianceValidatedFromOpportunity(), true);
    }
    
    static testMethod void testIsPciLevelFromOpportunity(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getIsPciLevelFromOpportunity(), false);
        pci.setIsPciLevelFromOpportunity(true);
        // Last check if the value is set
        System.assertNotEquals(pci.getIsPciLevelFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getIsPciLevelFromOpportunity(), true);
    }
    
    static testMethod void testIsScanningVendorFromOpportunity(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getIsScanningVendorFromOpportunity(), false);
        pci.setIsScanningVendorFromOpportunity(true);
        // Last check if the value is set
        System.assertNotEquals(pci.getIsScanningVendorFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getIsScanningVendorFromOpportunity(), true);
    }
    
    static testMethod void testIsQualifiedSecurityAssessorFromOpportunity(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getIsQualifiedSecurityAssessorFromOpportunity(), false);
        pci.setIsQualifiedSecurityAssessorFromOpportunity(true);
        // Last check if the value is set
        System.assertNotEquals(pci.getIsQualifiedSecurityAssessorFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getIsQualifiedSecurityAssessorFromOpportunity(), true);
    }
    
    static testMethod void testIsMostRecentlyPassedScanFromOpportunity(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getIsMostRecentlyPassedScanFromOpportunity(), false);
        pci.setIsMostRecentlyPassedScanFromOpportunity(true);
        // Last check if the value is set
        System.assertNotEquals(pci.getIsMostRecentlyPassedScanFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getIsMostRecentlyPassedScanFromOpportunity(), true);
    }
    
    static testMethod void testIsReportOnComplianceFromOpportunity(){
    	PCI pci = new PCI();
        // Check if the account is null initially
        System.assertEquals(pci.getIsReportOnComplianceFromOpportunity(), false);
        pci.setIsReportOnComplianceFromOpportunity(true);
        // Last check if the value is set
        System.assertNotEquals(pci.getIsReportOnComplianceFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(pci.getIsReportOnComplianceFromOpportunity(), true);
    }
}