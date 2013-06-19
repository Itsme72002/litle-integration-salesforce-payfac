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
public class MockCreateLegalEntityApprovedResponse implements HttpCalloutMock{

    public static final String DEFAULT_STRING = 'Default String';
	
    public HttpResponse respond(HttpRequest request){
    	System.assertEquals(LitleMidFormController.LEGAL_ENTITY_ENDPOINT, request.getEndpoint());
    	System.assertEquals('POST', request.getMethod());
    	System.assertEquals(LitleMidFormController.CONTENT_TYPE, request.getHeader('Content-Type'));
 	    System.assertEquals(LitleMidFormController.ACCEPT, request.getHeader('Accept'));
        
    	HttpResponse res = new HttpResponse();
    	String approvedResponse = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
								 + '<legalEntityCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard">'
								 + '<transactionId>82821536564756680</transactionId>'
								 + '<legalEntityId>82821536565084223</legalEntityId>'
								 + '<principals>'
								 + '<principal>'
								 + '<principalId>1</principalId>'
								 + '<firstName>p first</firstName>'
								 + '<lastName>p last</lastName>'
								 + '</principal>'
								 + '</principals>'
								 + '<responseCode>10</responseCode>'
								 + '<responseDescription>Approved</responseDescription>'
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
    	res.setBody(approvedResponse);
    	res.setStatusCode(201);
    	res.setStatus('Approved');
    	return res;
    }
}