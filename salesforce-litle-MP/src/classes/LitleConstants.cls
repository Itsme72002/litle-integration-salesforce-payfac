public class LitleConstants {
	
	public static final String MASK_CHARACTER = '*';
	
	// MP request constants
	public static final String RETRIEVE_HTTP_REQUEST_METHOD = 'GET';
	public static final String MCC_HTTP_REQUEST_METHOD = 'GET';
	public static final String CREATE_HTTP_REQUEST_METHOD = 'POST';
	public static final String LEGAL_ENTITY_REQUEST_ENDPOINT = 'https://psp-cert.litle.com/legalentity';
	public static final String LEGAL_ENTITY_URI = 'legalentity';
	public static final String SUBMERCHANT_URI = 'submerchant';
	public static final String LEGAL_ENTITY_META_UI_URI = 'legalEntity';
	public static final String SUBMERCHANT_META_UI_URI = 'subMerchant';
	
	public static final String REQUEST_HEADER_CONTENT_TYPE = 'Content-Type';
	public static final String REQUEST_HEADER_ACCEPT = 'Accept';
	public static final String REQUEST_HEADER_AUTHORIZATION = 'Authorization';
	public static final String REQUEST_HEADER_PLATFORM = 'Platform';
	public static final String REQUEST_HEADER_CONTENT_TYPE_VALUE = 'application/com.litle.psp-v5+xml';
	public static final String REQUEST_HEADER_ACCEPT_VALUE = 'application/com.litle.psp-v5+xml';
	public static final String REQUEST_HEADER_PLATFORM_VALUE = 'salesforce';
	public static final String URL_SEPARATOR = '/';
	public static final String PAY_FAC_PORTAL_URI = 'metaui' + URL_SEPARATOR + 'payfacPortal';
	
	// auth has space at the end
	public static final String REQUEST_AUTH_TYPE = 'Basic ';
	
	// Xml constants
	public static final String XML_ENCODING = 'UTF-8';
	public static final String XML_VERSION ='1.0';
	public static final String REQUEST_XML_NAMESPACE = 'http://psp.litle.com/api/merchant/onboard';
	
	// MP response codes
	public static final String RESPONSE_APPROVED = '10';
	public static final String RESPONSE_MANUAL_REVIEW = '20';
	public static final String RESPONSE_RETRY = '30';
	public static final String RESPONSE_MANUAL_REVIEW_DUPLICATE = '35';
	public static final String RESPONSE_DUPLICATE = '36';
	public static final String RESPONSE_DECLINED = '40';
	public static final String RESPONSE_MANUAL_REVIEW_BACKGROUND_CHECK_ERROR = '99';
	
	public static final String RESPONSE_APPROVED_MESSAGE = 'Litle Mid has been generated successfully. It will appear on the Litle MID field.';
	public static final String RESPONSE_MANUAL_REVIEW_MESSAGE = 'Your request is under Manual Review. The status shall be updated within 2 business days.';
	public static final String RESPONSE_RETRY_MESSAGE = 'Retry Request.';
	public static final String RESPONSE_MANUAL_REVIEW_DUPLICATE_MESSAGE = 'Your request is a duplicate of manual review.';
	public static final String RESPONSE_DUPLICATE_MESSAGE = 'Your request is a duplicate request.';
	public static final String RESPONSE_DECLINED_MESSAGE = 'Your request has been Declined.';
	public static final String RESPONSE_MANUAL_REVIEW_BACKGROUND_CHECK_ERROR_MESSAGE = 'Your request has a background check error.';
	// http response codes
	public static final Integer LEGAL_ENTITY_SUCCESS_RESPONSE_CODE = 201;
	public static final Integer SUB_MERCHANT_SUCCESS_RESPONSE_CODE = 201;
	
	public static final List<Integer> PCI_LEVELS = new List<Integer>{ 1, 2, 3, 4 };
	
	
	// litle environment constants
	public static final String LITLE_ENV_PROD = 'https://psp.litle.com';
	public static final String LITLE_ENV_CERT = 'https://provision-postlive.litle.com';
	public static final String LITLE_ENV_PRE_CERT = 'https://psp-cert.litle.com';
	public static final String LITLE_ENV_PRE_LIVE = 'https://psp-cert.litle.com';
	public static final String LITLE_ENV_SANDBOX = 'https://psp-cert.litle.com';
	
	// XML tag names
	public static final String XML_TAG_LEGALENTITY_CREATE_REQUEST = 'legalEntityCreateRequest';
	public static final String XML_TAG_LEGALENTITY_NAME = 'legalEntityName';
	public static final String XML_TAG_LEGALENTITY_TYPE = 'legalEntityType';
	public static final String XML_TAG_DOING_BUSINESS_AS = 'doingBusinessAs';
	public static final String XML_TAG_TAXID = 'taxId';
	public static final String XML_TAG_CONTACT_PHONE = 'contactPhone';
	public static final String XML_TAG_ANNUAL_CREDIT_CARD_SALES_VOLUME = 'annualCreditCardSalesVolume';
	public static final String XML_TAG_HAS_ACCEPTED_CREDIT_CARDS = 'hasAcceptedCreditCards';
	public static final String XML_TAG_ADDRESS = 'address';
	public static final String XML_TAG_STREET_ADDRESS1 = 'streetAddress1';
	public static final String XML_TAG_STREET_ADDRESS2 = 'streetAddress2';
	public static final String XML_TAG_CITY = 'city';
	public static final String XML_TAG_STATE_PROVINCE = 'stateProvince';
	public static final String XML_TAG_POSTAL_CODE = 'postalCode';
	public static final String XML_TAG_COUNTRY_CODE = 'countryCode';
	public static final String XML_TAG_PCI = 'PCI';
	public static final String XML_TAG_IS_EXCLUSIVE_TO_PSP = 'isExclusiveToPsp';
	public static final String XML_TAG_IS_PCI_COMPLIANCE_VALIDATED = 'isPciComplianceValidated';
	public static final String XML_TAG_SCANNING_VENDOR = 'scanningVendor';
	public static final String XML_TAG_QUALIFIED_SECURITY_ASSESSOR = 'qualifiedSecurityAssessor';
	public static final String XML_TAG_MOST_RECENTLY_PASSED_SCAN = 'mostRecentlyPassedScan';
	public static final String XML_TAG_REPORT_ON_COMPLIANCE = 'reportOnCompliance';
	public static final String XML_TAG_PCI_LEVEL = 'pciLevel';
	public static final String XML_TAG_PRINCIPALS = 'principals';
	public static final String XML_TAG_PRINCIPAL = 'principal';
	public static final String XML_TAG_FIRST_NAME = 'firstName';
	public static final String XML_TAG_LAST_NAME = 'lastName';
	public static final String XML_TAG_EMAIL_ADDRESS = 'emailAddress';
	public static final String XML_TAG_SSN = 'ssn';
	public static final String XML_TAG_DATE_OF_BIRTH = 'dateOfBirth';
	public static final String XML_TAG_DRIVERS_LICENSE = 'driversLicense';
	public static final String XML_TAG_DRIVERS_LICENSE_STATE = 'driversLicenseState';
	public static final String XML_TAG_SUBMERCHANT_CREATE_REQUEST = 'subMerchantCreateRequest';
	public static final String XML_TAG_AMEX_MID = 'amexMid';
	public static final String XML_TAG_BANK_ACCOUNT_NUMBER = 'bankAccountNumber';
	public static final String XML_TAG_BANK_ROUNTING_NUMBER = 'bankRoutingNumber';
	public static final String XML_TAG_CREATE_CREDENTIALS = 'createCredentials';
	public static final String XML_TAG_CUSTOMER_SERVICE_NUMBER = 'customerServiceNumber';
	public static final String XML_TAG_DISCOVER_CONVEY_MID = 'discoverConveyedMid';
	public static final String XML_TAG_HARD_CODE_BILLING_DESCRIPTOR = 'hardCodedBillingDescriptor';
	public static final String XML_TAG_MAX_TRANSACTION_AMOUNT = 'maxTransactionAmount';
	public static final String XML_TAG_MERCHANT_CATEGORY_CODE = 'merchantCategoryCode';
	public static final String XML_TAG_MERCHANT_NAME = 'merchantName';
	public static final String XML_TAG_PRIMARY_CONTACT = 'primaryContact';
	public static final String XML_TAG_PHONE = 'phone';
	public static final String XML_TAG_PSP_MERCHANT_ID = 'pspMerchantId';
	public static final String XML_TAG_URL = 'url';
	public static final String XML_TAG_ECHECK_BILING_DESCRIPTOR = 'eCheckBillingDescriptor';
	public static final String XML_TAG_ECHECK_COMPANY_NAME = 'eCheckCompanyName';
	public static final String XML_TAG_TRANSACTION_ID = 'transactionId';
	public static final String XML_TAG_RESPONSE_CODE = 'responseCode';
	public static final String XML_TAG_RESPONSE_DESCRIPTION = 'responseDescription';
	public static final String XML_TAG_LEGALENTITY_ID = 'legalEntityId';
	public static final String XML_TAG_ERROR = 'error';
	public static final String XML_TAG_MERCHANT_IDENT_STRING = 'merchantIdentString';
	public static final String XML_TAG_SUBMERCHANT_ID = 'subMerchantId';
	
	
	//scheduler constants
	public static final String SCHEDULER_CRON_EXP = '0 0 * * * ?';
	
	public static String getResponseMessage(String responseCode){
		if(responseCode.equals(RESPONSE_APPROVED)){
			return RESPONSE_APPROVED_MESSAGE;
		}else if(responseCode.equals(RESPONSE_MANUAL_REVIEW)){
			return RESPONSE_MANUAL_REVIEW_MESSAGE;
		}else if(responseCode.equals(RESPONSE_RETRY)){
			return RESPONSE_RETRY_MESSAGE;
		}else if(responseCode.equals(RESPONSE_MANUAL_REVIEW_DUPLICATE)){
			return RESPONSE_MANUAL_REVIEW_DUPLICATE_MESSAGE;
		}else if(responseCode.equals(RESPONSE_DUPLICATE)){
			return RESPONSE_DUPLICATE_MESSAGE;
		}else if(responseCode.equals(RESPONSE_DECLINED)){
			return RESPONSE_DECLINED_MESSAGE;
		}else if(responseCode.equals(RESPONSE_MANUAL_REVIEW_BACKGROUND_CHECK_ERROR)){
			return RESPONSE_MANUAL_REVIEW_BACKGROUND_CHECK_ERROR_MESSAGE;
		}
		return null;
	}
}