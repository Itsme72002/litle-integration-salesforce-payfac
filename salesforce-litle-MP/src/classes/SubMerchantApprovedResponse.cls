public class SubMerchantApprovedResponse implements TestResponse {

	public static final String STATUS_MESSAGE = 'Success';
    public static final String SUB_MERCHANT_ID = '1100003';
	public static final String LITLE_MID = '01100003';
	public static final Integer STATUS_CODE = 201;
	
	public static final String approvedResponse = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
						 + '<subMerchantCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard">'
						 + '<transactionId>82821240469914003</transactionId>'
						 + '<subMerchantId>'+SUB_MERCHANT_ID+'</subMerchantId>'
						 + '<merchantIdentString>'+LITLE_MID+'</merchantIdentString>'
						 + '</subMerchantCreateResponse>';
						 
	 public String getStatusMessage(){
		return STATUS_MESSAGE;
	}
	
	public Integer getStatusCode(){
		return STATUS_CODE;
	}
	
	public String getResponseBody(){
		return approvedResponse;
	}
}