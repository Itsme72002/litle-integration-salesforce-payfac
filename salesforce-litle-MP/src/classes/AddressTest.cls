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
private class AddressTest {
	public static final String testString = 'test';
	
	
    static testMethod void testStreetAddress1(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getStreetAddress1(), null);
        address.setStreetAddress1(testString);
        // First check if the value is set
        System.assertNotEquals(address.getStreetAddress1(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getStreetAddress1(), testString);
    }
    
    static testMethod void testStreetAddress2(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getStreetAddress2(), null);
        address.setStreetAddress2(testString);
        // First check if the value is set
        System.assertNotEquals(address.getStreetAddress2(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getStreetAddress2(), testString);
    }
    
    static testMethod void testCity(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getCity(), null);
        address.setCity(testString);
        // First check if the value is set
        System.assertNotEquals(address.getCity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getCity(), testString);
    }
    
    static testMethod void testStateProvince(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getStateProvince(), null);
        address.setStateProvince(testString);
        // First check if the value is set
        System.assertNotEquals(address.getStateProvince(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getStateProvince(), testString);
    }
    
    static testMethod void testPostalCode(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getPostalCode(), null);
        address.setPostalCode(testString);
        // First check if the value is set
        System.assertNotEquals(address.getPostalCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getPostalCode(), testString);
    }
    
    static testMethod void testCountryCode(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getCountryCode(), null);
        address.setCountryCode(testString);
        // First check if the value is set
        System.assertNotEquals(address.getCountryCode(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getCountryCode(), testString);
    }
    
    static testMethod void testStreetAddress1FromOpportunity(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getIsStreetAddress1FromOpportunity(), false);
        address.setIsStreetAddress1FromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(address.getIsStreetAddress1FromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getIsStreetAddress1FromOpportunity(), true);
    }
    
    static testMethod void testStreetAddress2FromOpportunity(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getIsStreetAddress2FromOpportunity(), false);
        address.setIsStreetAddress2FromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(address.getIsStreetAddress2FromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getIsStreetAddress2FromOpportunity(), true);
    }
    
    static testMethod void testCityFromOpportunity(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getIsCityFromOpportunity(), false);
        address.setIsCityFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(address.getIsCityFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getIsCityFromOpportunity(), true);
    }
    
    static testMethod void testStateProvinceFromOpportunity(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getIsStateProvinceFromOpportunity(), false);
        address.setIsStateProvinceFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(address.getIsStateProvinceFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getIsStateProvinceFromOpportunity(), true);
    }
    
    static testMethod void testPostalCodeFromOpportunity(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getIsPostalCodeFromOpportunity(), false);
        address.setIsPostalCodeFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(address.getIsPostalCodeFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getIsPostalCodeFromOpportunity(), true);
    }
    
    static testMethod void testCountryCodeFromOpportunity(){
    	Address address = new Address();
        // Check if the account is null initially
        System.assertEquals(address.getIsCountryCodeFromOpportunity(), false);
        address.setIsCountryCodeFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(address.getIsCountryCodeFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(address.getIsCountryCodeFromOpportunity(), true);
    }
}
