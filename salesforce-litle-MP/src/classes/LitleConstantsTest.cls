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