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