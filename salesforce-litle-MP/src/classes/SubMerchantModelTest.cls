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
        /*System.assertEquals(subMerchantModel.getSubMerchantAddress().getStreetAddress1(), address.getStreetaddress1());
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getStreetAddress2(), address.getStreetaddress2());
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getCity(), address.getCity());
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getPostalCode(), address.getPostalCode());
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getCountryCode(), address.getCountryCode());
        System.assertEquals(subMerchantModel.getSubMerchantAddress().getStateProvince(), address.getStateProvince());*/
    }
    /*static testMethod void subMerchantStreetAddress1(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
		// Check if the subMerchantStreetAddress1 is null initially
        System.assertEquals(subMerchantModel.getSubMerchantStreetAddress1(), null);
        subMerchantModel.setSubMerchantStreetAddress1(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantModel.getSubMerchantStreetAddress1(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantModel.getSubMerchantStreetAddress1(), testString);
	}
	static testMethod void subMerchantStreetAddress2(){
			SubMerchantModel subMerchantModel = new SubMerchantModel();
			// Check if the subMerchantStreetAddress2 is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantStreetAddress2(), null);
	        subMerchantModel.setSubMerchantStreetAddress2(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantStreetAddress2(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantStreetAddress2(), testString);
	}
	static testMethod void subMerchantCity(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCity is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantCity(), null);
	        subMerchantModel.setSubMerchantCity(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantCity(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantCity(), testString);
	}
	static testMethod void subMerchantStateProvince(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantStateProvince is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantStateProvince(), null);
	        subMerchantModel.setSubMerchantStateProvince(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantStateProvince(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantStateProvince(), testString);
	}
	static testMethod void subMerchantPostalCode(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantPostalCode is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantPostalCode(), null);
	        subMerchantModel.setSubMerchantPostalCode(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantPostalCode(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantPostalCode(), testString);
	}
	static testMethod void subMerchantCountryCode(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCountryCode is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantCountryCode(), null);
	        subMerchantModel.setSubMerchantCountryCode(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantCountryCode(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantCountryCode(), testString);
	}*/
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
	/*static testMethod void subMerchantFirstName(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantFirstName is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantFirstName(), null);
	        subMerchantModel.setSubMerchantFirstName(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantFirstName(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantFirstName(), testString);
	}
	static testMethod void subMerchantLastName(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantLastName is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantLastName(), null);
	        subMerchantModel.setSubMerchantLastName(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantLastName(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantLastName(), testString);
	}
	static testMethod void subMerchantEmailAddress(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantEmailAddress is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantEmailAddress(), null);
	        subMerchantModel.setSubMerchantEmailAddress(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantEmailAddress(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantEmailAddress(), testString);
	}
	static testMethod void subMerchantPhone(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantPhone is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantPhone(), null);
	        subMerchantModel.setSubMerchantPhone(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantPhone(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantPhone(), testString);
	}*/
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
	/*
	// Default textbox values
	static testMethod void subMerchantStreetAddress1DefaultDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantStreetAddress1Default is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantStreetAddress1Default(), null);
	        subMerchantModel.setSubMerchantStreetAddress1Default(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantStreetAddress1Default(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantStreetAddress1Default(), testString);
	}
	static testMethod void subMerchantStreetAddress2Default(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantStreetAddress2Default is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantStreetAddress2Default(), null);
	        subMerchantModel.setSubMerchantStreetAddress2Default(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantStreetAddress2Default(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantStreetAddress2Default(), testString);
	}
	static testMethod void subMerchantCityDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCityDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantCityDefault(), null);
	        subMerchantModel.setSubMerchantCityDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantCityDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantCityDefault(), testString);
	}
	static testMethod void subMerchantStateProvinceDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantStateProvinceDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantStateProvinceDefault(), null);
	        subMerchantModel.setSubMerchantStateProvinceDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantStateProvinceDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantStateProvinceDefault(), testString);
	}
	static testMethod void subMerchantPostalCodeDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantPostalCodeDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantPostalCodeDefault(), null);
	        subMerchantModel.setSubMerchantPostalCodeDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantPostalCodeDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantPostalCodeDefault(), testString);
	}
	static testMethod void subMerchantCountryCodeDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCountryCodeDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantCountryCodeDefault(), null);
	        subMerchantModel.setSubMerchantCountryCodeDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantCountryCodeDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantCountryCodeDefault(), testString);
	}
	static testMethod void subMerchantAmexMidDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantAmexMidDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantAmexMidDefault(), null);
	        subMerchantModel.setSubMerchantAmexMidDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantAmexMidDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantAmexMidDefault(), testString);
	}
	static testMethod void subMerchantBankAccountNumberDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantBankAccountNumberDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantBankAccountNumberDefault(), null);
	        subMerchantModel.setSubMerchantBankAccountNumberDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantBankAccountNumberDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantBankAccountNumberDefault(), testString);
	}
	static testMethod void subMerchantBankRoutingNumberDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantBankRoutingNumberDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantBankRoutingNumberDefault(), null);
	        subMerchantModel.setSubMerchantBankRoutingNumberDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantBankRoutingNumberDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantBankRoutingNumberDefault(), testString);
	}
	static testMethod void subMerchantCreateCredentialsDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCreateCredentialsDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantCreateCredentialsDefault(), null);
	        subMerchantModel.setSubMerchantCreateCredentialsDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantCreateCredentialsDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantCreateCredentialsDefault(), testString);
	}
	static testMethod void subMerchantCustomerServiceNumberDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCustomerServiceNumberDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantCustomerServiceNumberDefault(), null);
	        subMerchantModel.setSubMerchantCustomerServiceNumberDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantCustomerServiceNumberDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantCustomerServiceNumberDefault(), testString);
	}
	static testMethod void subMerchantDiscoverConveyMidDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantDiscoverConveyMidDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantDiscoverConveyMidDefault(), null);
	        subMerchantModel.setSubMerchantDiscoverConveyMidDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantDiscoverConveyMidDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantDiscoverConveyMidDefault(), testString);
	}
	static testMethod void subMerchantHardCodeBillingDescriptorDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantHardCodeBillingDescriptorDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantHardCodeBillingDescriptorDefault(), null);
	        subMerchantModel.setSubMerchantHardCodeBillingDescriptorDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantHardCodeBillingDescriptorDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantHardCodeBillingDescriptorDefault(), testString);
	}
	static testMethod void subMerchantMaxTransactionAmountDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantMaxTransactionAmountDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantMaxTransactionAmountDefault(), null);
	        subMerchantModel.setSubMerchantMaxTransactionAmountDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantMaxTransactionAmountDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantMaxTransactionAmountDefault(), testString);
	}
	static testMethod void subMerchantMerchantCategoryCodeDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantMerchantCategoryCodeDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantMerchantCategoryCodeDefault(), null);
	        subMerchantModel.setSubMerchantMerchantCategoryCodeDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantMerchantCategoryCodeDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantMerchantCategoryCodeDefault(), testString);
	}
	static testMethod void subMerchantMerchantNameDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantMerchantNameDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantMerchantNameDefault(), null);
	        subMerchantModel.setSubMerchantMerchantNameDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantMerchantNameDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantMerchantNameDefault(), testString);
	}
	static testMethod void subMerchantFirstNameDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantFirstNameDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantFirstNameDefault(), null);
	        subMerchantModel.setSubMerchantFirstNameDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantFirstNameDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantFirstNameDefault(), testString);
	}
	static testMethod void subMerchantLastNameDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantLastNameDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantLastNameDefault(), null);
	        subMerchantModel.setSubMerchantLastNameDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantLastNameDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantLastNameDefault(), testString);
	}
	static testMethod void subMerchantEmailAddressDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantEmailAddressDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantEmailAddressDefault(), null);
	        subMerchantModel.setSubMerchantEmailAddressDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantEmailAddressDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantEmailAddressDefault(), testString);
	}
	static testMethod void subMerchantPhoneDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantPhoneDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantPhoneDefault(), null);
	        subMerchantModel.setSubMerchantPhoneDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantPhoneDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantPhoneDefault(), testString);
	}
	static testMethod void subMerchantPspMerchantIdDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantPspMerchantIdDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantPspMerchantIdDefault(), null);
	        subMerchantModel.setSubMerchantPspMerchantIdDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantPspMerchantIdDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantPspMerchantIdDefault(), testString);
	}
	static testMethod void subMerchantUrlDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantUrlDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchantUrlDefault(), null);
	        subMerchantModel.setSubMerchantUrlDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchantUrlDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchantUrlDefault(), testString);
	}
	static testMethod void subMerchanteCheckBillingDescriptorDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchanteCheckBillingDescriptorDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchanteCheckBillingDescriptorDefault(), null);
	        subMerchantModel.setSubMerchanteCheckBillingDescriptorDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchanteCheckBillingDescriptorDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchanteCheckBillingDescriptorDefault(), testString);
	}
	static testMethod void subMerchanteCheckCompanyNameDefault(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchanteCheckCompanyNameDefault is null initially
	        System.assertEquals(subMerchantModel.getSubMerchanteCheckCompanyNameDefault(), null);
	        subMerchantModel.setSubMerchanteCheckCompanyNameDefault(testString);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getSubMerchanteCheckCompanyNameDefault(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getSubMerchanteCheckCompanyNameDefault(), testString);
	}
	
	//Enabled-Disabled flags
	static testMethod void isSubMerchantStreetAddress1DefaultDisabledDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantStreetAddress1DefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantStreetAddress1DefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantStreetAddress1DefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantStreetAddress1DefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantStreetAddress1DefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantStreetAddress2DefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantStreetAddress2DefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantStreetAddress2DefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantStreetAddress2DefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantStreetAddress2DefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantStreetAddress2DefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantCityDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCityDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantCityDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantCityDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantCityDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantCityDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantStateProvinceDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantStateProvinceDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantStateProvinceDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantStateProvinceDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantStateProvinceDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantStateProvinceDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantPostalCodeDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantPostalCodeDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantPostalCodeDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantPostalCodeDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantPostalCodeDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantPostalCodeDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantCountryCodeDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCountryCodeDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantCountryCodeDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantCountryCodeDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantCountryCodeDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantCountryCodeDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantAmexMidDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantAmexMidDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantAmexMidDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantAmexMidDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantAmexMidDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantAmexMidDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantBankAccountNumberDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantBankAccountNumberDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantBankAccountNumberDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantBankAccountNumberDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantBankAccountNumberDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantBankAccountNumberDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantBankRoutingNumberDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantBankRoutingNumberDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantBankRoutingNumberDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantBankRoutingNumberDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantBankRoutingNumberDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantBankRoutingNumberDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantCreateCredentialsDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCreateCredentialsDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantCreateCredentialsDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantCreateCredentialsDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantCreateCredentialsDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantCreateCredentialsDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantCustomerServiceNumberDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantCustomerServiceNumberDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantCustomerServiceNumberDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantCustomerServiceNumberDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantCustomerServiceNumberDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantCustomerServiceNumberDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantDiscoverConveyMidDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantDiscoverConveyMidDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantDiscoverConveyMidDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantDiscoverConveyMidDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantDiscoverConveyMidDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantDiscoverConveyMidDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantHardCodeBillingDescriptorDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantHardCodeBillingDescriptorDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantHardCodeBillingDescriptorDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantHardCodeBillingDescriptorDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantHardCodeBillingDescriptorDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantHardCodeBillingDescriptorDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantMaxTransactionAmountDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantMaxTransactionAmountDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantMaxTransactionAmountDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantMaxTransactionAmountDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantMaxTransactionAmountDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantMaxTransactionAmountDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantMerchantCategoryCodeDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantMerchantCategoryCodeDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantMerchantCategoryCodeDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantMerchantCategoryCodeDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantMerchantCategoryCodeDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantMerchantCategoryCodeDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantMerchantNameDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantMerchantNameDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantMerchantNameDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantMerchantNameDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantMerchantNameDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantMerchantNameDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantFirstNameDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantFirstNameDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantFirstNameDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantFirstNameDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantFirstNameDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantFirstNameDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantLastNameDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantLastNameDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantLastNameDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantLastNameDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantLastNameDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantLastNameDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantEmailAddressDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantEmailAddressDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantEmailAddressDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantEmailAddressDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantEmailAddressDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantEmailAddressDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantPhoneDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantPhoneDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantPhoneDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantPhoneDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantPhoneDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantPhoneDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantPspMerchantIdDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantPspMerchantIdDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantPspMerchantIdDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantPspMerchantIdDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantPspMerchantIdDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantPspMerchantIdDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchantUrlDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchantUrlDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchantUrlDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchantUrlDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchantUrlDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchantUrlDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchanteCheckBillingDescriptorDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchanteCheckBillingDescriptorDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchanteCheckBillingDescriptorDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchanteCheckBillingDescriptorDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchanteCheckBillingDescriptorDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchanteCheckBillingDescriptorDefaultDisabled(), testBoolean);
	}
	static testMethod void isSubMerchanteCheckCompanyNameDefaultDisabled(){
		SubMerchantModel subMerchantModel = new SubMerchantModel();
	// Check if the subMerchanteCheckCompanyNameDefaultDisabled is null initially
	        System.assertEquals(subMerchantModel.getIsSubMerchanteCheckCompanyNameDefaultDisabled(), null);
	        subMerchantModel.setIsSubMerchanteCheckCompanyNameDefaultDisabled(testBoolean);
	        // First check if the value is set
	        System.assertNotEquals(subMerchantModel.getIsSubMerchanteCheckCompanyNameDefaultDisabled(), null);
	        // and then confirm if the value is set correctly
	        System.assertEquals(subMerchantModel.getIsSubMerchanteCheckCompanyNameDefaultDisabled(), testBoolean);
	}*/
}