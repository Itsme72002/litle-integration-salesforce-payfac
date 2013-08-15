@isTest
private class VerificationResultTest {

    public static final String testString = 'test';

    static testMethod void testOverallScore(){
    	VerificationResult verificationResult = new VerificationResult();
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
    	descriptionDetails.setCodeOrScore(testString);
    	descriptionDetails.setDescription(testString);
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
        verificationResult.setNameAddressPhoneAssociation(descriptionDetails);
        // First check if the value is set
        System.assertNotEquals(verificationResult.getNameAddressPhoneAssociation(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationResult.getNameAddressPhoneAssociation(), descriptionDetails);
    }
    
    static testMethod void testVerificationIndicator(){
    	VerificationResult verificationResult = new VerificationResult();
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
    	verificationIndicators.setNameVerified(testString);
    	verificationIndicators.setAddressVerified(testString);
    	verificationIndicators.setCityVerified(testString);
    	verificationIndicators.setZipVerified(testString);
    	verificationIndicators.setPhoneVerified(testString);
    	verificationIndicators.setTaxIdVerified(testString);
        verificationResult.setVerificationIndicator(verificationIndicators);
        // First check if the value is set
        System.assertNotEquals(verificationResult.getVerificationIndicator(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(verificationResult.getVerificationIndicator(), verificationIndicators);
    }
    
    static testMethod void testRiskIndicators(){
    	VerificationResult verificationResult = new VerificationResult();
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
    	List<DescriptionDetails> riskIndicators = new List<DescriptionDetails>();
    	descriptionDetails.setCodeOrScore(testString);
    	descriptionDetails.setDescription(testString);
    	riskIndicators.add(descriptionDetails);
        verificationResult.setRiskIndicators(riskIndicators);
        // First check if the value is set
        System.assertNotEquals(verificationResult.getRiskIndicators(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(riskIndicators, verificationResult.getRiskIndicators());
    }
}