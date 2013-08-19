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
public class MockCreateLegalEntityDuplicateResponse implements HttpCalloutMock {
	public static final String STATUS_MESSAGE = 'Success';
    public static final Integer STATUS_CODE = 201;
    public static final String RESPONSE_CODE = '36';
    public static final String RESPONSE_DESCRIPTION = 'Duplicate';
    public static final String TRANSACTION_ID = '82821203948749101';
    public static final String LEGAL_ENTITY_ID = '82821203948912667';
    public Integer calledCount = 0;
    
	
    public HttpResponse respond(HttpRequest request){
    	System.assertEquals(LitleConstants.LEGAL_ENTITY_REQUEST_ENDPOINT, request.getEndpoint());
    	System.assertEquals(LitleConstants.CREATE_HTTP_REQUEST_METHOD, request.getMethod());
    	System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_ACCEPT_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
 	    
 	    HttpResponse res = new HttpResponse();
 	    String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
						 + '<legalEntityCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard" duplicate="true">'
						 + '<transactionId>'+TRANSACTION_ID+'</transactionId>'
						 + '<principals>'
						 + '<principal>'
						 + '<firstName>John</firstName>'
						 + '<lastName>Doe</lastName>'
						 + '</principal>'
						 + '</principals>'
						 + '<responseCode>'+RESPONSE_CODE+'</responseCode>'
						 + '<responseDescription>'+RESPONSE_DESCRIPTION+'</responseDescription>'
						 + '<originalLegalEntity>'
						 + '<legalEntityName>Entity One</legalEntityName>'
						 + '<legalEntityType>CORPORATION</legalEntityType>'
						 + '<doingBusinessAs>Doing Business As</doingBusinessAs>'
						 + '<taxId>XXXXX-0000</taxId>'
						 + '<visaAnnualSalesVolume>80</visaAnnualSalesVolume>'
						 + '<hasAcceptedCreditCards>true</hasAcceptedCreditCards>'
						 + '<address>'
						 + '<streetAddress1>100 Main Street</streetAddress1>'
						 + '<streetAddress2>Suite 5</streetAddress2>'
						 + '<city>Boston</city>'
						 + '<stateProvince>MA</stateProvince>'
						 + '<postalCode>01890</postalCode>'
						 + '<countryCode>USA</countryCode>'
						 + '</address>'
						 + '<PCI>'
						 + '<isExclusiveToPsp>true</isExclusiveToPsp>'
						 + '<isPciComplianceValidated>true</isPciComplianceValidated>'
						 + '<scanningVendor>scanning Vendor</scanningVendor>'
						 + '<qualifiedSecurityAssessor>qsa</qualifiedSecurityAssessor>'
						 + '<mostRecentlyPassedScan>2012-06-12</mostRecentlyPassedScan>'
						 + '<reportOnCompliance>2012-06-15</reportOnCompliance>'
						 + '<pciLevel>1</pciLevel>'
						 + '</PCI>'
						 + '<principals>'
						 + '<principal>'
						 + '<principalId>1</principalId>'
						 + '<firstName>John</firstName>'
						 + '<lastName>Doe</lastName>'
						 + '<emailAddress>John.Doe@Company.com</emailAddress>'
						 + '<ssn>001-00-9876</ssn>'
						 + '<contactPhone>7817659800</contactPhone>'
						 + '<dateOfBirth>1980-10-12</dateOfBirth>'
						 + '<driversLicense>XXXXXXXX-9832</driversLicense>'
						 + '<driversLicenseState>MA</driversLicenseState>'
						 + '<address>'
						 + '<streetAddress1>200 Main Street</streetAddress1>'
						 + '<streetAddress2>Apt. 6</streetAddress2>'
						 + '<city>Boston</city>'
						 + '<stateProvince>MA</stateProvince>'
						 + '<postalCode>01890</postalCode>'
						 + '<countryCode>USA</countryCode>'
						 + '</address>'
						 + '</principal>'
						 + '</principals>'
						 + '<legalEntityId>'+LEGAL_ENTITY_ID+'</legalEntityId>'
						 + '<responseCode>10</responseCode>'
						 + '<responseDescription>Approved</responseDescription>'
						 + '<backgroundCheckResults>'
						 + '<business>'
						 + '<verificationResult>'
						 + '<overallScore>'
						 + '<score>50</score>'
						 + '<description>Business is verified on multiple sources with no'
						 + 'contradictory findings</description>'
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
						 + '<code>ADDRESS_MATCHES_PRISON</code>'
						 + '<description>The input address matches a prison'
						 + 'address</description>'
						 + '</riskIndicator>'
						 + '</riskIndicators>'
						 + '</verificationResult>'
						 + '</business>'
						 + '<principal>'
						 + '<verificationResult>'
						 + '<overallScore>'
						 + '<score>50</score>'
						 + '<description>Full name, address, phone, SSN verified</description>'
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
						 + '<code>ADDRESS_MATCHES_PRISON</code>'
						 + '<description>The input address matches a prison'
						 + 'address</description>'
						 + '</riskIndicator>'
						 + '</riskIndicators>'
						 + '</verificationResult>'
						 + '</principal>'
						 + '<businessToPrincipalAssociation>'
						 + '<score>50</score>'
						 + '<description>Association found between the person and the company in'
						 + 'the Company Contacts data</description>'
						 + '</businessToPrincipalAssociation>'
						 + '<bankruptcyData>'
						 + '<bankruptcyType>Sub-category of bankruptcy</bankruptcyType>'
						 + '<bankruptcyCount>1</bankruptcyCount>'
						 + '<companyName>Company Name</companyName>'
						 + '<streetAddress1>100 Main Street</streetAddress1>'
						 + '<streetAddress2>Suite 2</streetAddress2>'
						 + '<city>Boston</city>'
						 + '<state>MA</state>'
						 + '<zip>01150</zip>'
						 + '<zip4>2202</zip4>'
						 + '<filingDate>2011-05-13</filingDate>'
						 + '</bankruptcyData>'
						 + '<lienResult>'
						 + '<lienyType>Subtype of Lien</lienyType>'
						 + '<releasedCount>2</releasedCount>'
						 + '<unreleasedCount>1</unreleasedCount>'
						 + '<companyName>Company Name</companyName>'
						 + '<streetAddress1>100 Main Street</streetAddress1>'
						 + '<streetAddress2>Suite 2</streetAddress2>'
						 + '<city>Boston</city>'
						 + '<state>MA</state>'
						 + '<zip>01150</zip>'
						 + '<zip4>2202</zip4>'
						 + '<filingDate>2011-05-13</filingDate>'
						 + '</lienResult>'
						 + '</backgroundCheckResults>'
						 + '<transactionId>82821203948749028</transactionId>'
						 + '</originalLegalEntity>'
						 + '</legalEntityCreateResponse>';
		res.setBody(response);
    	res.setStatusCode(STATUS_CODE);
    	res.setStatus(STATUS_MESSAGE);
    	return res;
    }

}