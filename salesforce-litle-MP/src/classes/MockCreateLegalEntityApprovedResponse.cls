/*
Copyright (c) 2013 Litle & Co.
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/
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
public class MockCreateLegalEntityApprovedResponse {

    public static final String STATUS_MESSAGE = 'Approved';
    public static final Integer STATUS_CODE = 201;
    public static final String RESPONSE_CODE = '10';
    public static final String RESPONSE_DESCRIPTION = 'Approved';
    public static final String TRANSACTION_ID = '82821536564756680';
    public static final String LEGAL_ENTITY_ID = '82821536565084223';
	
    public HttpResponse respond(HttpRequest request){
    	
    	System.assertEquals(LitleConstants.LEGAL_ENTITY_REQUEST_ENDPOINT, request.getEndpoint());
    	System.assertEquals(LitleConstants.CREATE_HTTP_REQUEST_METHOD, request.getMethod());
    	System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_ACCEPT_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
        
    	HttpResponse res = new HttpResponse();
    	String approvedResponse = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
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
    	res.setBody(approvedResponse);
    	res.setStatusCode(STATUS_CODE);
    	res.setStatus(STATUS_MESSAGE);
    	return res;
    }
}