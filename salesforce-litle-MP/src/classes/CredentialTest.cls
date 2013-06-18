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
private class CredentialTest {

    public static final String testString = 'test';

    static testMethod void testUserName(){
    	Credential credential = new Credential();
        // Check if the account is null initially
        System.assertEquals(credential.getUserName(), null);
        credential.setUserName(testString);
        // First check if the value is set
        System.assertNotEquals(credential.getUserName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(credential.getUserName(), testString);
    }
    
    static testMethod void testPassword(){
    	Credential credential = new Credential();
        // Check if the account is null initially
        System.assertEquals(credential.getPassword(), null);
        credential.setPassword(testString);
        // First check if the value is set
        System.assertNotEquals(credential.getPassword(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(credential.getPassword(), testString);
    }
}