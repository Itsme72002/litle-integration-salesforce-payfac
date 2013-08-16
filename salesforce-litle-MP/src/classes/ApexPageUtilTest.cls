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
