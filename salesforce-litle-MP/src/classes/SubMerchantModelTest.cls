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
private class SubMerchantModelTest {

	private static final String testString = 'test';
	private static final Boolean testBoolean = true;
	
	static testMethod void testSubMerchantAddress(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
    	Address address = new Address();
    	address.setStreetaddress1(testString);
    	address.setStreetAddress2(testString);
    	address.setCity(testString);
    	address.setStateProvince(testString);
    	address.setPostalCode(testString);
    	address.setCountryCode(testString);
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getStreetAddress1(), null);
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getStreetAddress2(), null);
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getCity(), null);
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getStateProvince(), null);
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getPostalCode(), null);
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getCountryCode(), null);
        subMerchantModel.setSubMerchantAddress(address);
        // First check if the value is set
        System.assertNotEquals(subMerchantModel.getSubMerchantAddress(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantModel.getSubMerchantAddress(), address);
    }
	static testMethod void subMerchantAmexMid(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantAmexMid is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantAmexMid(), null);
	        subMerchantModel.setSubMerchantAmexMid(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantAmexMid(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantAmexMid(), testString);
	}
	static testMethod void subMerchantBankAccountNumber(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantBankAccountNumber is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantBankAccountNumber(), null);
	        subMerchantModel.setSubMerchantBankAccountNumber(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantBankAccountNumber(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantBankAccountNumber(), testString);
	}
	static testMethod void subMerchantBankRoutingNumber(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantBankRoutingNumber is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantBankRoutingNumber(), null);
	        subMerchantModel.setSubMerchantBankRoutingNumber(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantBankRoutingNumber(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantBankRoutingNumber(), testString);
	}
	static testMethod void subMerchantCreateCredentials(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCreateCredentials is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantCreateCredentials(), null);
	        subMerchantModel.setSubMerchantCreateCredentials(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantCreateCredentials(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantCreateCredentials(), testString);
	}
	static testMethod void subMerchantCustomerServiceNumber(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCustomerServiceNumber is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantCustomerServiceNumber(), null);
	        subMerchantModel.setSubMerchantCustomerServiceNumber(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantCustomerServiceNumber(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantCustomerServiceNumber(), testString);
	}
	static testMethod void subMerchantDiscoverConveyMid(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantDiscoverConveyMid is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantDiscoverConveyMid(), null);
	        subMerchantModel.setSubMerchantDiscoverConveyMid(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantDiscoverConveyMid(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantDiscoverConveyMid(), testString);
	}
	static testMethod void subMerchantHardCodeBillingDescriptor(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantHardCodeBillingDescriptor is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantHardCodeBillingDescriptor(), null);
	        subMerchantModel.setSubMerchantHardCodeBillingDescriptor(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantHardCodeBillingDescriptor(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantHardCodeBillingDescriptor(), testString);
	}
	static testMethod void subMerchantMaxTransactionAmount(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantMaxTransactionAmount is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantMaxTransactionAmount(), null);
	        subMerchantModel.setSubMerchantMaxTransactionAmount(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantMaxTransactionAmount(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantMaxTransactionAmount(), testString);
	}
	static testMethod void subMerchantMerchantCategoryCode(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantMerchantCategoryCode is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantMerchantCategoryCode(), null);
	        subMerchantModel.setSubMerchantMerchantCategoryCode(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantMerchantCategoryCode(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantMerchantCategoryCode(), testString);
	}
	static testMethod void subMerchantMerchantName(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantMerchantName is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantMerchantName(), null);
	        subMerchantModel.setSubMerchantMerchantName(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantMerchantName(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantMerchantName(), testString);
	}
	static testMethod void testSubMerchantPrimaryContact(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
    	PrimaryContact primaryContact = new PrimaryContact();
        primaryContact.setFirstName(testString);
		primaryContact.setLastName(testString);
		primaryContact.setEmailAddress(testString);
		primaryContact.setPhone(testString);
		subMerchantModel.setSubMerchantPrimaryContact(primaryContact);
        // First check if the value is set
        System.assertNotEquals(subMerchantModel.getSubMerchantPrimaryContact(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantModel.getSubMerchantPrimaryContact(), primaryContact);
    }
	static testMethod void subMerchantPspMerchantId(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantPspMerchantId is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantPspMerchantId(), null);
	        subMerchantModel.setSubMerchantPspMerchantId(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantPspMerchantId(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantPspMerchantId(), testString);
	}
	static testMethod void subMerchantUrl(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantUrl is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantUrl(), null);
	        subMerchantModel.setSubMerchantUrl(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantUrl(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantUrl(), testString);
	}
	static testMethod void subMerchanteCheckBillingDescriptor(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchanteCheckBillingDescriptor is null initially
	        System.assertEquals(subMerchantModel.getSubMerchanteCheckBillingDescriptor(), null);
	        subMerchantModel.setSubMerchanteCheckBillingDescriptor(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchanteCheckBillingDescriptor(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchanteCheckBillingDescriptor(), testString);
	}
	static testMethod void subMerchanteCheckCompanyName(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchanteCheckCompanyName is null initially
	        System.assertEquals(subMerchantModel.getSubMerchanteCheckCompanyName(), null);
	        subMerchantModel.setSubMerchanteCheckCompanyName(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchanteCheckCompanyName(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchanteCheckCompanyName(), testString);
	}
	
	
	static testMethod void testIsSubMerchantAmexMidFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantAmexMidFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantAmexMidFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantAmexMidFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantAmexMidFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantBankAccountNumberFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantBankAccountNumberFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantBankAccountNumberFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantBankAccountNumberFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantBankAccountNumberFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantBankRoutingNumberFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantBankRoutingNumberFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantBankRoutingNumberFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantBankRoutingNumberFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantBankRoutingNumberFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantCreateCredentialsFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantCreateCredentialsFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantCreateCredentialsFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantCreateCredentialsFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantCreateCredentialsFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantCustomerServiceNumberFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantCustomerServiceNumberFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantCustomerServiceNumberFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantCustomerServiceNumberFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantCustomerServiceNumberFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantDiscoverConveyMidFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantDiscoverConveyMidFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantDiscoverConveyMidFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantDiscoverConveyMidFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantDiscoverConveyMidFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantHardCodeBillingDescriptorFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantHardCodeBillingDescriptorFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantHardCodeBillingDescriptorFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantHardCodeBillingDescriptorFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantHardCodeBillingDescriptorFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantMaxTransactionAmountFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantMaxTransactionAmountFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantMaxTransactionAmountFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantMaxTransactionAmountFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantMaxTransactionAmountFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantMerchantCategoryCodeFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantMerchantCategoryCodeFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantMerchantCategoryCodeFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantMerchantCategoryCodeFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantMerchantCategoryCodeFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantMerchantNameFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantMerchantNameFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantMerchantNameFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantMerchantNameFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantMerchantNameFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantPspMerchantIdFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantPspMerchantIdFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantPspMerchantIdFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantPspMerchantIdFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantPspMerchantIdFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchantUrlFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchantUrlFromOpportunity(), false);
        subMerchantModel.setIsSubMerchantUrlFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchantUrlFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchantUrlFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchanteCheckBillingDescriptorFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchanteCheckBillingDescriptorFromOpportunity(), false);
        subMerchantModel.setIsSubMerchanteCheckBillingDescriptorFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchanteCheckBillingDescriptorFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchanteCheckBillingDescriptorFromOpportunity(), true);
    }
    static testMethod void testIsSubMerchanteCheckCompanyNameFromOpportunity(){
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        // Check if the account Is null initially
        System.assertEquals(subMerchantModel.getIsSubMerchanteCheckCompanyNameFromOpportunity(), false);
        subMerchantModel.setIsSubMerchanteCheckCompanyNameFromOpportunity(true);
        // Last check if the value Is set
        System.assertNotEquals(subMerchantModel.getIsSubMerchanteCheckCompanyNameFromOpportunity(), null);
        // and then confirm if the value Is set correctly
        System.assertEquals(subMerchantModel.getIsSubMerchanteCheckCompanyNameFromOpportunity(), true);
    }
}
