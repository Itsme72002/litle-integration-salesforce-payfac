public class SubMerchantFullDupeResponse implements TestResponse {

	public static final String STATUS_MESSAGE = 'Success';
	public static final Integer STATUS_CODE = 201;
	
	public static final String response = 
					'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+ 
					'<subMerchantCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard" duplicate="true">'+ 
					    '<transactionId>82821819754661104</transactionId>'+ 
					    '<originalSubMerchant>'+ 
					        '<address>'+ 
					            '<streetAddress1>Street Address 1</streetAddress1>'+ 
					            '<streetAddress2>Street Address 2</streetAddress2>'+ 
					            '<city>City</city>'+ 
					            '<stateProvince>MA</stateProvince>'+ 
					            '<postalCode>01970</postalCode>'+ 
					            '<countryCode>USA</countryCode>'+ 
					        '</address>'+ 
					        '<amexMid>1234567890</amexMid>'+ 
					        '<bankAccountNumber>XXXXXXX-2415</bankAccountNumber>'+ 
					        '<bankRoutingNumber>840123124</bankRoutingNumber>'+ 
					        '<customerServiceNumber>8407809000</customerServiceNumber>'+ 
					        '<discoverConveyedMid>123456789012345</discoverConveyedMid>'+ 
					        '<hardCodedBillingDescriptor>billing Descriptor</hardCodedBillingDescriptor>'+ 
					        '<maxTransactionAmount>8400</maxTransactionAmount>'+ 
					        '<merchantCategoryCode>5964</merchantCategoryCode>'+ 
					        '<merchantName>Temp Merchant Name</merchantName>'+ 
					        '<primaryContact/>'+ 
					        '<url>http://merchantUrl</url>'+ 
					        '<subMerchantId>1004</subMerchantId>'+ 
					        '<disabled>false</disabled>'+ 
					        '<transactionId>82821819754661104</transactionId>'+ 
					        '<merchantIdentString>01100004</merchantIdentString>'+ 
					    '</originalSubMerchant>'+ 
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