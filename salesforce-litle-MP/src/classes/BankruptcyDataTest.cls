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
private class BankruptcyDataTest {

    public static final String testString = 'test';

	
    static testMethod void testBankruptcyType(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the BankruptcyType is null initially
        System.assertEquals(bankruptcyData.getBankruptcyType(), null);
        bankruptcyData.setBankruptcyType(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getBankruptcyType(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getBankruptcyType(), testString);
    }
    
    static testMethod void testBankruptcyCount(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the BankruptcyCount is null initially
        System.assertEquals(bankruptcyData.getBankruptcyCount(), null);
        bankruptcyData.setBankruptcyCount(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getBankruptcyCount(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getBankruptcyCount(), testString);
    }
    
    static testMethod void testCompanyName(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the CompanyName is null initially
        System.assertEquals(bankruptcyData.getCompanyName(), null);
        bankruptcyData.setCompanyName(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getCompanyName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getCompanyName(), testString);
    }
    
    static testMethod void testStreetAddress1(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the StreetAddress1 is null initially
        System.assertEquals(bankruptcyData.getStreetAddress1(), null);
        bankruptcyData.setStreetAddress1(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getStreetAddress1(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getStreetAddress1(), testString);
    }
    
    static testMethod void testStreetAddress2(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the StreetAddress2 is null initially
        System.assertEquals(bankruptcyData.getStreetAddress2(), null);
        bankruptcyData.setStreetAddress2(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getStreetAddress2(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getStreetAddress2(), testString);
    }
    
    static testMethod void testCity(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the City is null initially
        System.assertEquals(bankruptcyData.getCity(), null);
        bankruptcyData.setCity(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getCity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getCity(), testString);
    }
    
    static testMethod void testZip(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the Zip is null initially
        System.assertEquals(bankruptcyData.getZip(), null);
        bankruptcyData.setZip(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getZip(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getZip(), testString);
    }
    
    static testMethod void testZip4(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the Zip4 is null initially
        System.assertEquals(bankruptcyData.getZip4(), null);
        bankruptcyData.setZip4(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getZip4(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getZip4(), testString);
    }
    
    static testMethod void testFilingDate(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the FilingDate is null initially
        System.assertEquals(bankruptcyData.getFilingDate(), null);
        bankruptcyData.setFilingDate(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getFilingDate(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getFilingDate(), testString);
    }
}