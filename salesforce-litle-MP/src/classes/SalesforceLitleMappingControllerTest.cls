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
private class SalesforceLitleMappingControllerTest {
	private static final String testString = 'test';

	// Test salesforce fields
    static testMethod void testSalesforceFields() {
        SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
        System.assert(salesforceLitleMappingController.getSalesforceFields().size()!= 0);
    }

	static testMethod void testOnSelectChangeLegalEntityName(){
	 	SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityName__c, null);
	 	// set value to disable the textbox
	 	salesforceLitleMappingController.currentMappings.legalEntityName__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityName__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityName();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityNameX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityName__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityNameX__c, false);
	 }
	 
	 
	 static testMethod void testOnSelectChangeLegalEntityType(){
	 	SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityType__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityType__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityType__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityType();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTypeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityType__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityType__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityType();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTypeX__c, false);
	 	
	}
	
	static testMethod void testOnSelectChangeLegalEntityDoingBusiness(){
	 	SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDoingBusinessAs__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityDoingBusinessAs__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDoingBusinessAs__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityDoingBusinessAs();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDoingBusinessAsX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityDoingBusinessAs__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityDoingBusinessAs__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityDoingBusinessAs();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTypeX__c, false);
	 	
	}
	
	static testMethod void testOnSelectChangeLegalEntityStreetAddress1(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress1();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1X__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1X__c, false);
		 
	}
	
	
	static testMethod void testOnSelectChangeLegalEntityStreetAddress2(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress2();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2X__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2X__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityCity(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCity__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityCity__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCity__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityCity();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCityX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityCity__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCity__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityCity();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCityX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityStateProvince(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityStateProvince();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvinceX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvince__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityStateProvince();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityStateProvinceX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPostalCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPostalCode();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCodeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCode__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPostalCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPostalCodeX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityCountryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityCountryCode();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCodeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCode__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityCountryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityCountryCodeX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalFirstName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstName__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstName__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalFirstName();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstNameX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstName__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalFirstName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstNameX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalLastName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastName__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastName__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalLastName();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastNameX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastName__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalLastName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastNameX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalEmailAddress(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddress__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddress__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddress__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalEmailAddress();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddressX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddress__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddress__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalEmailAddress();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddressX__c, false);
	 }
	 
	 static testMethod void testOnSelectChangeLegalEntityPrincipalStreetAddress1(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalStreetAddress1();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1X__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1X__c, false);
		 
	}
	
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalStreetAddress2(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalStreetAddress2();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2X__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2X__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalCity(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCity__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalCity__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCity__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalCity();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCityX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalCity__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCity__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalCity();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCityX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalStateProvince(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvince__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvince__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvince__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalStateProvince();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvinceX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvince__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvince__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalStateProvince();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvinceX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalPostalCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCode__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCode__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalPostalCode();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCodeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCode__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalPostalCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCodeX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalCountryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCode__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCode__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalCountryCode();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCodeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCode__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalCountryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCodeX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityContactPhone(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityContactPhone();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhoneX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhone__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityContactPhone();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityContactPhoneX__c, false);
	 }
	 
 	static testMethod void testOnSelectChangeLegalEntityPrincipalContactPhone(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhone__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhone__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhone__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalContactPhone();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhoneX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhone__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhone__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalContactPhone();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhoneX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalDateOfBirth(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirth__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirth__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirth__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalDateOfBirth();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirthX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirth__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirth__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalDateOfBirth();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirthX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalDriversLicense(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicense__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicense__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicense__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalDriversLicense();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicense__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicense__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalDriversLicense();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalDriversLicenseState(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseState__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseState__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseState__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalDriversLicenseState();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseStateX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseState__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseState__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalDriversLicenseState();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseStateX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityPrincipalSsn(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsn__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsn__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsn__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalSsn();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsnX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsn__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsn__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityPrincipalSsn();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsnX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityTaxId(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxId__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityTaxId__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxId__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityTaxId();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxIdX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityTaxId__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxId__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityTaxId();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityTaxIdX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityAnnualCreditCardSalesVolume(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityAnnualCreditCardSalesVolume();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolume__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityAnnualCreditCardSalesVolume();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c, false);
	 }
	
	static testMethod void testOnSelectChangeLegalEntityHasAcceptedCreditCards(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
	 	// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c = testString;
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c, testString);
	 	salesforceLitleMappingController.onSelectChangeLegalEntityHasAcceptedCreditCards();
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsX__c, true);
		// test if textbox is enabled when nothing is selected in the select options
		salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCards__c, null);
		salesforceLitleMappingController.onSelectChangeLegalEntityHasAcceptedCreditCards();
		System.assertEquals(salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsX__c, false);
	 }
	
	
	//Sub merchant on change listeners
	static testMethod void testOnSelectChangeSubMerchantStreetAddress1(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1X__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress1();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1X__c, false);		
	}
	
	
	static testMethod void testOnSelectChangeSubMerchantStreetAddress2(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2X__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantStreetAddress2();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2X__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCity(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCity__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantCity__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCity__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCity();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCityX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantCity__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCity__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCity();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCityX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantStateProvince(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantStateProvince();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvinceX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvince__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantStateProvince();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantStateProvinceX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantPostalCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantPostalCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCodeX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCode__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantPostalCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPostalCodeX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCountryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCountryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCodeX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCode__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCountryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCountryCodeX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantAmexMid(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantAmexMid();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMidX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMid__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantAmexMid();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantAmexMidX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantBankAccountNumber(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankAccountNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumber__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankAccountNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantBankRoutingNumber(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankRoutingNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumber__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantBankRoutingNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCreateCredentials(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCreateCredentials();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentials__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCreateCredentials();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantCustomerServiceNumber(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantCustomerServiceNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumber__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantCustomerServiceNumber();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantDiscoverConveyMid(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantDiscoverConveyMid();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMid__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantDiscoverConveyMid();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantHardCodeBillingDescriptor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantHardCodeBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptorX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptor__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantHardCodeBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptorX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantMaxTransactionAmount(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantMaxTransactionAmount();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmount__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantMaxTransactionAmount();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantMerchantCategoryCode(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantCategoryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCode__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantCategoryCode();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantMerchantName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantNameX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantName__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantMerchantName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantMerchantNameX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantFirstName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantFirstName__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstName__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantFirstName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstNameX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantFirstName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstName__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantFirstName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantFirstNameX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantLastName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantLastName__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastName__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantLastName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastNameX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantLastName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastName__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantLastName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantLastNameX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantEmailAddress(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantEmailAddress();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddressX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddress__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantEmailAddress();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantEmailAddressX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantPhone(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhone__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantPhone__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhone__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantPhone();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhoneX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantPhone__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhone__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantPhone();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPhoneX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantPspMerchantId(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantPspMerchantId();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantId__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantPspMerchantId();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchantUrl(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrl__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchantUrl__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrl__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchantUrl();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrlX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchantUrl__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrl__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchantUrl();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchantUrlX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchanteCheckBillingDescriptor(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptorX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptor__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckBillingDescriptor();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptorX__c, false);		
	}
	
	static testMethod void testOnSelectChangeSubMerchanteCheckCompanyName(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
	 	salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// check initial value
	 	System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c, null);
	 	// test if textbox is disabled when something is selected in the select options
	 	salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c = testString;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c, testString);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckCompanyName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameX__c, true);
		salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c = null;
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyName__c, null);
		salesforceLitleMappingController.onSelectChangeSubMerchanteCheckCompanyName();
		System.assertEquals(salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameX__c, false);		
	}
	
	
	
	static testMethod void testRemoveDisabledText(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		salesforceLitleMappingController.currentMappings = new SalesforceLitleMappingsObject__c();
		// set values in textboxes
		setAllValuesInCustomObjectDefaultTextbox(testString, salesforceLitleMappingController); 
		//check if values are properly set
		assertAllValuesInCustomObjectDefaultTextbox(testString, salesforceLitleMappingController);
		// check if values are unchanged after removeDisabledText method
		salesforceLitleMappingController.removeDisabledText();
		setAllValuesInCustomObjectDefaultTextbox(testString, salesforceLitleMappingController);
		// disable all the textboxes
		setAllValuesInCustomObjectDisabledFlag(true, salesforceLitleMappingController);
		// check if all textbox values are reset
		salesforceLitleMappingController.removeDisabledText();
		assertAllValuesInCustomObjectDefaultTextbox('', salesforceLitleMappingController);
		
	}
	
	static void setAllValuesInCustomObjectDisabledFlag(Boolean flag, SalesforceLitleMappingController salesforceLitleMappingController){
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1X__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2X__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantCityX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantStateProvinceX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantPostalCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantCountryCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantAmexMidX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescriptorX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantMerchantNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantFirstNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantLastNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantEmailAddressX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantPhoneX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchantUrlX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescriptorX__c = flag; 
		salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityTypeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityDoingBusinessAsX__c = flag;
		salesforceLitleMappingController.currentMappings.legalEntityContactPhoneX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1X__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2X__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityDoingBusinessAsX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityCityX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityStateProvinceX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPostalCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityCountryCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastNameX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddressX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhoneX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirthX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseStateX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsnX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1X__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2X__c = flag; 
		 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalCityX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvinceX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCodeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityTaxIdX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeX__c = flag; 
		salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsX__c = flag;
	}
	
	static void setAllValuesInCustomObjectDefaultTextbox(String stringToSet, SalesforceLitleMappingController salesforceLitleMappingController){
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantCityD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantStateProvinceD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantPostalCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantCountryCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantAmexMidD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantMerchantNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantFirstNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantLastNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantEmailAddressD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantPhoneD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchantUrlD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameD__c = stringToSet;
		salesforceLitleMappingController.currentMappings.legalEntityNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityTypeD__c = stringToSet;
		salesforceLitleMappingController.currentMappings.legalEntityDoingBusinessAsD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityCityD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityStateProvinceD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPostalCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityCountryCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastNameD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddressD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhoneD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirthD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseStateD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsnD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2D__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalCityD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvinceD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCodeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityTaxIdD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeD__c = stringToSet; 
		salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsD__c = stringToSet;  
		
	}
	
	static void assertAllValuesInCustomObjectDefaultTextbox(String stringToCheck, SalesforceLitleMappingController salesforceLitleMappingController){
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantStreetAddress1D__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantStreetAddress2D__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantCityD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantStateProvinceD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantPostalCodeD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantCountryCodeD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantAmexMidD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantBankAccountNumberD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantBankRoutingNumberD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantCreateCredentialsD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantCustomerServiceNumberD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantDiscoverConveyMidD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantHardCodeBillingDescD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantMaxTransactionAmountD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantMerchantCategoryCodeD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantMerchantNameD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantFirstNameD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantLastNameD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantEmailAddressD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantPhoneD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantPspMerchantIdD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchantUrlD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchanteCheckBillingDescD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.subMerchanteCheckCompanyNameD__c);
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityNameD__c); 
		//System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityTypeD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityStreetAddress1D__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityStreetAddress2D__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityCityD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityStateProvinceD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPostalCodeD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityCountryCodeD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalFirstNameD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalLastNameD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalEmailAddressD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalContactPhoneD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalDateOfBirthD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalDriversLicenseStateD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalSsnD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress1D__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalStreetAddress2D__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalCityD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalStateProvinceD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalPostalCodeD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityPrincipalCountryCodeD__c);
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityTaxIdD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityAnnualCreditCardSalesVolumeD__c); 
		System.assertEquals(stringToCheck, salesforceLitleMappingController.currentMappings.legalEntityHasAcceptedCreditCardsD__c);  
		
	}
	
	static testMethod void testSaveMappings(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		try{
	 		salesforceLitleMappingController.saveMappings();
	 	}catch(DMLException e){
	 		System.assertEquals(1, Apexpages.getMessages().size());
	 	}
	}
	
	static testMethod void testCancelMappings(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		//No id present in the url
		System.Test.setCurrentPage(new PageReference(testString));
		System.assertEquals(true, salesforceLitleMappingController.cancelMappings().getRedirect());
		System.assertEquals(testString, salesforceLitleMappingController.cancelMappings().getUrl());
	}
	
	static testMethod void testConstructor(){
		SalesforceLitleMappingsObject__c customObject = new SalesforceLitleMappingsObject__c();
		customObject.legalEntityName__c = testString;
		customObject.litleEnvironment__c = 'CERT';
		insert customObject;
		SalesforceLitleMappingController controller = new SalesforceLitleMappingController();
		System.assertEquals(testString, controller.currentMappings.legalEntityName__c);
		delete customObject;
	}
	
	static testMethod void testSaveMappingsPageRedirect(){
		SalesforceLitleMappingController salesforceLitleMappingController = new SalesforceLitleMappingController();
		apexpages.currentpage().getparameters().put('id' , testString);
		salesforceLitleMappingController.saveMappings();
	}     
}