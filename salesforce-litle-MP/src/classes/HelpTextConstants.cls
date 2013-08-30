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
public class HelpTextConstants {
	
	public static final String PSP_MERCHANT_ID = 'The unique identifier that your organization has assigned for this sub-merchant.  Max. length 32 characters.';
	public static final String MERCHANT_NAME = 'The name of the sub-merchant you are adding. Max. length 50 characters.';
	public static final String MERCHANT_CATEGORY_CODE = 'The Merchant Category Code (MCC) for this sub-merchant. Your organization has been approved for the list of MCCs provided.';
	public static final String URL = 'The URL / website for this sub-merchant, for example, \'somecompany.com\'. Do not include \'https://\'. Max. length 120 characters.';
	public static final String HARD_CODED_BILLING_DESCRIPTOR = 'The default billing descriptor for this sub-merchant. This is shown on the consumer\'s statement if the billing descriptor value was not sent with the transaction. Must be 4-25 characters.';
	public static final String CUSTOMER_SERVICE_NUMBER = 'The customer service number for this sub-merchant, without hyphens. This is shown on the consumer\'s statement if a value was not sent with the transaction. Max. 10 digits for US numbers.';
	public static final String AMEX_MID = 'The Merchant ID provided by American Express for this sub-merchant.  Must be 10-11 characters.';
	public static final String DISCOVER_CONVEYED_MID = 'The Merchant ID provided by Discover for this sub-merchant. Required if Discover has a direct relationship and settles funds directly to your organization. Must be 15 characters.';
	public static final String MAX_TRANSACTION_AMOUNT = 'The maximum transaction amount (in the purchase currency) allowed on a single transaction submitted by this sub-merchant, without decimal points or symbols. For example, enter $500.00 as 500. Max. length 23 digits.';
	public static final String ANNUAL_CREDIT_CARD_SALES_VOLUME = 'The approximate annual credit card sales this legal entity expects to process, without decimal points or symbols, in USD. Enter $500.00 as 500. Max. length 23 digits.';
	public static final String SUB_MERCHANT_STREET_ADDRESS1 = 'The street address of this sub-merchant. Max. length 60 characters.';
	public static final String SUB_MERCHANT_STREET_ADDRESS2 = 'The additional street address of this sub-merchant. Max. length 60 characters.';
	public static final String SUB_MERCHANT_CITY = 'The city of this sub-merchant. Max. length 20 characters.';
	public static final String SUB_MERCHANT_STATE_PROVINCE = 'The state of this sub-merchant (US only).';
	public static final String SUB_MERCHANT_POSTAL_CODE = 'The postal code of this sub-merchant. Must be 5 digits.';
	public static final String SUB_MERCHANT_COUNTRY_CODE = 'The country code of this sub-merchant. Maximum 3 characters.';
	public static final String ECHECK_ENABLED_ID = 'Select this checkbox to enable eCheck transactions for this sub-merchant.';
	public static final String ECHECK_BILLING_DESCRIPTOR_ID = 'The billing descriptor used for eCheck transactions (typically, your customer service phone number). This is shown on the consumer\'s statement if the billing descriptor value was not sent with the transaction. Max. length 10 characters.';
	public static final String ECHECK_COMPANY_NAME_ID = 'The billing descriptor company name for eCheck transactions. This is shown on the consumer\'s statement if the billing descriptor value was not sent with the transaction. Max. length 16 characters.';
	public static final String PURCHASE_CURRENCY = 'The purchase currency of this sub-merchant (USD, unless this merchant settles outside of the US).';
	public static final String BANK_ROUTING_NUMBER = 'The routing number of the bank account used to fund this sub-merchant. Max. length 50 characters.';
	public static final String BANK_ACCOUNT_NUMBER = 'The account number of the bank account used to fund this sub-merchant. Max. length 50 characters.';
	public static final String TAX_ID = 'The Tax ID (or EIN, if applicable) of the legal entity controlling this sub-merchant, without hyphens. Max. length 9 characters.';
	public static final String LEGAL_ENTITY_NAME = 'The name of the legal entity controlling this sub-merchant, as shown in the incorporation documents. Enter the name of the person in the case of a sole proprietorship. Max. length 60 characters.';
	public static final String LEGAL_ENTITY_TYPE = 'The business type of legal entity.';
	public static final String DOING_BUSINESS_AS = 'The alternate name of the legal entity. Max. length 60 characters.';
	public static final String LEGAL_ENTITY_CONTACT_PHONE = 'The contact phone (land line) of the legal entity or principal owner/officer, without hyphens. Max. length 10 characters.';
	public static final String LEGAL_ENTITY_STREET_ADDRESS1 = 'The street address of the legal entity controlling this sub-merchant. Max. length 60 characters.';
	public static final String LEGAL_ENTITY_STREET_ADDRESS2 = 'The additional street address of the legal entity controlling this sub-merchant. Max. length 60 characters.';
	public static final String LEGAL_ENTITY_CITY = 'The city of the legal entity controlling this sub-merchant. Max. length 20 characters.';
	public static final String LEGAL_ENTITY_STATE_PROVINCE = 'The state of the legal entity controlling this sub-merchant (US only).';
	public static final String LEGAL_ENTITY_POSTAL_CODE = 'The postal code of this legal entity. Must be 5 digits.';
	public static final String LEGAL_ENTITY_COUNTRY_CODE = 'The country code of this legal entity. Maximum 3 characters.';
	public static final String HAS_ACCEPTED_CREDIT_CARDS = 'Indicates whether the Legal Entity has accepted credits cards in the past.';
	public static final String PRINCIPAL_FIRST_NAME = 'The first name of the legal entity principal owner/officer. Max. length 20 characters.';
	public static final String PRINCIPAL_LAST_NAME = 'The last name of the legal entity principal owner/officer. Max. length 20 characters.';
	public static final String SSN = 'The social security number of the principal owner/officer for the legal entity. Only required when legal entity type is \'Individual/Sole Proprietorship\'. Must be 9 digits.';
	public static final String PRINCIPAL_DATE_OF_BIRTH = 'The date of birth of the principal owner/officer for the legal entity (mm/dd/yyyy).';
	public static final String PRINCIPAL_EMAIL_ADDRESS = 'The email address of the principal owner/officer for the legal entity. Max. length 100 characters.';
	public static final String PRINCIPAL_CONTACT_PHONE = 'The contact phone of the principal owner/officer for the legal entity, without hyphens. Max. length 10 characters.';
	public static final String PRINCIPAL_DRIVERS_LICENSE = 'The driver\'s license number of the Legal Entity principal owner/officer. Max. length  25 characters.';
	public static final String PRINCIPAL_DRIVERS_LICENSE_STATE = 'The state that issued the driver\'s license of the Legal Entity principal owner/officer.';
	public static final String PRINCIPAL_STREET_ADDRESS1 = 'The street address of the principal owner/officer for the legal entity. Only required when legal entity type is \'Individual/Sole Proprietorship\'. Max. length 60 characters';
	public static final String PRINCIPAL_STREET_ADDRESS2 = 'The additional street address of the principal owner/officer for the legal entity. Max. length 60 characters.';
	public static final String PRINCIPAL_CITY = 'The city of the principal owner/officer for the legal entity. Only required when legal entity type is \'Individual/Sole Proprietorship\'. Max. length 20 characters.';
	public static final String PRINCIPAL_STATE_PROVINCE = 'The state of the principal owner/officer for the legal entity (US only). Only required when legal entity type is \'Individual/Sole Proprietorship\'.';
	public static final String PRINCIPAL_POSTAL_CODE = 'The postal code of the principal owner/officer for the legal entity. Must be 5 digits. Only required when legal entity type is \'Individual/Sole Proprietorship\'.';
	public static final String PRINCIPAL_COUNTRY_CODE = 'The country code of the principal owner/officer for the legal entity. Maximum 3 characters.';
	public static final String PRIMARY_CONTACT_FIRST_NAME = 'The first name of the primary operational contact for this sub-merchant (does not need to be the person who executes the legal contract). Required to register the sub-merchant with card brands.  Max. length 20 characters.';
	public static final String PRIMARY_CONTACT_LAST_NAME = 'The last name of the primary operational contact for this sub-merchant (does not need to be the person who executes the legal contract). Required to register the sub-merchant with card brands. Max. length 20 characters.';
	public static final String PRIMARY_CONTACT_EMAIL_ADDRESS = 'The email address of the primary operational contact for this sub-merchant. Max. length 100 characters.';
	public static final String PRIMARY_CONTACT_PHONE = 'The phone number of the primary operational contact for this sub-merchant, without hyphens. Must be 10-13 digits.';
	public static final String CREATE_CREDENTIAL = 'Should the system create login credentials for this sub-merchant (username, password, and PayPage ID, if necessary)?';
	public static final String PAYFAC_USERNAME = 'The Payfac username used to connect to payfac portal with.';
	public static final String PAYFAC_PASSWORD = 'The Payfac password used to connect to payfac portal with.';
	public static final String LITLE_ENVIRONMENT = 'The enivironment to which the request would be sent.';
	
