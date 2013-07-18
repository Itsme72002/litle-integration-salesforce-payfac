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