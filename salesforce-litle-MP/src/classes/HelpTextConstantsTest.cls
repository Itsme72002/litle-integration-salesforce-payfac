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
private class HelpTextConstantsTest {

    static testMethod void myUnitTest() {
    	System.assertEquals(HelpTextConstants.getPayfacUsername(), HelpTextConstants.PAYFAC_USERNAME);
		System.assertEquals(HelpTextConstants.getPayfacPassword(), HelpTextConstants.PAYFAC_PASSWORD);
		System.assertEquals(HelpTextConstants.getLitleEnvironment(), HelpTextConstants.LITLE_ENVIRONMENT);
		System.assertEquals(HelpTextConstants.getSubMerchantCountryCode(), HelpTextConstants.SUB_MERCHANT_COUNTRY_CODE);
		System.assertEquals(HelpTextConstants.getPrincipalCountryCode(), HelpTextConstants.PRINCIPAL_COUNTRY_CODE);
		System.assertEquals(HelpTextConstants.getLegalEntityCountryCode(), HelpTextConstants.LEGAL_ENTITY_COUNTRY_CODE);
		System.assertEquals(HelpTextConstants.getCreateCredential(), HelpTextConstants.CREATE_CREDENTIAL);
		System.assertEquals(HelpTextConstants.getPspMerchantId(), HelpTextConstants.PSP_MERCHANT_ID);
		System.assertEquals(HelpTextConstants.getMerchantName(), HelpTextConstants.MERCHANT_NAME);
		System.assertEquals(HelpTextConstants.getMerchantCategoryCode(), HelpTextConstants.MERCHANT_CATEGORY_CODE);
		System.assertEquals(HelpTextConstants.getUrl(), HelpTextConstants.URL);
		System.assertEquals(HelpTextConstants.getHardCodedBillingDescriptor(), HelpTextConstants.HARD_CODED_BILLING_DESCRIPTOR);
		System.assertEquals(HelpTextConstants.getCustomerServiceNumber(), HelpTextConstants.CUSTOMER_sERVICE_NUMBER);
		System.assertEquals(HelpTextConstants.getAmexMid(), HelpTextConstants.AMEX_MID);
		System.assertEquals(HelpTextConstants.getDiscoverConveyedMid(), HelpTextConstants.DISCOVER_CONVEYED_MID);
		System.assertEquals(HelpTextConstants.getMaxTransactionAmount(), HelpTextConstants.MAX_TRANSACTION_AMOUNT);
		System.assertEquals(HelpTextConstants.getAnnualCreditCardSalesVolume(), HelpTextConstants.ANNUAL_CREDIT_CARD_SALES_VOLUME);
		System.assertEquals(HelpTextConstants.getSubMerchantStreetAddress1(), HelpTextConstants.SUB_MERCHANT_STREET_ADDRESS1);
		System.assertEquals(HelpTextConstants.getSubMerchantStreetAddress2(), HelpTextConstants.SUB_MERCHANT_STREET_ADDRESS2);
		System.assertEquals(HelpTextConstants.getSubMerchantCity(), HelpTextConstants.SUB_MERCHANT_CITY);
		System.assertEquals(HelpTextConstants.getSubMerchantStateProvince(), HelpTextConstants.SUB_MERCHANT_STATE_PROVINCE);
		System.assertEquals(HelpTextConstants.getSubMerchantPostalCode(), HelpTextConstants.SUB_MERCHANT_POSTAL_CODE);
		System.assertEquals(HelpTextConstants.getEcheckEnabledId(), HelpTextConstants.ECHECK_ENABLED_ID);
		System.assertEquals(HelpTextConstants.getEcheckBillingDescriptorId(), HelpTextConstants.ECHECK_BILLING_DESCRIPTOR_ID);
		System.assertEquals(HelpTextConstants.getEcheckCompanyNameId(), HelpTextConstants.ECHECK_COMPANY_NAME_ID);
		System.assertEquals(HelpTextConstants.getPurchaseCurrency(), HelpTextConstants.PURCHASE_CURRENCY);
		System.assertEquals(HelpTextConstants.getBankRoutingNumber(), HelpTextConstants.BANK_ROUTING_NUMBER);
		System.assertEquals(HelpTextConstants.getBankAccountNumber(), HelpTextConstants.BANK_ACCOUNT_NUMBER);
		System.assertEquals(HelpTextConstants.getTaxId(), HelpTextConstants.TAX_ID);
		System.assertEquals(HelpTextConstants.getLegalEntityName(), HelpTextConstants.LEGAL_ENTITY_NAME);
		System.assertEquals(HelpTextConstants.getLegalEntityType(), HelpTextConstants.LEGAL_ENTITY_TYPE);
		System.assertEquals(HelpTextConstants.getDoingBusinessAs(), HelpTextConstants.DOING_BUSINESS_AS);
		System.assertEquals(HelpTextConstants.getLegalEntityContactPhone(), HelpTextConstants.LEGAL_ENTITY_CONTACT_PHONE);
		System.assertEquals(HelpTextConstants.getLegalEntityStreetAddress1(), HelpTextConstants.LEGAL_ENTITY_STREET_ADDRESS1);
		System.assertEquals(HelpTextConstants.getLegalEntityStreetAddress2(), HelpTextConstants.LEGAL_ENTITY_STREET_ADDRESS2);
		System.assertEquals(HelpTextConstants.getLegalEntityCity(), HelpTextConstants.LEGAL_ENTITY_CITY);
		System.assertEquals(HelpTextConstants.getLegalEntityStateProvince(), HelpTextConstants.LEGAL_ENTITY_STATE_PROVINCE);
		System.assertEquals(HelpTextConstants.getLegalEntityPostalCode(), HelpTextConstants.LEGAL_ENTITY_POSTAL_CODE);
		System.assertEquals(HelpTextConstants.getHasAcceptedCreditCards(), HelpTextConstants.HAS_ACCEPTED_CREDIT_CARDS);
		System.assertEquals(HelpTextConstants.getPrincipalFirstName(), HelpTextConstants.PRINCIPAL_FIRST_NAME);
		System.assertEquals(HelpTextConstants.getPrincipalLastName(), HelpTextConstants.PRINCIPAL_LAST_NAME);
		System.assertEquals(HelpTextConstants.getSsn(), HelpTextConstants.SSN);
		System.assertEquals(HelpTextConstants.getPrincipalDateOfBirth(), HelpTextConstants.PRINCIPAL_DATE_OF_BIRTH);
		System.assertEquals(HelpTextConstants.getPrincipalEmailAddress(), HelpTextConstants.PRINCIPAL_EMAIL_ADDRESS);
		System.assertEquals(HelpTextConstants.getPrincipalContactPhone(), HelpTextConstants.PRINCIPAL_CONTACT_PHONE);
		System.assertEquals(HelpTextConstants.getPrincipalDriversLicense(), HelpTextConstants.PRINCIPAL_DRIVERS_LICENSE);
		System.assertEquals(HelpTextConstants.getPrincipalDriversLicenseState(), HelpTextConstants.PRINCIPAL_DRIVERS_LICENSE_STATE);
		System.assertEquals(HelpTextConstants.getPrincipalStreetAddress1(), HelpTextConstants.PRINCIPAL_STREET_ADDRESS1);
		System.assertEquals(HelpTextConstants.getPrincipalStreetAddress2(), HelpTextConstants.PRINCIPAL_STREET_ADDRESS2);
		System.assertEquals(HelpTextConstants.getPrincipalCity(), HelpTextConstants.PRINCIPAL_CITY);
		System.assertEquals(HelpTextConstants.getPrincipalStateProvince(), HelpTextConstants.PRINCIPAL_STATE_PROVINCE);
		System.assertEquals(HelpTextConstants.getPrincipalPostalCode(), HelpTextConstants.PRINCIPAL_POSTAL_CODE);
		System.assertEquals(HelpTextConstants.getPrimaryContactFirstName(), HelpTextConstants.PRIMARY_CONTACT_FIRST_NAME);
		System.assertEquals(HelpTextConstants.getPrimaryContactLastName(), HelpTextConstants.PRIMARY_CONTACT_LAST_NAME);
		System.assertEquals(HelpTextConstants.getPrimaryContactEmailAddress(), HelpTextConstants.PRIMARY_CONTACT_EMAIL_ADDRESS);
		System.assertEquals(HelpTextConstants.getPrimaryContactPhone(), HelpTextConstants.PRIMARY_CONTACT_PHONE);
    }
}