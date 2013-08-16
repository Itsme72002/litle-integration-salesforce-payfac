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
