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
	
	// Test for username
    static testMethod void testUsername() {
    	LoginControl loginControl = new LoginControl() ;
        // Check if the username is null initially
        System.assertEquals(loginControl.getUsername(), null);
        String uname = 'test';
        loginControl.setUsername(uname);
        // First check if the value is set
        System.assertNotEquals(loginControl.getUsername(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(loginControl.getUsername(), uname);
    }
    
    // Test for password
    static testMethod void testPassword() {
    	LoginControl loginControl = new LoginControl() ;
        // Check if the password is null initially
        System.assertEquals(loginControl.getPassword(), null);
        String password = 'test';
        loginControl.setPassword(password);
        // First check if the value is set
        System.assertNotEquals(loginControl.getPassword(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(loginControl.getPassword(), password);
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
}