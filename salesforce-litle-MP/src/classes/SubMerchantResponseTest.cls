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
private class SubMerchantResponseTest {

    public static final String testString = 'test';

    static testMethod void testTransactionId(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getTransactionId(), null);
        subMerchantResponse.setTransactionId(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getTransactionId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getTransactionId(), testString);
    }
    
    static testMethod void testSubMerchantId(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getSubMerchantId(), null);
        subMerchantResponse.setSubMerchantId(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getSubMerchantId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getSubMerchantId(), testString);
    }
    
    static testMethod void testMerchantIdentString(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getMerchantIdentString(), null);
        subMerchantResponse.setMerchantIdentString(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getMerchantIdentString(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getMerchantIdentString(), testString);
    }
    
    static testMethod void testUserCredential(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
    	Credential credential = new Credential();
    	credential.setUserName(testString);
    	credential.setPassword(testString);
        // Check null initially
        System.assertEquals(subMerchantResponse.getUserCredential(), null);
        subMerchantResponse.setUserCredential(credential);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getUserCredential(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getUserCredential(), credential);
    }
    
    static testMethod void testPayPageCredential(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
    	Credential credential = new Credential();
    	credential.setUserName(testString);
    	credential.setPassword(testString);
        // Check null initially
        System.assertEquals(subMerchantResponse.getPayPageCredential(), null);
        subMerchantResponse.setPayPageCredential(credential);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getPayPageCredential(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getPayPageCredential(), credential);
    }
    
    static testMethod void testAmexMid(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getAmexMid(), null);
        subMerchantResponse.setAmexMid(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getAmexMid(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getAmexMid(), testString);
    }
    
    static testMethod void testBankAccountNumber(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getBankAccountNumber(), null);
        subMerchantResponse.setBankAccountNumber(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getBankAccountNumber(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getBankAccountNumber(), testString);
    }
    
    static testMethod void testBankRoutingNumber(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getBankRoutingNumber(), null);
        subMerchantResponse.setBankRoutingNumber(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getBankRoutingNumber(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getBankRoutingNumber(), testString);
    }
    
    static testMethod void testCustomerServiceNumber(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getCustomerServiceNumber(), null);
        subMerchantResponse.setCustomerServiceNumber(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getCustomerServiceNumber(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getCustomerServiceNumber(), testString);
    }
    
    static testMethod void testDiscoverConveyMid(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getDiscoverConveyMid(), null);
        subMerchantResponse.setDiscoverConveyMid(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getDiscoverConveyMid(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getDiscoverConveyMid(), testString);
    }
    
    static testMethod void testHardCodedBillingDescriptor(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getHardCodedBillingDescriptor(), null);
        subMerchantResponse.setHardCodedBillingDescriptor(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getHardCodedBillingDescriptor(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getHardCodedBillingDescriptor(), testString);
    }
    
    static testMethod void testMaxTransactionAmount(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getMaxTransactionAmount(), null);
        subMerchantResponse.setMaxTransactionAmount(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getMaxTransactionAmount(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getMaxTransactionAmount(), testString);
    }
    
    static testMethod void testMerchantCategoryCode(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getMerchantCategoryCode(), null);
        subMerchantResponse.setMerchantCategoryCode(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getMerchantCategoryCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getMerchantCategoryCode(), testString);
    }
    
    static testMethod void testMerchantName(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getMerchantName(), null);
        subMerchantResponse.setMerchantName(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getMerchantName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getMerchantName(), testString);
    }
    
    static testMethod void testUrl(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getUrl(), null);
        subMerchantResponse.setUrl(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getUrl(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getUrl(), testString);
    }
    
    static testMethod void testDisabled(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getDisabled(), null);
        subMerchantResponse.setDisabled(testString);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getDisabled(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getDisabled(), testString);
    }
    
    static testMethod void testOriginalSubMerchantAddress(){
    	SubMerchantResponse subMerchantResponse = new SubMerchantResponse();
        // Check null initially
        System.assertEquals(subMerchantResponse.getOriginalSubMerchantAddress(), null);
        Address address = new Address();
    	address.setStreetaddress1(testString);
    	address.setStreetAddress2(testString);
    	address.setCity(testString);
    	address.setStateProvince(testString);
    	address.setPostalCode(testString);
    	address.setCountryCode(testString);
    	subMerchantResponse.setOriginalSubMerchantAddress(address);
        // First check if the value is set
        System.assertNotEquals(subMerchantResponse.getOriginalSubMerchantAddress(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(subMerchantResponse.getOriginalSubMerchantAddress(), address);
        
    }
}