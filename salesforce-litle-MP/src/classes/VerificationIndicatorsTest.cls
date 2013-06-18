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
private class VerificationIndicatorsTest {

    public static final String testString = 'test';

    static testMethod void testNameVerfied(){
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
        // Check null initially
        System.assertEquals(verificationIndicators.getNameVerfied(), null);
        verificationIndicators.setNameVerfied(testString);
        // First check if the value is set
        System.assertNotEquals(verificationIndicators.getNameVerfied(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationIndicators.getNameVerfied(), testString);
    }
    
    static testMethod void testAddressVerified(){
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
        // Check null initially
        System.assertEquals(verificationIndicators.getAddressVerified(), null);
        verificationIndicators.setAddressVerified(testString);
        // First check if the value is set
        System.assertNotEquals(verificationIndicators.getAddressVerified(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationIndicators.getAddressVerified(), testString);
    }
    
    static testMethod void testCityVerified(){
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
        // Check null initially
        System.assertEquals(verificationIndicators.getCityVerified(), null);
        verificationIndicators.setCityVerified(testString);
        // First check if the value is set
        System.assertNotEquals(verificationIndicators.getCityVerified(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationIndicators.getCityVerified(), testString);
    }
    
    static testMethod void testZipVerified(){
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
        // Check null initially
        System.assertEquals(verificationIndicators.getZipVerified(), null);
        verificationIndicators.setZipVerified(testString);
        // First check if the value is set
        System.assertNotEquals(verificationIndicators.getZipVerified(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationIndicators.getZipVerified(), testString);
    }
    
    static testMethod void testPhoneVerified(){
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
        // Check null initially
        System.assertEquals(verificationIndicators.getPhoneVerified(), null);
        verificationIndicators.setPhoneVerified(testString);
        // First check if the value is set
        System.assertNotEquals(verificationIndicators.getPhoneVerified(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationIndicators.getPhoneVerified(), testString);
    }
    
    static testMethod void testTaxIdVerified(){
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
        // Check null initially
        System.assertEquals(verificationIndicators.getTaxIdVerified(), null);
        verificationIndicators.setTaxIdVerified(testString);
        // First check if the value is set
        System.assertNotEquals(verificationIndicators.getTaxIdVerified(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationIndicators.getTaxIdVerified(), testString);
    }
}