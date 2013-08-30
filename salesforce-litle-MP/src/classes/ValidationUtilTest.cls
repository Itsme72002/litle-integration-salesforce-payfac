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
private class ValidationUtilTest {

	static testMethod void testValidateString() {
    	String testString = 'test';
        System.assertEquals(ValidationUtil.validateString(testString, 10), true);
        System.assertEquals(ValidationUtil.validateString(testString, 2), false);
        System.assertEquals(ValidationUtil.validateString('', 2), false);
        System.assertEquals(ValidationUtil.validateString(null, 2), false);
    }
    
    static testMethod void testValidateStringWithinLimits() {
    	String testString = 'test';
        System.assertEquals(ValidationUtil.validateStringWithinLimits(testString, 1, 10), true);
        System.assertEquals(ValidationUtil.validateStringWithinLimits(testString, 10, 12), false);
        System.assertEquals(ValidationUtil.validateStringWithinLimits(testString, 1, 3), false);
        System.assertEquals(ValidationUtil.validateStringWithinLimits('', 2, 10), false);
        System.assertEquals(ValidationUtil.validateStringWithinLimits(null, 2, 10), false);
    }
    
    static testMethod void testValidateDate(){
    	System.assertEquals(ValidationUtil.validateDate('20123-06-07'), false);
    	System.assertEquals(ValidationUtil.validateDate('2013-06-07'), true);
    	System.assertEquals(ValidationUtil.validateDate('06-07-2012'), false);
    	System.assertEquals(ValidationUtil.validateDate('06/07/2012'), false);
    	System.assertEquals(ValidationUtil.validateDate(''), false);
    	System.assertEquals(ValidationUtil.validateDate(null), false);
    }
    
    static testMethod void testValidateBoolean(){
    	System.assertEquals(ValidationUtil.validateBoolean('false'), true);
    	System.assertEquals(ValidationUtil.validateBoolean('True'), true);
    	System.assertEquals(ValidationUtil.validateBoolean('abc'), false);
    	System.assertEquals(ValidationUtil.validateBoolean(''), false);
    	System.assertEquals(ValidationUtil.validateBoolean(null), false);
    }
    
    static testMethod void testValidateInteger(){
    	System.assertEquals(ValidationUtil.validateInteger('true'), false);
    	System.assertEquals(ValidationUtil.validateInteger('abc123'), false);
    	System.assertEquals(ValidationUtil.validateInteger('123'), true);
    	System.assertEquals(ValidationUtil.validateInteger(''), false);
    	System.assertEquals(ValidationUtil.validateInteger(null), false);
    	
    }
    
    static testMethod void testValidateIntegerValue(){
    	List<Integer> values = new List<Integer>();
    	values.add(1);
    	values.add(2);
    	values.add(3);
    	
    	System.assertEquals(ValidationUtil.validateIntegerValue('1', values), true);
    	System.assertEquals(ValidationUtil.validateIntegerValue('abc', values), false);
    	System.assertEquals(ValidationUtil.validateIntegerValue('abc123', values), false);
    	System.assertEquals(ValidationUtil.validateIntegerValue('9', values), false);
    	System.assertEquals(ValidationUtil.validateIntegerValue('', values), false);
    	System.assertEquals(ValidationUtil.validateIntegerValue(null, values), false);
    }
    
}