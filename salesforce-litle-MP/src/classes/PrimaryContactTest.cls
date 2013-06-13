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
private class PrimaryContactTest {
	private static final String testString = 'test';

    static testMethod void testFirstName(){
		PrimaryContact primaryContact = new PrimaryContact();
		// Check if the FirstName is null initially
        System.assertEquals(primaryContact.getFirstName(), null);
        primaryContact.setFirstName(testString);
        // First check if the value is set
        System.assertNotEquals(primaryContact.getFirstName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(primaryContact.getFirstName(), testString);
	}
	static testMethod void testLastName(){
		PrimaryContact primaryContact = new PrimaryContact();
		// Check if the LastName is null initially
        System.assertEquals(primaryContact.getLastName(), null);
        primaryContact.setLastName(testString);
        // First check if the value is set
        System.assertNotEquals(primaryContact.getLastName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(primaryContact.getLastName(), testString);
	}
	static testMethod void testEmailAddress(){
		PrimaryContact primaryContact = new PrimaryContact();
		// Check if the EmailAddress is null initially
        System.assertEquals(primaryContact.getEmailAddress(), null);
        primaryContact.setEmailAddress(testString);
        // First check if the value is set
        System.assertNotEquals(primaryContact.getEmailAddress(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(primaryContact.getEmailAddress(), testString);
	}
	static testMethod void testPhone(){
		PrimaryContact primaryContact = new PrimaryContact();
		// Check if the Phone is null initially
        System.assertEquals(primaryContact.getPhone(), null);
        primaryContact.setPhone(testString);
        // First check if the value is set
        System.assertNotEquals(primaryContact.getPhone(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(primaryContact.getPhone(), testString);
	}
}