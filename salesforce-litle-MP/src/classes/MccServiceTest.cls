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
private class MccServiceTest {

    static testMethod void getAllMccForUser_Success() {
    	MccService service = new MccService();
    	List<String> expectedMcc = new List<String>();
    	expectedMcc.add('5960');
    	expectedMcc.add('5964');
    	expectedMcc.add('5965');
    	expectedMcc.add('8220');
    	Test.startTest();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new MccSuccessResponse(), null));
    	List<String> actualMcc = service.getAllMccForUser('user', 'pass', 'endpoint');
        System.assertEquals(expectedMcc, actualMcc);
        Test.stopTest();
    }
    
    static testMethod void getAllMccForUser_Error() {
    	MccService service = new MccService();
    	List<String> actualMcc = service.getAllMccForUser('', 'pass', 'endpoint');
        System.assertEquals(null, actualMcc);
        
        actualMcc = service.getAllMccForUser('user', '', 'endpoint');
        System.assertEquals(null, actualMcc);
        
        actualMcc = service.getAllMccForUser(null, 'pass', 'endpoint');
        System.assertEquals(null, actualMcc);
        
        actualMcc = service.getAllMccForUser('user', null, 'endpoint');
        System.assertEquals(null, actualMcc);
        
        actualMcc = service.getAllMccForUser('user', 'pass', '');
        System.assertEquals(null, actualMcc);
        
        actualMcc = service.getAllMccForUser('user', 'pass', null);
        System.assertEquals(null, actualMcc);
        
        Test.startTest();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
    	actualMcc = service.getAllMccForUser('user', 'pass', 'endpoint');
        System.assertEquals(null, actualMcc);
        Test.stopTest();
    }
    
    static testMethod void getAllMccForUser_Invalid() {
    	MccService service = new MccService();
    	Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(false), null));
        List<String> actualMcc = service.getAllMccForUser('user', 'pass', 'endpoint');
        System.assertEquals(0, actualMcc.size());
        Test.stopTest();
    }
    
    static testMethod void getMccSelectOptionsForUser_Success(){
    	MccService service = new MccService();
    	List<Selectoption> expectedMccSelectOptions = new List<Selectoption>();
    	expectedMccSelectOptions.add(new Selectoption('5960', '5960'));
    	expectedMccSelectOptions.add(new Selectoption('5964', '5964'));
    	expectedMccSelectOptions.add(new Selectoption('5965', '5965'));
    	expectedMccSelectOptions.add(new Selectoption('8220','8220'));
    	Test.startTest();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new MccSuccessResponse(), null));
    	List<Selectoption> actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', 'endpoint');
        System.assertEquals(expectedMccSelectOptions, actualMccSelectOptions);
        Test.stopTest();
    }
    
    static testMethod void getMccSelectOptionsForUser_Error() {
    	MccService service = new MccService();
    	List<Selectoption> actualMccSelectOptions = service.getMccSelectOptionsForUser('', 'pass', 'endpoint');
        System.assertEquals(null, actualMccSelectOptions);
        
        actualMccSelectOptions = service.getMccSelectOptionsForUser('user', '', 'endpoint');
        System.assertEquals(null, actualMccSelectOptions);
        
        actualMccSelectOptions = service.getMccSelectOptionsForUser(null, 'pass', 'endpoint');
        System.assertEquals(null, actualMccSelectOptions);
        
        actualMccSelectOptions = service.getMccSelectOptionsForUser('user', null, 'endpoint');
        System.assertEquals(null, actualMccSelectOptions);
        
        actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', '');
        System.assertEquals(null, actualMccSelectOptions);
        
        actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', null);
        System.assertEquals(null, actualMccSelectOptions);
        
        Test.startTest();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
    	actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', 'endpoint');
        System.assertEquals(null, actualMccSelectOptions);
        Test.stopTest();
    }
    
    static testMethod void getMccSelectOptionsForUser_Invalid() {
    	MccService service = new MccService();
    	Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(false), null));
        List<Selectoption>  actualMccSelectOptions = service.getMccSelectOptionsForUser('user', 'pass', 'endpoint');
        System.assert(actualMccSelectOptions.isEmpty());
        Test.stopTest();
     }
}