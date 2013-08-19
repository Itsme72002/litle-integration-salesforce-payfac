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
private class BankruptcyDataTest {

    public static final String testString = 'test';

	
    static testMethod void testBankruptcyType(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the BankruptcyType is null initially
        System.assertEquals(bankruptcyData.getBankruptcyType(), null);
        bankruptcyData.setBankruptcyType(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getBankruptcyType(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getBankruptcyType(), testString);
    }
    
    static testMethod void testBankruptcyCount(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the BankruptcyCount is null initially
        System.assertEquals(bankruptcyData.getBankruptcyCount(), null);
        bankruptcyData.setBankruptcyCount(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getBankruptcyCount(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getBankruptcyCount(), testString);
    }
    
    static testMethod void testCompanyName(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the CompanyName is null initially
        System.assertEquals(bankruptcyData.getCompanyName(), null);
        bankruptcyData.setCompanyName(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getCompanyName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getCompanyName(), testString);
    }
    
    static testMethod void testStreetAddress1(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the StreetAddress1 is null initially
        System.assertEquals(bankruptcyData.getStreetAddress1(), null);
        bankruptcyData.setStreetAddress1(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getStreetAddress1(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getStreetAddress1(), testString);
    }
    
    static testMethod void testStreetAddress2(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the StreetAddress2 is null initially
        System.assertEquals(bankruptcyData.getStreetAddress2(), null);
        bankruptcyData.setStreetAddress2(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getStreetAddress2(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getStreetAddress2(), testString);
    }
    
    static testMethod void testCity(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the City is null initially
        System.assertEquals(bankruptcyData.getCity(), null);
        bankruptcyData.setCity(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getCity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getCity(), testString);
    }
    
    static testMethod void testZip(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the Zip is null initially
        System.assertEquals(bankruptcyData.getZip(), null);
        bankruptcyData.setZip(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getZip(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getZip(), testString);
    }
    
    static testMethod void testZip4(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the Zip4 is null initially
        System.assertEquals(bankruptcyData.getZip4(), null);
        bankruptcyData.setZip4(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getZip4(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getZip4(), testString);
    }
    
    static testMethod void testFilingDate(){
    	BankruptcyData bankruptcyData = new BankruptcyData();
        // Check if the FilingDate is null initially
        System.assertEquals(bankruptcyData.getFilingDate(), null);
        bankruptcyData.setFilingDate(testString);
        // First check if the value is set
        System.assertNotEquals(bankruptcyData.getFilingDate(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(bankruptcyData.getFilingDate(), testString);
    }
}