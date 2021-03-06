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
	
	static testMethod void testIsFirstNameFromOpportunity(){
    	PrimaryContact primaryContact = new PrimaryContact();
        // Check if the account Is null initially
        System.assertEquals(primaryContact.getIsFirstNameFromOpportunity(), false);
        primaryContact.setIsFirstNameFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(primaryContact.getIsFirstNameFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(primaryContact.getIsFirstNameFromOpportunity(), true);
    }
    
    static testMethod void testIsLastNameFromOpportunity(){
    	PrimaryContact primaryContact = new PrimaryContact();
        // Check if the account Is null initially
        System.assertEquals(primaryContact.getIsLastNameFromOpportunity(), false);
        primaryContact.setIsLastNameFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(primaryContact.getIsLastNameFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(primaryContact.getIsLastNameFromOpportunity(), true);
    }
    
    static testMethod void testIsEmailAddressFromOpportunity(){
    	PrimaryContact primaryContact = new PrimaryContact();
        // Check if the account Is null initially
        System.assertEquals(primaryContact.getIsEmailAddressFromOpportunity(), false);
        primaryContact.setIsEmailAddressFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(primaryContact.getIsEmailAddressFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(primaryContact.getIsEmailAddressFromOpportunity(), true);
    }
    
    static testMethod void testIsPhoneFromOpportunity(){
    	PrimaryContact primaryContact = new PrimaryContact();
        // Check if the account Is null initially
        System.assertEquals(primaryContact.getIsPhoneFromOpportunity(), false);
        primaryContact.setIsPhoneFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(primaryContact.getIsPhoneFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(primaryContact.getIsPhoneFromOpportunity(), true);
    }
}