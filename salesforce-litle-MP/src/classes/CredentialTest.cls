@isTest
private class CredentialTest {

    public static final String testString = 'test';

    static testMethod void testUserName(){
    	Credential credential = new Credential();
        // Check if the account is null initially
        System.assertEquals(credential.getUserName(), null);
        credential.setUserName(testString);
        // First check if the value is set
        System.assertNotEquals(credential.getUserName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(credential.getUserName(), testString);
    }
    
    static testMethod void testPassword(){
    	Credential credential = new Credential();
        // Check if the account is null initially
        System.assertEquals(credential.getPassword(), null);
        credential.setPassword(testString);
        // First check if the value is set
        System.assertNotEquals(credential.getPassword(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(credential.getPassword(), testString);
    }
}