	public static String getPayfacUsername() {
        return PAYFAC_USERNAME;
    }
    public static String getPayfacPassword() {
        return PAYFAC_PASSWORD;
    }
    public static String getLitleEnvironment() {
        return LITLE_ENVIRONMENT;
    }
    public static String getSubMerchantCountryCode() {
        return SUB_MERCHANT_COUNTRY_CODE;
    }
    public static String getPrincipalCountryCode() {
        return PRINCIPAL_COUNTRY_CODE;
    }
    public static String getLegalEntityCountryCode() {
        return LEGAL_ENTITY_COUNTRY_CODE;
    }
	public static String getCreateCredential() {
        return CREATE_CREDENTIAL;
    }
	public static String getPspMerchantId() {
        return PSP_MERCHANT_ID;
    }
    public static String getMerchantName() {
        return MERCHANT_NAME;
    }
    public static String getMerchantCategoryCode() {
        return MERCHANT_CATEGORY_CODE;
    }
    public static String getUrl() {
        return URL;
    }
    public static String getHardCodedBillingDescriptor() {
        return HARD_CODED_BILLING_DESCRIPTOR;
    }
    public static String getCustomerServiceNumber() {
        return CUSTOMER_sERVICE_NUMBER;
    }
    public static String getAmexMid() {
        return AMEX_MID;
    }
    public static String getDiscoverConveyedMid() {
        return DISCOVER_CONVEYED_MID;
    }
    public static String getMaxTransactionAmount() {
        return MAX_TRANSACTION_AMOUNT;
    }
    public static String getAnnualCreditCardSalesVolume() {
        return ANNUAL_CREDIT_CARD_SALES_VOLUME;
    }
    public static String getSubMerchantStreetAddress1() {
        return SUB_MERCHANT_STREET_ADDRESS1;
    }
    public static String getSubMerchantStreetAddress2() {
        return SUB_MERCHANT_STREET_ADDRESS2;
    }
    public static String getSubMerchantCity() {
        return SUB_MERCHANT_CITY;
    }
    public static String getSubMerchantStateProvince() {
        return SUB_MERCHANT_STATE_PROVINCE;
    }
    public static String getSubMerchantPostalCode() {
        return SUB_MERCHANT_POSTAL_CODE;
    }
    public static String getEcheckEnabledId() {
        return ECHECK_ENABLED_ID;
    }
    public static String getEcheckBillingDescriptorId() {
        return ECHECK_BILLING_DESCRIPTOR_ID;
    }
    public static String getEcheckCompanyNameId() {
        return ECHECK_COMPANY_NAME_ID;
    }
    public static String getPurchaseCurrency() {
        return PURCHASE_CURRENCY;
    }
    public static String getBankRoutingNumber() {
        return BANK_ROUTING_NUMBER;
    }
    public static String getBankAccountNumber() {
        return BANK_ACCOUNT_NUMBER;
    }
    public static String getTaxId() {
        return TAX_ID;
    }
    public static String getLegalEntityName() {
        return LEGAL_ENTITY_NAME;
    }
    public static String getLegalEntityType() {
        return LEGAL_ENTITY_TYPE;
    }
    public static String getDoingBusinessAs() {
        return DOING_BUSINESS_AS;
    }
    public static String getLegalEntityContactPhone() {
        return LEGAL_ENTITY_CONTACT_PHONE;
    }
    public static String getLegalEntityStreetAddress1() {
        return LEGAL_ENTITY_STREET_ADDRESS1;
    }
    public static String getLegalEntityStreetAddress2() {
        return LEGAL_ENTITY_STREET_ADDRESS2;
    }
    public static String getLegalEntityCity() {
        return LEGAL_ENTITY_CITY;
    }
    public static String getLegalEntityStateProvince() {
        return LEGAL_ENTITY_STATE_PROVINCE;
    }
    public static String getLegalEntityPostalCode() {
        return LEGAL_ENTITY_POSTAL_CODE;
    }
    public static String getHasAcceptedCreditCards() {
        return HAS_ACCEPTED_CREDIT_CARDS;
    }
    public static String getPrincipalFirstName() {
        return PRINCIPAL_FIRST_NAME;
    }
    public static String getPrincipalLastName() {
        return PRINCIPAL_LAST_NAME;
    }
    public static String getSsn() {
        return SSN;
    }
    public static String getPrincipalDateOfBirth() {
        return PRINCIPAL_DATE_OF_BIRTH;
    }
    public static String getPrincipalEmailAddress() {
        return PRINCIPAL_EMAIL_ADDRESS;
    }
    public static String getPrincipalContactPhone() {
        return PRINCIPAL_CONTACT_PHONE;
    }
    public static String getPrincipalDriversLicense() {
        return PRINCIPAL_DRIVERS_LICENSE;
    }
    public static String getPrincipalDriversLicenseState() {
        return PRINCIPAL_DRIVERS_LICENSE_STATE;
    }
    public static String getPrincipalStreetAddress1() {
        return PRINCIPAL_STREET_ADDRESS1;
    }
    public static String getPrincipalStreetAddress2() {
        return PRINCIPAL_STREET_ADDRESS2;
    }
    public static String getPrincipalCity() {
        return PRINCIPAL_CITY;
    }
    public static String getPrincipalStateProvince() {
        return PRINCIPAL_STATE_PROVINCE;
    }
    public static String getPrincipalPostalCode() {
        return PRINCIPAL_POSTAL_CODE;
    }
    public static String getPrimaryContactFirstName() {
        return PRIMARY_CONTACT_FIRST_NAME;
    }
    public static String getPrimaryContactLastName() {
        return PRIMARY_CONTACT_LAST_NAME;
    }
    public static String getPrimaryContactEmailAddress() {
        return PRIMARY_CONTACT_EMAIL_ADDRESS;
    }
    public static String getPrimaryContactPhone() {
        return PRIMARY_CONTACT_PHONE;
    }
}