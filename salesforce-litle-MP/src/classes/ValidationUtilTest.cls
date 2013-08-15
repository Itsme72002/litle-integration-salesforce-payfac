@isTest
private class ValidationUtilTest {

	static testMethod void testValidateString() {
    	String testString = 'test';
        System.assertEquals(ValidationUtil.validateString(testString, 10), true);
        System.assertEquals(ValidationUtil.validateString(testString, 2), false);
        System.assertEquals(ValidationUtil.validateString('', 2), false);
        System.assertEquals(ValidationUtil.validateString(null, 2), false);
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