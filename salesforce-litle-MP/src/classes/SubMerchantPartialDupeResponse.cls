public class SubMerchantPartialDupeResponse implements TestResponse {

	public static final String STATUS_MESSAGE = 'Success';
	public static final Integer STATUS_CODE = 201;
	
	public static final String response = 
					'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
					'<subMerchantCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard" duplicate="true">'+
					    '<transactionId>82822768704144779</transactionId>'+
					    '<subMerchantId>1011</subMerchantId>'+
					    '<merchantIdentString>01100012</merchantIdentString>'+
					'</subMerchantCreateResponse>';
						 
	 public String getStatusMessage(){
		return STATUS_MESSAGE;
	}
	
	public Integer getStatusCode(){
		return STATUS_CODE;
	}
	
	public String getResponseBody(){
		return response;
	}
}