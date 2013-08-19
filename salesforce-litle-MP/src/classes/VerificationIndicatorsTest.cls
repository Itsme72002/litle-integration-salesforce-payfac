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
