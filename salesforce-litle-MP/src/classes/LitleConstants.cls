public class LitleConstants {
	
	// MP request constants
	public static final String RETRIEVE_HTTP_REQUEST_METHOD = 'GET';
	public static final String CREATE_HTTP_REQUEST_METHOD = 'POST';
	public static final String LEGAL_ENTITY_REQUEST_ENDPOINT = 'https://psp-cert.litle.com/legalentity';
	public static final String REQUEST_HEADER_CONTENT_TYPE = 'application/com.litle.psp-v5+xml';
	public static final String REQUEST_HEADER_ACCEPT = 'application/com.litle.psp-v5+xml';
	public static final String URL_SEPARATOR = '/';
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
	// http response codes
	public static final Integer LEGAL_ENTITY_SUCCESS_RESPONSE_CODE = 201;
	public static final Integer SUB_MERCHANT_SUCCESS_RESPONSE_CODE = 200;
	
	public static final List<Integer> PCI_LEVELS = new List<Integer>{ 1, 2, 3, 4 };
	
	//scheduler constants
	public static final String SCHEDULER_CRON_EXP = '0 38 * * 6 ? 2013';
	
	public String getResponseMessage(String responseCode){
		if(responseCode.equals(RESPONSE_APPROVED)){
			return 'Response Approved';
		}else if(responseCode.equals(RESPONSE_MANUAL_REVIEW)){
			return 'Your request is under Manual Review.';
		}else if(responseCode.equals(RESPONSE_RETRY)){
			return 'Retry Request.';
		}else if(responseCode.equals(RESPONSE_MANUAL_REVIEW_DUPLICATE)){
			return '';
		}else if(responseCode.equals(RESPONSE_DUPLICATE)){
			return 'Duplicate Response';
		}else if(responseCode.equals(RESPONSE_DECLINED)){
			return 'Your request has been Declined.';
		}else if(responseCode.equals(RESPONSE_MANUAL_REVIEW_BACKGROUND_CHECK_ERROR)){
			return '';
		}
		return null;
	}
}