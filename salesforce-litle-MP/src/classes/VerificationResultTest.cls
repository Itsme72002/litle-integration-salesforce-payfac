/*
Copyright (c) 2013 Litle & Co.
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/
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