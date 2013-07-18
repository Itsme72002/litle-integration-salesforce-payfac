/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
public class MockCreateSMSuccess implements HttpCalloutMock{
	
	public static final String STATUS_MESSAGE = 'Success';
    public static final String SUB_MERCHANT_ID = '1100003';
	public static final String LITLE_MID = '01100003';
	
    public HttpResponse respond(HttpRequest request){
    	System.assertEquals(LitleConstants.CREATE_HTTP_REQUEST_METHOD, request.getMethod());
    	System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_ACCEPT_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
        
    	HttpResponse res = new HttpResponse();
    	String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
						 + '<subMerchantCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard" duplicate="true">'
						 + '<transactionId>82821240469914003</transactionId>'
						 + '<subMerchantId>'+SUB_MERCHANT_ID+'</subMerchantId>'
						 + '<merchantIdentString>'+LITLE_MID+'</merchantIdentString>'
						 + '</subMerchantCreateResponse>';
    	res.setBody(response);
    	res.setStatusCode(LitleConstants.SUB_MERCHANT_SUCCESS_RESPONSE_CODE);
    	res.setStatus(STATUS_MESSAGE);
    	return res;
    }
    
    /*
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<subMerchantCreateResponse
xmlns="http://psp.litle.com/api/merchant/onboard">
<transactionId>82821240469914003</transactionId>
<subMerchantId>1100003</subMerchantId>
<merchantIdentString>01100003</merchantIdentString>
<credentials>
<userName>JDoe123</userName>
<password>MyPassword</password>
</credentials>
<paypageCredentials>
<paypagCredential>
<userName>JDoe123</userName>
<paypageId>1234567890123456</paypageId>
</paypagCredential>
</paypageCredentials>
</subMerchantCreateResponse>
    
    
 <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<subMerchantCreateResponse
xmlns="http://psp.litle.com/api/merchant/onboard" duplicate="true">
<transactionId>82821240469914003</transactionId>
<originalSubMerchant>
<address>
<streetAddress1>Street Address 1</streetAddress1>
<streetAddress2>Street Address 2</streetAddress2>
<city>City</city>
<stateProvince>MA</stateProvince>
<postalCode>01970</postalCode>
<countryCode>USA</countryCode>
</address>
<amexMid>1234567890</amexMid>
<bankAccountNumber>XXXXXXX-2415</bankAccountNumber>
<bankRoutingNumber>840123124</bankRoutingNumber>
<customerServiceNumber>8407809000</customerServiceNumber>
<discoverConveyedMid>123456789012345</discoverConveyedMid>
<hardCodedBillingDescriptor>billing
Descriptor</hardCodedBillingDescriptor>
<maxTransactionAmount>8400</maxTransactionAmount>
<merchantCategoryCode>5964</merchantCategoryCode>
<merchantName>Temp Merchant Name</merchantName>
<primaryContact/>
<url>http://merchantUrl</url>
<subMerchantId>1002</subMerchantId>
<disabled>false</disabled>
<transactionId>82821240041390243</transactionId>
<merchantIdentString>01100002</merchantIdentString>
</originalSubMerchant>
</subMerchantCreateResponse>
    
    */
}