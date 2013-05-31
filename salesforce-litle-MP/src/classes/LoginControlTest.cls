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
private class LoginControlTest {
	
	// Test for account
    static testMethod void testAccount() {
    	LoginControl loginControl = new LoginControl() ;
        // Check if the account is null initially
        System.assertEquals(loginControl.getAccount(), null);
        Account account = new Account(name='testAccount');
        loginControl.setAccount(account);
        // First check if the value is set
        System.assertNotEquals(loginControl.getAccount(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(loginControl.getAccount().name, account.name);
    }
	
	
	// Test for accountName
    static testMethod void testAccountName() {
    	LoginControl loginControl = new LoginControl() ;
        // Check if the accountName is null initially
        System.assertEquals(loginControl.getAccountName(), null);
        String accountName = 'test';
        loginControl.setAccountName(accountName);
        // First check if the value is set
        System.assertNotEquals(loginControl.getAccountName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(loginControl.getAccountName(), accountName);
    }
    
    // Test for accountNumber
    static testMethod void testAccountNumber() {
    	LoginControl loginControl = new LoginControl() ;
        // Check if the accountNumber is null initially
        System.assertEquals(loginControl.getAccountNumber(), null);
        String accountNumber = 'test';
        loginControl.setAccountNumber(accountNumber);
        // First check if the value is set
        System.assertNotEquals(loginControl.getAccountNumber(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(loginControl.getAccountNumber(), accountNumber);
    }
    
    // Test for billingCity
    static testMethod void testBillingCity() {
    	LoginControl loginControl = new LoginControl() ;
        // Check if the billingCity is null initially
        System.assertEquals(loginControl.getBillingCity(), null);
        String billingCity = 'lowell';
        loginControl.setBillingCity(billingCity);
        // First check if the value is set
        System.assertNotEquals(loginControl.getBillingCity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(loginControl.getBillingCity(), billingCity);
    }
    
    //Test for billingState
     static testMethod void testBillingState() {
    	LoginControl loginControl = new LoginControl() ;
        // Check if the billingState is null initially
        System.assertEquals(loginControl.getBillingState(), null);
        String billingState = 'MA';
        loginControl.setBillingState(billingState);
        // First check if the value is set
        System.assertNotEquals(loginControl.getBillingState(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(loginControl.getBillingState(), billingState);
    }
    
     // Test for status
    static testMethod void testStatus() {
    	LoginControl loginControl = new LoginControl() ;
        // Check if the status is null initially
        System.assertEquals(loginControl.getStatus(), null);
        String status = 'true';
        loginControl.setStatus(status);
        // First check if the value is set
        System.assertNotEquals(loginControl.getStatus(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(loginControl.getStatus(), status);
    }
    
    // Test case for submit action
    static testMethod void testSubmit(){
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
    	LoginControl loginControl = new LoginControl();
    	// Check if the status is null initially
        System.assertEquals(loginControl.getStatus(), null);
    	loginControl.submit();
    	// Check if status is OK
    	System.assertEquals(loginControl.getStatus(), 'OK');
    }
    
    // Test case for http response 
    static testMethod void testGetApiResponse(){
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
    	LoginControl loginControl = new LoginControl();
    	HttpResponse res = loginControl.getApiResponse();
    	// Check if the status of response is OK
        System.assertEquals(res.getStatus(), 'OK');
    }
    
    //Testing the LoginControl Constructor
    static testMethod void testStandardControllerConstructor(){
    	Account account = new Account(name='testAccount', billingState='MA', billingCity='lowell');
    	insert account;
    	ApexPages.StandardController controller = new Apexpages.Standardcontroller(account);
    	LoginControl loginControl = new LoginControl(controller);
    	System.assertEquals(loginControl.getAccountName(), account.name);
    	System.assertEquals(loginControl.getBillingCity(), account.billingCity);
    	System.assertEquals(loginControl.getBillingState(), account.billingState);
    }
}