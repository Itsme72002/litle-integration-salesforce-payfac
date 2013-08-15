@isTest
private class StringUtilTest {

    static testMethod void testGetMaskCharacters(){
    	System.assertEquals('', StringUtil.getMaskCharacters(''));
    	System.assertEquals('****', StringUtil.getMaskCharacters('this'));
    }
}