@isTest
private class ApexPageUtilTest {
	public static final String testMessage = 'test';

    static testMethod void testAddInfoMessage() {
        //check initially no messages
        System.assertEquals(false, Apexpages.hasMessages());
        //check with null
        ApexPageUtil.addInfoMessage(null);
        System.assertEquals(false, Apexpages.hasMessages());
        
        // check with blank message
        ApexPageUtil.addInfoMessage('');
        System.assertEquals(false, Apexpages.hasMessages());
        
        //check with test message
        ApexPageUtil.addInfoMessage(testMessage);
        System.assertEquals(true, Apexpages.hasMessages());
        System.assertEquals(testMessage, Apexpages.getMessages().get(0).getSummary());
        System.assertEquals(ApexPages.Severity.INFO, Apexpages.getMessages().get(0).getSeverity());
    }
    
    static testMethod void testAddErrorMessage() {
        //check initially no messages
        System.assertEquals(false, Apexpages.hasMessages());
        //check with null
        ApexPageUtil.addErrorMessage(null);
        System.assertEquals(false, Apexpages.hasMessages());
        
        // check with blank message
        ApexPageUtil.addErrorMessage('');
        System.assertEquals(false, Apexpages.hasMessages());
        
        //check with test message
        ApexPageUtil.addErrorMessage(testMessage);
        System.assertEquals(true, Apexpages.hasMessages());
        System.assertEquals(testMessage, Apexpages.getMessages().get(0).getSummary());
        System.assertEquals(ApexPages.Severity.ERROR, Apexpages.getMessages().get(0).getSeverity());
    }
    
    static testMethod void testAddConfirmMessage() {
        //check initially no messages
        System.assertEquals(false, Apexpages.hasMessages());
        //check with null
        ApexPageUtil.addConfirmMessage(null);
        System.assertEquals(false, Apexpages.hasMessages());
        
        // check with blank message
        ApexPageUtil.addConfirmMessage('');
        System.assertEquals(false, Apexpages.hasMessages());
        
        //check with test message
        ApexPageUtil.addConfirmMessage(testMessage);
        System.assertEquals(true, Apexpages.hasMessages());
        System.assertEquals(testMessage, Apexpages.getMessages().get(0).getSummary());
        System.assertEquals(ApexPages.Severity.CONFIRM, Apexpages.getMessages().get(0).getSeverity());
    }
    
    static testMethod void testAddFatalMessage() {
        //check initially no messages
        System.assertEquals(false, Apexpages.hasMessages());
        //check with null
        ApexPageUtil.addFatalMessage(null);
        System.assertEquals(false, Apexpages.hasMessages());
        
        // check with blank message
        ApexPageUtil.addFatalMessage('');
        System.assertEquals(false, Apexpages.hasMessages());
        
        //check with test message
        ApexPageUtil.addFatalMessage(testMessage);
        System.assertEquals(true, Apexpages.hasMessages());
        System.assertEquals(testMessage, Apexpages.getMessages().get(0).getSummary());
        System.assertEquals(ApexPages.Severity.FATAL, Apexpages.getMessages().get(0).getSeverity());
    }
    
    static testMethod void testAddWarningMessage() {
        //check initially no messages
        System.assertEquals(false, Apexpages.hasMessages());
        //check with null
        ApexPageUtil.addWarningMessage(null);
        System.assertEquals(false, Apexpages.hasMessages());
        
        // check with blank message
        ApexPageUtil.addWarningMessage('');
        System.assertEquals(false, Apexpages.hasMessages());
        
        //check with test message
        ApexPageUtil.addWarningMessage(testMessage);
        System.assertEquals(true, Apexpages.hasMessages());
        System.assertEquals(testMessage, Apexpages.getMessages().get(0).getSummary());
        System.assertEquals(ApexPages.Severity.WARNING, Apexpages.getMessages().get(0).getSeverity());
    }
}