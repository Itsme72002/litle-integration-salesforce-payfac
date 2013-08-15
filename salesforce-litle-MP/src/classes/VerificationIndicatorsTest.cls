@isTest
private class VerificationIndicatorsTest {

    public static final String testString = 'test';

    static testMethod void testNameVerified(){
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
        // Check null initially
        System.assertEquals(verificationIndicators.getNameVerified(), null);
        verificationIndicators.setNameVerified(testString);
        // First check if the value is set
        System.assertNotEquals(verificationIndicators.getNameVerified(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationIndicators.getNameVerified(), testString);
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
    
    static testMethod void testSsnVerified(){
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
        // Check null initially
        System.assertEquals(verificationIndicators.getSsnVerified(), null);
        verificationIndicators.setSsnVerified(testString);
        // First check if the value is set
        System.assertNotEquals(verificationIndicators.getSsnVerified(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationIndicators.getSsnVerified(), testString);
    }
    
    static testMethod void testDobVerified(){
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
        // Check null initially
        System.assertEquals(verificationIndicators.getDobVerified(), null);
        verificationIndicators.setDobVerified(testString);
        // First check if the value is set
        System.assertNotEquals(verificationIndicators.getDobVerified(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationIndicators.getDobVerified(), testString);
    }
}