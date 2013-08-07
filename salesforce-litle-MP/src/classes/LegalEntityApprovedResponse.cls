public class LegalEntityApprovedResponse implements TestResponse{

	public static final String STATUS_MESSAGE = 'Approved';
    public static final Integer STATUS_CODE = 201;
    public static final String RESPONSE_CODE = '10';
    public static final String RESPONSE_DESCRIPTION = 'Approved';
    public static final String TRANSACTION_ID = '82821536564756680';
    public static final String LEGAL_ENTITY_ID = '82821536565084223';
    
    public static final String approvedResponse = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
								 + '<legalEntityCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard">'
								 + '<transactionId>'+TRANSACTION_ID+'</transactionId>'
								 + '<legalEntityId>'+LEGAL_ENTITY_ID+'</legalEntityId>'
								 + '<principals>'
								 + '<principal>'
								 + '<principalId>1</principalId>'
								 + '<firstName>p first</firstName>'
								 + '<lastName>p last</lastName>'
								 + '</principal>'
								 + '</principals>'
								 + '<responseCode>'+RESPONSE_CODE+'</responseCode>'
								 + '<responseDescription>'+RESPONSE_DESCRIPTION+'</responseDescription>'
								 + '<backgroundCheckResults>'
								 + '<business>'
								 + '<verificationResult>'
								 + '<overallScore>'
								 + '<score>40</score>'
								 + '<description>Business identity is confirmed at the input address</description>'
								 + '</overallScore>'
								 + '<nameAddressTaxIdAssociation/>'
								 + '<nameAddressPhoneAssociation/>'
								 + '<verificationIndicators>'
								 + '<nameVerified>false</nameVerified>'
								 + '<addressVerified>false</addressVerified>'
								 + '<cityVerified>false</cityVerified>'
								 + '<stateVerified>false</stateVerified>'
								 + '<zipVerified>false</zipVerified>'
								 + '<phoneVerified>false</phoneVerified>'
								 + '<taxIdVerified>false</taxIdVerified>'
								 + '</verificationIndicators>'
								 + '<riskIndicators>'
								 + '<riskIndicator>'
								 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
								 + '<description>The input zip code belongs to a post office box</description>'
								 + '</riskIndicator>'
								 + '</riskIndicators>'
								 + '</verificationResult>'
								 + '</business>'
								 + '<principal>'
								 + '<verificationResult>'
								 + '<overallScore>'
								 + '<score>40</score>'
								 + '<description>Last name, address &amp; SSN or phone verified; first name, phone or SSN verification failures</description>'
								 + '</overallScore>'
								 + '<nameAddressSsnAssociation/>'
								 + '<nameAddressPhoneAssociation/>'
								 + '<verificationIndicators>'
								 + '<nameVerified>false</nameVerified>'
								 + '<addressVerified>false</addressVerified>'
								 + '<phoneVerified>false</phoneVerified>'
								 + '<ssnVerified>false</ssnVerified>'
								 + '<dobVerified>false</dobVerified>'
								 + '</verificationIndicators>'
								 + '<riskIndicators>'
								 + '<riskIndicator>'
								 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
								 + '<description>The input zip code belongs to a post office box</description>'
								 + '</riskIndicator>'
								 + '</riskIndicators>'
								 + '</verificationResult>'
								 + '</principal>'
								 + '<businessToPrincipalAssociation>'
								 + '<score>30</score>'
								 + '<description>Company and Home Addresses are similar, and the name is part of the Company Name</description>'
								 + '</businessToPrincipalAssociation>'
								 + '</backgroundCheckResults>'
								 + '</legalEntityCreateResponse>';
								 
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