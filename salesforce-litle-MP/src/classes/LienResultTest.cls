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
private class LienResultTest {

    public static final String testString = 'test';

    static testMethod void testLienyType(){
    	LienResult lienResult = new LienResult();
        // Check if the LienyType is null initially
        System.assertEquals(lienResult.getLienyType(), null);
        lienResult.setLienyType(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getLienyType(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getLienyType(), testString);
    }
    
    static testMethod void testReleasedCount(){
    	LienResult lienResult = new LienResult();
        // Check if the ReleasedCount is null initially
        System.assertEquals(lienResult.getReleasedCount(), null);
        lienResult.setReleasedCount(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getReleasedCount(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getReleasedCount(), testString);
    }
    
    static testMethod void testUnreleasedCount(){
    	LienResult lienResult = new LienResult();
        // Check if the UnreleasedCount is null initially
        System.assertEquals(lienResult.getUnreleasedCount(), null);
        lienResult.setUnreleasedCount(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getUnreleasedCount(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getUnreleasedCount(), testString);
    }
    
    static testMethod void testCompanyName(){
    	LienResult lienResult = new LienResult();
        // Check if the CompanyName is null initially
        System.assertEquals(lienResult.getCompanyName(), null);
        lienResult.setCompanyName(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getCompanyName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getCompanyName(), testString);
    }
    
    static testMethod void testStreetAddress1(){
    	LienResult lienResult = new LienResult();
        // Check if the StreetAddress1 is null initially
        System.assertEquals(lienResult.getStreetAddress1(), null);
        lienResult.setStreetAddress1(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getStreetAddress1(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getStreetAddress1(), testString);
    }
    
    static testMethod void testStreetAddress2(){
    	LienResult lienResult = new LienResult();
        // Check if the StreetAddress2 is null initially
        System.assertEquals(lienResult.getStreetAddress2(), null);
        lienResult.setStreetAddress2(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getStreetAddress2(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getStreetAddress2(), testString);
    }
    
    static testMethod void testCity(){
    	LienResult lienResult = new LienResult();
        // Check if the City is null initially
        System.assertEquals(lienResult.getCity(), null);
        lienResult.setCity(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getCity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getCity(), testString);
    }
    
    static testMethod void testState(){
    	LienResult lienResult = new LienResult();
        // Check if the State is null initially
        System.assertEquals(lienResult.getState(), null);
        lienResult.setState(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getState(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getState(), testString);
    }
    
    static testMethod void testZip(){
    	LienResult lienResult = new LienResult();
        // Check if the Zip is null initially
        System.assertEquals(lienResult.getZip(), null);
        lienResult.setZip(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getZip(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getZip(), testString);
    }
    
    static testMethod void testZip4(){
    	LienResult lienResult = new LienResult();
        // Check if the Zip4 is null initially
        System.assertEquals(lienResult.getZip4(), null);
        lienResult.setZip4(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getZip4(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getZip4(), testString);
    }
    
    static testMethod void testFilingDate(){
    	LienResult lienResult = new LienResult();
        // Check if the FilingDate is null initially
        System.assertEquals(lienResult.getFilingDate(), null);
        lienResult.setFilingDate(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getFilingDate(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getFilingDate(), testString);
    }
}