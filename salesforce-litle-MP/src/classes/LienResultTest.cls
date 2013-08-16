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
private class LienResultTest {

    public static final String testString = 'test';

    static testMethod void testLienyType(){
    	LienResult lienResult = new LienResult();
        // Check if the LienyType is null initially
        System.assertEquals(lienResult.getLienyType(), null);
        lienResult.setLienyType(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getLienyType(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getLienyType(), testString);
    }
    
    static testMethod void testReleasedCount(){
    	LienResult lienResult = new LienResult();
        // Check if the ReleasedCount is null initially
        System.assertEquals(lienResult.getReleasedCount(), null);
        lienResult.setReleasedCount(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getReleasedCount(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getReleasedCount(), testString);
    }
    
    static testMethod void testUnreleasedCount(){
    	LienResult lienResult = new LienResult();
        // Check if the UnreleasedCount is null initially
        System.assertEquals(lienResult.getUnreleasedCount(), null);
        lienResult.setUnreleasedCount(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getUnreleasedCount(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getUnreleasedCount(), testString);
    }
    
    static testMethod void testCompanyName(){
    	LienResult lienResult = new LienResult();
        // Check if the CompanyName is null initially
        System.assertEquals(lienResult.getCompanyName(), null);
        lienResult.setCompanyName(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getCompanyName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getCompanyName(), testString);
    }
    
    static testMethod void testStreetAddress1(){
    	LienResult lienResult = new LienResult();
        // Check if the StreetAddress1 is null initially
        System.assertEquals(lienResult.getStreetAddress1(), null);
        lienResult.setStreetAddress1(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getStreetAddress1(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getStreetAddress1(), testString);
    }
    
    static testMethod void testStreetAddress2(){
    	LienResult lienResult = new LienResult();
        // Check if the StreetAddress2 is null initially
        System.assertEquals(lienResult.getStreetAddress2(), null);
        lienResult.setStreetAddress2(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getStreetAddress2(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getStreetAddress2(), testString);
    }
    
    static testMethod void testCity(){
    	LienResult lienResult = new LienResult();
        // Check if the City is null initially
        System.assertEquals(lienResult.getCity(), null);
        lienResult.setCity(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getCity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getCity(), testString);
    }
    
    static testMethod void testState(){
    	LienResult lienResult = new LienResult();
        // Check if the State is null initially
        System.assertEquals(lienResult.getState(), null);
        lienResult.setState(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getState(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getState(), testString);
    }
    
    static testMethod void testZip(){
    	LienResult lienResult = new LienResult();
        // Check if the Zip is null initially
        System.assertEquals(lienResult.getZip(), null);
        lienResult.setZip(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getZip(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getZip(), testString);
    }
    
    static testMethod void testZip4(){
    	LienResult lienResult = new LienResult();
        // Check if the Zip4 is null initially
        System.assertEquals(lienResult.getZip4(), null);
        lienResult.setZip4(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getZip4(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getZip4(), testString);
    }
    
    static testMethod void testFilingDate(){
    	LienResult lienResult = new LienResult();
        // Check if the FilingDate is null initially
        System.assertEquals(lienResult.getFilingDate(), null);
        lienResult.setFilingDate(testString);
        // First check if the value is set
        System.assertNotEquals(lienResult.getFilingDate(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(lienResult.getFilingDate(), testString);
    }
}
