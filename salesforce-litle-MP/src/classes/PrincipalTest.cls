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
private class PrincipalTest {
	
	public static final String testString = 'test';
	
	static testMethod void testAddress(){
    	Principal principal = new Principal();
    	Address address = new Address();
    	address.setStreetaddress1(testString);
    	address.setStreetAddress2(testString);
    	address.setCity(testString);
    	address.setStateProvince(testString);
    	address.setPostalCode(testString);
    	address.setCountryCode(testString);
        // Check if the Type is null initially
        System.assertEquals(principal.getAddress().getStreetAddress1(), null);
        System.assertEquals(principal.getAddress().getStreetAddress2(), null);
        System.assertEquals(principal.getAddress().getCity(), null);
        System.assertEquals(principal.getAddress().getStateProvince(), null);
        System.assertEquals(principal.getAddress().getPostalCode(), null);
        System.assertEquals(principal.getAddress().getCountryCode(), null);
        principal.setAddress(address);
        // First check if the value is set
        System.assertNotEquals(principal.getAddress(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getAddress(), address);
    }

	static testMethod void testPrincipalId(){
    	Principal principal = new Principal();
        // Check if the account is null initially
        System.assertEquals(principal.getPrincipalId(), null);
        principal.setPrincipalId(testString);
        // First check if the value is set
        System.assertNotEquals(principal.getPrincipalId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getPrincipalId(), testString);
    }
    
    static testMethod void testFirstName(){
    	Principal principal = new Principal();
        // Check if the account is null initially
        System.assertEquals(principal.getFirstName(), null);
        principal.setFirstName(testString);
        // First check if the value is set
        System.assertNotEquals(principal.getFirstName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getFirstName(), testString);
    }
    
    static testMethod void testLastName(){
    	Principal principal = new Principal();
        // Check if the account is null initially
        System.assertEquals(principal.getLastName(), null);
        principal.setLastName(testString);
        // Last check if the value is set
        System.assertNotEquals(principal.getLastName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getLastName(), testString);
    }
    
    static testMethod void testEmailAddress(){
    	Principal principal = new Principal();
        // Check if the account is null initially
        System.assertEquals(principal.getEmailAddress(), null);
        principal.setEmailAddress(testString);
        // Last check if the value is set
        System.assertNotEquals(principal.getEmailAddress(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getEmailAddress(), testString);
    }
    
    static testMethod void testContactPhone(){
    	Principal principal = new Principal();
        // Check if the account is null initially
        System.assertEquals(principal.getContactPhone(), null);
        principal.setContactPhone(testString);
        // Last check if the value is set
        System.assertNotEquals(principal.getContactPhone(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getContactPhone(), testString);
    }
    
    static testMethod void testDateOfBirth(){
    	Principal principal = new Principal();
        // Check if the account is null initially
        System.assertEquals(principal.getDateOfBirth(), null);
        principal.setDateOfBirth(testString);
        // Last check if the value is set
        System.assertNotEquals(principal.getDateOfBirth(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getDateOfBirth(), testString);
    }
    
    static testMethod void testDriversLicense(){
    	Principal principal = new Principal();
        // Check if the account is null initially
        System.assertEquals(principal.getDriversLicense(), null);
        principal.setDriversLicense(testString);
        // Last check if the value is set
        System.assertNotEquals(principal.getDriversLicense(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getDriversLicense(), testString);
    }
    
    static testMethod void testDriversLicenseState(){
    	Principal principal = new Principal();
        // Check if the account is null initially
        System.assertEquals(principal.getDriversLicenseState(), null);
        principal.setDriversLicenseState(testString);
        // Last check if the value is set
        System.assertNotEquals(principal.getDriversLicenseState(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getDriversLicenseState(), testString);
    }
    
    static testMethod void testSsn(){
    	Principal principal = new Principal();
        // Check if the account is null initially
        System.assertEquals(principal.getSsn(), null);
        principal.setSsn(testString);
        // Last check if the value is set
        System.assertNotEquals(principal.getSsn(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(principal.getSsn(), testString);
    }
    
    static testMethod void testIsSsnFromOpportunity(){
    	Principal principal = new Principal();
        // Check if the account Is null initially
        System.assertEquals(principal.getIsSsnFromOpportunity(), false);
        principal.setIsSsnFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(principal.getIsSsnFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(principal.getIsSsnFromOpportunity(), true);
    }
    
    static testMethod void testIsDriversLicenseStateFromOpportunity(){
    	Principal principal = new Principal();
        // Check if the account Is null initially
        System.assertEquals(principal.getIsDriversLicenseStateFromOpportunity(), false);
        principal.setIsDriversLicenseStateFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(principal.getIsDriversLicenseStateFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(principal.getIsDriversLicenseStateFromOpportunity(), true);
    }
    
    static testMethod void testIsDriversLicenseFromOpportunity(){
    	Principal principal = new Principal();
        // Check if the account Is null initially
        System.assertEquals(principal.getIsDriversLicenseFromOpportunity(), false);
        principal.setIsDriversLicenseFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(principal.getIsDriversLicenseFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(principal.getIsDriversLicenseFromOpportunity(), true);
    }
    
    static testMethod void testIsDateOfBirthFromOpportunity(){
    	Principal principal = new Principal();
        // Check if the account Is null initially
        System.assertEquals(principal.getIsDateOfBirthFromOpportunity(), false);
        principal.setIsDateOfBirthFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(principal.getIsDateOfBirthFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(principal.getIsDateOfBirthFromOpportunity(), true);
    }
    
    static testMethod void testIsContactPhoneFromOpportunity(){
    	Principal principal = new Principal();
        // Check if the account Is null initially
        System.assertEquals(principal.getIsContactPhoneFromOpportunity(), false);
        principal.setIsContactPhoneFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(principal.getIsContactPhoneFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(principal.getIsContactPhoneFromOpportunity(), true);
    }
    
    static testMethod void testIsFirstNameFromOpportunity(){
    	Principal principal = new Principal();
        // Check if the account Is null initially
        System.assertEquals(principal.getIsFirstNameFromOpportunity(), false);
        principal.setIsFirstNameFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(principal.getIsFirstNameFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(principal.getIsFirstNameFromOpportunity(), true);
    }
    
    static testMethod void testIsLastNameFromOpportunity(){
    	Principal principal = new Principal();
        // Check if the account Is null initially
        System.assertEquals(principal.getIsLastNameFromOpportunity(), false);
        principal.setIsLastNameFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(principal.getIsLastNameFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(principal.getIsLastNameFromOpportunity(), true);
    }
    
    static testMethod void testIsEmailAddressFromOpportunity(){
    	Principal principal = new Principal();
        // Check if the account Is null initially
        System.assertEquals(principal.getIsEmailAddressFromOpportunity(), false);
        principal.setIsEmailAddressFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(principal.getIsEmailAddressFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(principal.getIsEmailAddressFromOpportunity(), true);
    }
    
    
}