public class LitleConstants {
	
	public static final String MASK_CHARACTER = '*';
	
	// MP request constants
	public static final String RETRIEVE_HTTP_REQUEST_METHOD = 'GET';
	public static final String MCC_HTTP_REQUEST_METHOD = 'GET';
	public static final String CREATE_HTTP_REQUEST_METHOD = 'POST';
	public static String LEGAL_ENTITY_REQUEST_ENDPOINT = 'https://psp-cert.litle.com/legalentity';
	public static final String LEGAL_ENTITY_URI = 'legalentity';
	public static final String SUBMERCHANT_URI = 'submerchant';
	public static final String LEGAL_ENTITY_META_UI_URI = 'legalEntity';
	public static final String SUBMERCHANT_META_UI_URI = 'subMerchant';
	
	public static final String REQUEST_HEADER_CONTENT_TYPE = 'application/com.litle.psp-v5+xml';
	public static final String REQUEST_HEADER_ACCEPT = 'application/com.litle.psp-v5+xml';
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
	public static final Integer SUB_MERCHANT_SUCCESS_RESPONSE_CODE = 200;
	
	public static final List<Integer> PCI_LEVELS = new List<Integer>{ 1, 2, 3, 4 };
	
	
	// litle environment constants
	public static final String LITLE_ENV_PROD = 'https://psp.litle.com';
	public static final String LITLE_ENV_CERT = 'https://psp-cert.litle.com';
	public static final String LITLE_ENV_PRE_CERT = 'https://psp-cert.litle.com';
	public static final String LITLE_ENV_PRE_LIVE = 'https://psp-cert.litle.com';
	public static final String LITLE_ENV_SANDBOX = 'https://psp-cert.litle.com';
	
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