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
private class LegalEntityModelTest {
	
	public static final String testString = 'test';

	//Test the Legal Entity Name
    static testMethod void testLegalEntityName(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityName is null initially
        System.assertEquals(legalEntityModel.getLegalEntityName(), null);
        legalEntityModel.setLegalEntityName(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityName(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityName(), testString);
    }
    
    static testMethod void testLegalEntityType(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityType is null initially
        System.assertEquals(legalEntityModel.getLegalEntityType(), null);
        legalEntityModel.setLegalEntityType(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityType(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityType(), testString);
    }
    
    
    static testMethod void testLegalEntityDoingBusinessAs(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the LegalEntityType is null initially
        System.assertEquals(legalEntityModel.getLegalEntityDoingBusinessAs(), null);
        legalEntityModel.setLegalEntityDoingBusinessAs(testString);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityDoingBusinessAs(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityDoingBusinessAs(), testString);
    }
    
    static testMethod void testLegalEntityAddress(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	Address address = new Address();
    	address.setStreetaddress1(testString);
    	address.setStreetAddress2(testString);
    	address.setCity(testString);
    	address.setStateProvince(testString);
    	address.setPostalCode(testString);
    	address.setCountryCode(testString);
        // Check if the LegalEntityType is null initially
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getStreetAddress1(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getStreetAddress2(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getCity(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getStateProvince(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getPostalCode(), null);
        System.assertEquals(legalEntityModel.getLegalEntityAddress().getCountryCode(), null);
        legalEntityModel.setLegalEntityAddress(address);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityAddress(), null);
        // and then confirm if the value is set correctly
    }
    
    static testMethod void testLegalEntityContactPhone(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityContactPhone(), null);
        legalEntityModel.setLegalEntityContactPhone(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityContactPhone(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityContactPhone(), testString);
    }
    
    static testMethod void testLegalEntityPrincipal(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	Address address = new Address();
    	address.setStreetaddress1(testString);
    	address.setStreetAddress2(testString);
    	address.setCity(testString);
    	address.setStateProvince(testString);
    	address.setPostalCode(testString);
    	address.setCountryCode(testString);
        // Check if the LegalEntityType is null initially
        //System.assertEquals(legalEntityModel.getLegalEntityPrincipal(), null);
        Principal principal = new Principal();
        principal.setAddress(address);
        principal.setFirstName(testString);
		principal.setLastName(testString);
		principal.setEmailAddress(testString);
		principal.setContactPhone(testString);
		principal.setDateOfBirth(testString);
		principal.setDriversLicense(testString);
		principal.setDriversLicenseState(testString);
		principal.setSsn(testString);
        legalEntityModel.setLegalEntityPrincipal(principal);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityPrincipal(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityPrincipal(), principal);
    }
    
    static testMethod void testLegalEntityTaxId(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityTaxId(), null);
        legalEntityModel.setLegalEntityTaxId(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityTaxId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityTaxId(), testString);
    }
    
   static testMethod void testLegalEntityAnnualCreditCardSalesVolume(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), null);
        legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume(), testString);
    }
    
    static testMethod void testLegalEntityHasAcceptedCreditCards(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCards(), null);
        legalEntityModel.setLegalEntityHasAcceptedCreditCards(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCards(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityHasAcceptedCreditCards(), testString);
    }
    
    static testMethod void testLegalEntityId(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getLegalEntityId(), null);
        legalEntityModel.setLegalEntityId(testString);
        // Last check if the value is set
        System.assertNotEquals(legalEntityModel.getLegalEntityId(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getLegalEntityId(), testString);
    }
    
    static testMethod void testNameFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsNameFromOpportunity(), false);
        legalEntityModel.setIsNameFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsNameFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsNameFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityDoingBusinessAsFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsDoingBusinessAsFromOpportunity(), false);
        legalEntityModel.setIsDoingBusinessAsFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsDoingBusinessAsFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsDoingBusinessAsFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityContactPhoneFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsContactPhoneFromOpportunity(), false);
        legalEntityModel.setIsContactPhoneFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsContactPhoneFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsContactPhoneFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityTaxIdFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsTaxIdFromOpportunity(), false);
        legalEntityModel.setIsTaxIdFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsTaxIdFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsTaxIdFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityAnnualCreditCardSalesVolumeFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsAnnualCreditCardSalesVolumeFromOpportunity(), false);
        legalEntityModel.setIsAnnualCreditCardSalesVolumeFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsAnnualCreditCardSalesVolumeFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsAnnualCreditCardSalesVolumeFromOpportunity(), true);
    }
    
    static testMethod void testLegalEntityHasAcceptedCreditCardsFromOpportunity(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
        // Check if the account is null initially
        System.assertEquals(legalEntityModel.getIsHasAcceptedCreditCardsFromOpportunity(), false);
        legalEntityModel.setIsHasAcceptedCreditCardsFromOpportunity(true);
        // First check if the value is set
        System.assertNotEquals(legalEntityModel.getIsHasAcceptedCreditCardsFromOpportunity(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(legalEntityModel.getIsHasAcceptedCreditCardsFromOpportunity(), true);
    }
    
   
    
    
}