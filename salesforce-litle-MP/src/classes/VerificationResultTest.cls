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
private class VerificationResultTest {

    public static final String testString = 'test';

    static testMethod void testOverallScore(){
    	VerificationResult verificationResult = new VerificationResult();
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
    	descriptionDetails.setCodeOrScore(testString);
    	descriptionDetails.setDescription(testString);
        // Check null initially
        System.assertEquals(verificationResult.getOverallScore(), null);
        verificationResult.setOverallScore(descriptionDetails);
        // First check if the value is set
        System.assertNotEquals(verificationResult.getOverallScore(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationResult.getOverallScore(), descriptionDetails);
    }
    
    static testMethod void testNameAddressTaxOrSsnIdAssociation(){
    	VerificationResult verificationResult = new VerificationResult();
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
    	descriptionDetails.setCodeOrScore(testString);
    	descriptionDetails.setDescription(testString);
        // Check null initially
        System.assertEquals(verificationResult.getNameAddressTaxOrSsnIdAssociation(), null);
        verificationResult.setNameAddressTaxOrSsnIdAssociation(descriptionDetails);
        // First check if the value is set
        System.assertNotEquals(verificationResult.getNameAddressTaxOrSsnIdAssociation(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationResult.getNameAddressTaxOrSsnIdAssociation(), descriptionDetails);
    }
    
    static testMethod void testNameAddressPhoneAssociation(){
    	VerificationResult verificationResult = new VerificationResult();
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
    	descriptionDetails.setCodeOrScore(testString);
    	descriptionDetails.setDescription(testString);
        // Check null initially
        System.assertEquals(verificationResult.getNameAddressPhoneAssociation(), null);
        verificationResult.setNameAddressPhoneAssociation(descriptionDetails);
        // First check if the value is set
        System.assertNotEquals(verificationResult.getNameAddressPhoneAssociation(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationResult.getNameAddressPhoneAssociation(), descriptionDetails);
    }
    
    static testMethod void testVerificationIndicator(){
    	VerificationResult verificationResult = new VerificationResult();
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
    	verificationIndicators.setNameVerfied(testString);
    	verificationIndicators.setAddressVerified(testString);
    	verificationIndicators.setCityVerified(testString);
    	verificationIndicators.setZipVerified(testString);
    	verificationIndicators.setPhoneVerified(testString);
    	verificationIndicators.setTaxIdVerified(testString);
        // Check null initially
        System.assertEquals(verificationResult.getVerificationIndicator(), null);
        verificationResult.setVerificationIndicator(verificationIndicators);
        // First check if the value is set
        System.assertNotEquals(verificationResult.getVerificationIndicator(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationResult.getVerificationIndicator(), verificationIndicators);
    }
    
    static testMethod void testRiskIndicator(){
    	VerificationResult verificationResult = new VerificationResult();
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
    	descriptionDetails.setCodeOrScore(testString);
    	descriptionDetails.setDescription(testString);
        // Check null initially
        System.assertEquals(verificationResult.getRiskIndicator(), null);
        verificationResult.setRiskIndicator(descriptionDetails);
        // First check if the value is set
        System.assertNotEquals(verificationResult.getRiskIndicator(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationResult.getRiskIndicator(), descriptionDetails);
    }
}