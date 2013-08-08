public class LegalEntityFullDupeResponse implements TestResponse{

	public static final String STATUS_MESSAGE = 'Success';
    public static final Integer STATUS_CODE = 201;
    public static final String RESPONSE_CODE = '10';
    public static final String RESPONSE_DESCRIPTION = 'Approved';
    
    public static final String response = 
					    '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' + 
					'<legalEntityCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard" duplicate="true">' + 
					    '<transactionId>82821536674283575</transactionId>' + 
					    '<legalEntityId>82821536565084611</legalEntityId>' + 
					    '<principals>' + 
					        '<principal>' + 
					            '<principalId>1</principalId>' + 
					            '<firstName>p first</firstName>' + 
					            '<lastName>p last</lastName>' + 
					        '</principal>' + 
					    '</principals>' + 
					    '<responseCode>10</responseCode>' + 
					    '<responseDescription>Approved</responseDescription>' + 
					    '<backgroundCheckResults>' + 
					        '<business>' + 
					            '<verificationResult>' + 
					                '<overallScore>' + 
					                    '<score>50</score>' + 
					                    '<description>Business is verified on multiple sources with no contradictory findings</description>' + 
					                '</overallScore>' + 
					                '<nameAddressTaxIdAssociation/>' + 
					                '<nameAddressPhoneAssociation/>' + 
					                '<verificationIndicators>' + 
					                    '<nameVerified>false</nameVerified>' + 
					                    '<addressVerified>false</addressVerified>' + 
					                    '<cityVerified>false</cityVerified>' + 
					                    '<stateVerified>false</stateVerified>' + 
					                    '<zipVerified>false</zipVerified>' + 
					                    '<phoneVerified>false</phoneVerified>' + 
					                    '<taxIdVerified>false</taxIdVerified>' + 
					                '</verificationIndicators>' + 
					                '<riskIndicators/>' + 
					            '</verificationResult>' + 
					        '</business>' + 
					        '<principal>' + 
					            '<verificationResult>' + 
					                '<overallScore>' + 
					                    '<score>50</score>' + 
					                    '<description>Full name, address, phone , SSN verified</description>' + 
					                '</overallScore>' + 
					                '<nameAddressSsnAssociation/>' + 
					                '<nameAddressPhoneAssociation/>' + 
					                '<verificationIndicators>' + 
					                    '<nameVerified>false</nameVerified>' + 
					                    '<addressVerified>false</addressVerified>' + 
					                    '<phoneVerified>false</phoneVerified>' + 
					                    '<ssnVerified>false</ssnVerified>' + 
					                    '<dobVerified>false</dobVerified>' + 
					                '</verificationIndicators>' + 
					                '<riskIndicators/>' + 
					            '</verificationResult>' + 
					        '</principal>' + 
					        '<businessToPrincipalAssociation>' + 
					            '<score>50</score>' + 
					            '<description>Association found between the person and the company in the Company Contacts data</description>' + 
					        '</businessToPrincipalAssociation>' + 
					    '</backgroundCheckResults>' + 
					'</legalEntityCreateResponse>' ;
								 
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