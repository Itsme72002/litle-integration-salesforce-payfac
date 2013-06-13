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
private class AddressTest {
	public static final String testString = 'test';

    static testMethod void testStreetAddress1(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getStreetAddress1(), null);
        address.setStreetAddress1(testString);
        // First check if the value is set
        System.assertNotEquals(address.getStreetAddress1(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getStreetAddress1(), testString);
    }
    
    static testMethod void testStreetAddress2(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getStreetAddress2(), null);
        address.setStreetAddress2(testString);
        // First check if the value is set
        System.assertNotEquals(address.getStreetAddress2(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getStreetAddress2(), testString);
    }
    
    static testMethod void testCity(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getCity(), null);
        address.setCity(testString);
        // First check if the value is set
        System.assertNotEquals(address.getCity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getCity(), testString);
    }
    
    static testMethod void testStateProvince(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getStateProvince(), null);
        address.setStateProvince(testString);
        // First check if the value is set
        System.assertNotEquals(address.getStateProvince(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getStateProvince(), testString);
    }
    
    static testMethod void testPostalCode(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getPostalCode(), null);
        address.setPostalCode(testString);
        // First check if the value is set
        System.assertNotEquals(address.getPostalCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getPostalCode(), testString);
    }
    
    static testMethod void testCountryCode(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getCountryCode(), null);
        address.setCountryCode(testString);
        // First check if the value is set
        System.assertNotEquals(address.getCountryCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getCountryCode(), testString);
    }
}