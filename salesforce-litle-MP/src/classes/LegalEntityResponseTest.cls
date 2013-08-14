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
private class LegalEntityResponseTest {

    public static final String testString = 'test';

    static testMethod void testBusinessToPrincipalAssociation(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
    	descriptionDetails.setCodeOrScore(testString);
    	descriptionDetails.setDescription(testString);
        legalEntityResponse.setBusinessToPrincipalAssociation(descriptionDetails);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getBusinessToPrincipalAssociation(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getBusinessToPrincipalAssociation(), descriptionDetails);
    }
    
    static testMethod void testTransactionId(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
        // Check if the TransactionId is null initially
        System.assertEquals(legalEntityResponse.getTransactionId(), null);
        legalEntityResponse.setTransactionId(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getTransactionId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getTransactionId(), testString);
    }
    static testMethod void testLegalEntityId(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
        // Check if the LegalEntityId is null initially
        System.assertEquals(legalEntityResponse.getLegalEntityId(), null);
        legalEntityResponse.setLegalEntityId(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getLegalEntityId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getLegalEntityId(), testString);
    }
    static testMethod void testResponseCode(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
        // Check if the ResponseCode is null initially
        System.assertEquals(legalEntityResponse.getResponseCode(), null);
        legalEntityResponse.setResponseCode(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getResponseCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getResponseCode(), testString);
    }
    static testMethod void testResponseDespcription(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
        // Check if the ResponseDespcription is null initially
        System.assertEquals(legalEntityResponse.getResponseDespcription(), null);
        legalEntityResponse.setResponseDespcription(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getResponseDespcription(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getResponseDespcription(), testString);
    }
    
    static testMethod void testBackgroundCheckDecisionNotes(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
        // Check if the BackgroundCheckDecisionNotes is null initially
        System.assertEquals(legalEntityResponse.getBackgroundCheckDecisionNotes(), null);
        legalEntityResponse.setBackgroundCheckDecisionNotes(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getBackgroundCheckDecisionNotes(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getBackgroundCheckDecisionNotes(), testString);
    }
    
    static testMethod void testBusinessVerificationResult(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
    	descriptionDetails.setCodeOrScore(testString);
    	descriptionDetails.setDescription(testString);
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
    	verificationIndicators.setNameVerified(testString);
    	verificationIndicators.setAddressVerified(testString);
    	verificationIndicators.setCityVerified(testString);
    	verificationIndicators.setZipVerified(testString);
    	verificationIndicators.setPhoneVerified(testString);
    	verificationIndicators.setTaxIdVerified(testString);
    	
    	VerificationResult verificationResult = new VerificationResult();
    	verificationResult.setOverallScore(descriptionDetails);
    	verificationResult.setNameAddressTaxOrSsnIdAssociation(descriptionDetails);
    	verificationResult.setNameAddressPhoneAssociation(descriptionDetails);
    	verificationResult.setVerificationIndicator(verificationIndicators);
    	List<DescriptionDetails> riskIndicators = new List<DescriptionDetails>();
    	riskIndicators.add(descriptionDetails);
    	verificationResult.setRiskIndicators(riskIndicators);
    	 legalEntityResponse.setBusinessVerificationResult(verificationResult);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getBusinessVerificationResult(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getBusinessVerificationResult(), verificationResult);
    }
    
    static testMethod void testPrincipalVerificationResult(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
    	descriptionDetails.setCodeOrScore(testString);
    	descriptionDetails.setDescription(testString);
    	VerificationIndicators verificationIndicators = new VerificationIndicators();
    	verificationIndicators.setNameVerified(testString);
    	verificationIndicators.setAddressVerified(testString);
    	verificationIndicators.setCityVerified(testString);
    	verificationIndicators.setZipVerified(testString);
    	verificationIndicators.setPhoneVerified(testString);
    	verificationIndicators.setTaxIdVerified(testString);
    	VerificationResult verificationResult = new VerificationResult();
    	verificationResult.setOverallScore(descriptionDetails);
    	verificationResult.setNameAddressTaxOrSsnIdAssociation(descriptionDetails);
    	verificationResult.setNameAddressPhoneAssociation(descriptionDetails);
    	verificationResult.setVerificationIndicator(verificationIndicators);
    	List<DescriptionDetails> riskIndicators = new List<DescriptionDetails>();
    	riskIndicators.add(descriptionDetails);
    	verificationResult.setRiskIndicators(riskIndicators);
        legalEntityResponse.setPrincipalVerificationResult(verificationResult);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getPrincipalVerificationResult(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getPrincipalVerificationResult(), verificationResult);
    }
    
    static testMethod void testResponsePrincipal(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
    	Principal principal = new Principal();
    	Address address = new Address();
    	address.setStreetaddress1(testString);
    	address.setStreetAddress2(testString);
    	address.setCity(testString);
    	address.setStateProvince(testString);
    	address.setPostalCode(testString);
    	address.setCountryCode(testString);
    	principal.setAddress(address);
    	principal.setFirstName(testString);
		principal.setLastName(testString);
		principal.setEmailAddress(testString);
		principal.setContactPhone(testString);
		principal.setDateOfBirth(testString);
		principal.setDriversLicense(testString);
		principal.setDriversLicenseState(testString);
		principal.setSsn(testString);
		legalEntityResponse.setResponsePrincipal(principal);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getResponsePrincipal(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getResponsePrincipal(), principal);    	
    	
    }
    
    static testMethod void testResponseBankruptcyData(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
    	BankruptcyData bankruptcyData = new BankruptcyData();
    	bankruptcyData.setBankruptcyType(testString);
    	bankruptcyData.setBankruptcyCount(testString);
    	bankruptcyData.setCompanyName(testString);
    	bankruptcyData.setStreetAddress1(testString);
    	bankruptcyData.setStreetAddress2(testString);
    	bankruptcyData.setCity(testString);
    	bankruptcyData.setZip(testString);
    	bankruptcyData.setZip4(testString);
    	bankruptcyData.setFilingDate(testString);
        legalEntityResponse.setResponseBankruptcyData(bankruptcyData);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getResponseBankruptcyData(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getResponseBankruptcyData(), bankruptcyData);
    }
    
    static testMethod void testResponseLienResult(){
    	LegalEntityResponse legalEntityResponse = new LegalEntityResponse();
    	LienResult lienResult = new LienResult();
    	lienResult.setLienyType(testString);
    	lienResult.setReleasedCount(testString);
    	lienResult.setUnreleasedCount(testString);
    	lienResult.setCompanyName(testString);
    	lienResult.setStreetAddress1(testString);
    	lienResult.setStreetAddress2(testString);
    	lienResult.setCity(testString);
    	lienResult.setZip(testString);
    	lienResult.setZip4(testString);
    	lienResult.setFilingDate(testString);
        legalEntityResponse.setResponseLienResult(lienResult);
        // First check if the value is set
        System.assertNotEquals(legalEntityResponse.getResponseLienResult(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityResponse.getResponseLienResult(), lienResult);
    }
}