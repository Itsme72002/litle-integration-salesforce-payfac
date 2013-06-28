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
private class LitleConstantsTest {

    static testMethod void testGetResponseMessage() {
    	System.assertEquals(null, LitleConstants.getResponseMessage('test'));
    	System.assertEquals(LitleConstants.RESPONSE_APPROVED_MESSAGE, LitleConstants.getResponseMessage(LitleConstants.RESPONSE_APPROVED));
    	System.assertEquals(LitleConstants.RESPONSE_MANUAL_REVIEW_MESSAGE, LitleConstants.getResponseMessage(LitleConstants.RESPONSE_MANUAL_REVIEW));
    	System.assertEquals(LitleConstants.RESPONSE_RETRY_MESSAGE, LitleConstants.getResponseMessage(LitleConstants.RESPONSE_RETRY));
    	System.assertEquals(LitleConstants.RESPONSE_MANUAL_REVIEW_DUPLICATE_MESSAGE, LitleConstants.getResponseMessage(LitleConstants.RESPONSE_MANUAL_REVIEW_DUPLICATE));
    	System.assertEquals(LitleConstants.RESPONSE_DUPLICATE_MESSAGE, LitleConstants.getResponseMessage(LitleConstants.RESPONSE_DUPLICATE));
    	System.assertEquals(LitleConstants.RESPONSE_DECLINED_MESSAGE, LitleConstants.getResponseMessage(LitleConstants.RESPONSE_DECLINED));
    	System.assertEquals(LitleConstants.RESPONSE_MANUAL_REVIEW_BACKGROUND_CHECK_ERROR_MESSAGE, LitleConstants.getResponseMessage(LitleConstants.RESPONSE_MANUAL_REVIEW_BACKGROUND_CHECK_ERROR));
        // TO DO: implement unit test
    }
}