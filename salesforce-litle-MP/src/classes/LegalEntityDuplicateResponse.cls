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
public class LegalEntityDuplicateResponse implements TestResponse{

	public static final String STATUS_MESSAGE = 'Success';
    public static final Integer STATUS_CODE = 201;
    public static final String RESPONSE_CODE = '36';
    public static final String RESPONSE_DESCRIPTION = 'Duplicate';
    public static final String TRANSACTION_ID = '82821203948749101';
    public static final String LEGAL_ENTITY_ID = '82821203948912667';
    
    public static final String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
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