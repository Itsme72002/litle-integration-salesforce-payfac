public class LegalEntityDeclinedResponse implements TestResponse{

	public static final String STATUS_MESSAGE = 'Success';
    public static final Integer STATUS_CODE = 201;
    
    public static final String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
										'<legalEntityCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
										    '<transactionId>82821190479136420</transactionId>'+
										    '<legalEntityId>82821189481022859</legalEntityId>'+
										    '<principals>'+
										        '<principal>'+
										            '<principalId>1</principalId>'+
										            '<firstName>p first</firstName>'+
										            '<lastName>p last</lastName>'+
										        '</principal>'+
										    '</principals>'+
										    '<responseCode>40</responseCode>'+
										    '<responseDescription>Declined</responseDescription>'+
										    '<backgroundCheckResults>'+
										        '<business>'+
										            '<verificationResult>'+
										                '<overallScore>'+
										                    '<score>50</score>'+
										                    '<description>Business is verified on multiple sources with no contradictory findings</description>'+
										                '</overallScore>'+
										                '<nameAddressTaxIdAssociation/>'+
										                '<nameAddressPhoneAssociation/>'+
										                '<verificationIndicators>'+
										                    '<nameVerified>false</nameVerified>'+
										                    '<addressVerified>false</addressVerified>'+
										                    '<cityVerified>false</cityVerified>'+
										                    '<stateVerified>false</stateVerified>'+
										                    '<zipVerified>false</zipVerified>'+
										                    '<phoneVerified>false</phoneVerified>'+
										                    '<taxIdVerified>false</taxIdVerified>'+
										                '</verificationIndicators>'+
										                '<riskIndicators>'+
										                    '<riskIndicator>'+
										                        '<code>UNKNOWN</code>'+
										                        '<description>Unknown Risk Factor</description>'+
										                    '</riskIndicator>'+
										                '</riskIndicators>'+
										            '</verificationResult>'+
										        '</business>'+
										        '<principal>'+
										            '<verificationResult>'+
										                '<overallScore>'+
										                    '<score>10</score>'+
										                    '<description>Critical ID elements not verified, are associated with different person(s,) or indications such as OFAC matches, deceased/invalid SSN, or SSN issued prior to birth date provided, etc. exist</description>'+
										                '</overallScore>'+
										                '<nameAddressSsnAssociation/>'+
										                '<nameAddressPhoneAssociation/>'+
										                '<verificationIndicators>'+
										                    '<nameVerified>false</nameVerified>'+
										                    '<addressVerified>false</addressVerified>'+
										                    '<phoneVerified>false</phoneVerified>'+
										                    '<ssnVerified>false</ssnVerified>'+
										                    '<dobVerified>false</dobVerified>'+
										                '</verificationIndicators>'+
										                '<riskIndicators>'+
										                    '<riskIndicator>'+
										                        '<code>UNKNOWN</code>'+
										                        '<description>Unknown Risk Factor</description>'+
										                    '</riskIndicator>'+
										                '</riskIndicators>'+
										            '</verificationResult>'+
										        '</principal>'+
										        '<businessToPrincipalAssociation>'+
										            '<score>40</score>'+
										            '<description>Individualâs SSN and Company FEIN match</description>'+
										        '</businessToPrincipalAssociation>'+
										    '</backgroundCheckResults>'+
										'</legalEntityCreateResponse>';

								 
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