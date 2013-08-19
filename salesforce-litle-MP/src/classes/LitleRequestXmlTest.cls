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
@isTest
private class LitleRequestXmlTest {
	public static final String TEST_STRING = 'test';
	
	static testMethod void testGenerateCreateLegalEntityRequestXml(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        System.assertEquals(null, litleRequestXml.generateCreateLegalEntityRequestXml(null, false));
    	
    	// Check for XML with no values, just tags
    	String actualXml = litleRequestXml.generateCreateLegalEntityRequestXml(legalEntityModel, false);
    	String expectedXml = getCreateLegalEntityRequestXML('','',false);
    	
    	System.assertEquals(expectedXml, actualXml);
    	
    	//prepare a legal entity model for individual proprietorship
		legalEntityModel.setLegalEntityName(TEST_STRING);
    	legalEntityModel.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name());
    	legalEntityModel.setLegalEntityDoingBusinessAs(TEST_STRING);
    	legalEntityModel.setLegalEntityContactPhone(TEST_STRING);
    	
    	Address address = new Address();
    	address.setStreetaddress1(TEST_STRING);
    	address.setStreetAddress2(TEST_STRING);
    	address.setCity(TEST_STRING);
    	address.setStateProvince(TEST_STRING);
    	address.setPostalCode(TEST_STRING);
    	address.setCountryCode(TEST_STRING);
        legalEntityModel.setLegalEntityAddress(address);
        
        Principal principal = new Principal();
        principal.setAddress(address);
        principal.setFirstName(TEST_STRING);
		principal.setLastName(TEST_STRING);
		principal.setEmailAddress(TEST_STRING);
		principal.setContactPhone(TEST_STRING);
		principal.setDateOfBirth(TEST_STRING);
		principal.setDriversLicense(TEST_STRING);
		principal.setDriversLicenseState(TEST_STRING);
		principal.setSsn(TEST_STRING);
        legalEntityModel.setLegalEntityPrincipal(principal);
        
        PCI pci = new PCI();
        pci.setIsExclusiveToPsp(TEST_STRING);
        pci.setIsPciComplianceValidated(TEST_STRING);
        pci.setPciLevel(TEST_STRING);
        pci.setScanningVendor(TEST_STRING);
        pci.setQualifiedSecurityAssessor(TEST_STRING);
        pci.setMostRecentlyPassedScan(TEST_STRING);
        pci.setReportOnCompliance(TEST_STRING);
        legalEntityModel.setLegalEntityPci(pci);
    	
    	legalEntityModel.setLegalEntityTaxId(TEST_STRING);
    	legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(TEST_STRING);
    	legalEntityModel.setLegalEntityHasAcceptedCreditCards(TEST_STRING);
    	// Create its XML
    	 actualXml = litleRequestXml.generateCreateLegalEntityRequestXml(legalEntityModel,false);
    	 expectedXml = getCreateLegalEntityRequestXML(TEST_STRING,LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name(),false);
    	System.assertEquals(expectedXml, actualXml);
    	
    	 actualXml = litleRequestXml.generateCreateLegalEntityRequestXml(legalEntityModel,true);
    	 expectedXml = getCreateLegalEntityRequestXML(TEST_STRING,LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name(),true);
    	System.assertEquals(expectedXml, actualXml);
    	
    	// change the legal entity type and check
    	legalEntityModel.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.CORPORATION.name());
    	actualXml = litleRequestXml.generateCreateLegalEntityRequestXml(legalEntityModel, false);
    	expectedXml = getCreateLegalEntityRequestXML(TEST_STRING,LegalEntityType.LegalEntityTypeEnum.CORPORATION.name(), false);
    	System.assertEquals(expectedXml, actualXml);
    	
    	actualXml = litleRequestXml.generateCreateLegalEntityRequestXml(legalEntityModel, true);
    	expectedXml = getCreateLegalEntityRequestXML(TEST_STRING,LegalEntityType.LegalEntityTypeEnum.CORPORATION.name(), true);
    	System.assertEquals(expectedXml, actualXml);
    }
    
    
    static testMethod void testGenerateCreateSubMerchantRequestXml(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        System.assertEquals(null, litleRequestXml.generateCreateSubMerchantRequestXml(null));
    	
    	// Check for XML with no values, just tags
    	String actualXml = litleRequestXml.generateCreateSubMerchantRequestXml(subMerchantModel);
    	String expectedXml = getCreateSubMerchantRequestXML('');
    	
    	System.assertEquals(expectedXml, actualXml);
    	
    	//prepare a legal entity model for individual proprietorship
		subMerchantModel.getSubMerchantAddress().setStreetAddress1(TEST_STRING);
		subMerchantModel.getSubMerchantAddress().setStreetAddress2(TEST_STRING);
		subMerchantModel.getSubMerchantAddress().setCity(TEST_STRING);
		subMerchantModel.getSubMerchantAddress().setStateProvince(TEST_STRING);
		subMerchantModel.getSubMerchantAddress().setPostalCode(TEST_STRING);
		subMerchantModel.getSubMerchantAddress().setCountryCode(TEST_STRING);
		subMerchantModel.setSubMerchantAmexMid(TEST_STRING);
		subMerchantModel.setSubMerchantBankAccountNumber(TEST_STRING);
		subMerchantModel.setSubMerchantBankRoutingNumber(TEST_STRING);
		subMerchantModel.setSubMerchantCreateCredentials(TEST_STRING);
		subMerchantModel.setSubMerchantCustomerServiceNumber(TEST_STRING);
		subMerchantModel.setSubMerchantDiscoverConveyMid(TEST_STRING);
		subMerchantModel.setSubMerchantHardCodeBillingDescriptor(TEST_STRING);
		subMerchantModel.setSubMerchantMaxTransactionAmount(TEST_STRING);
		subMerchantModel.setSubMerchantMerchantCategoryCode(TEST_STRING);
		subMerchantModel.setSubMerchantMerchantName(TEST_STRING);
		subMerchantModel.getSubMerchantPrimaryContact().setFirstName(TEST_STRING);
		subMerchantModel.getSubMerchantPrimaryContact().setLastName(TEST_STRING);
		subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(TEST_STRING);
		subMerchantModel.getSubMerchantPrimaryContact().setPhone(TEST_STRING);
		subMerchantModel.setSubMerchantPspMerchantId(TEST_STRING);
		subMerchantModel.setSubMerchantUrl(TEST_STRING);
		subMerchantModel.setSubMerchanteCheckBillingDescriptor(TEST_STRING);
		subMerchantModel.setSubMerchanteCheckCompanyName(TEST_STRING);
    	// Create its XML
    	 actualXml = litleRequestXml.generateCreateSubMerchantRequestXml(subMerchantModel);
    	 expectedXml = getCreateSubMerchantRequestXML(TEST_STRING);
    	System.assertEquals(expectedXml, actualXml);
    	
    	
    }
    static testMethod void testGetCreateLegalEntityRequest(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        //LitleRequestXml LitleRequestXml = new LitleRequestXml(legalEntityModel, subMerchantModel, false) ;
    	
    	// Check for XML with no values, just tags
    	String actualXml = LitleRequestXml.generateCreateLegalEntityRequestXml(legalEntityModel, false);
    	String expectedXml = getCreateLegalEntityRequestXML('','', false);
    	System.assertEquals(expectedXml, actualXml);
    	Httprequest request = LitleRequestXml.getCreateLegalEntityRequest(TEST_STRING, TEST_STRING,legalEntityModel, false, 'CERT');
    	Blob headerValue = Blob.valueOf(TEST_STRING+':'+TEST_STRING); 
 	    String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
 	    
 	    System.assertEquals(LitleConstants.LITLE_ENV_CERT + LitleConstants.URL_SEPARATOR + LitleConstants.LEGAL_ENTITY_URI, request.getEndpoint());
    	System.assertEquals(authorizationHeader, request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_ACCEPT_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
 		System.assertEquals(LitleConstants.CREATE_HTTP_REQUEST_METHOD, request.getMethod());
 		System.assertEquals(expectedXml, request.getBody());
    }
    
    static testMethod void testGetCreateSubMerchantRequest(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        //LitleRequestXml LitleRequestXml = new LitleRequestXml(legalEntityModel, subMerchantModel, false) ;
    	
    	// Check for XML with no values, just tags
    	String actualXml = LitleRequestXml.generateCreateSubMerchantRequestXml(subMerchantModel);
    	String expectedXml = getCreateSubMerchantRequestXML('');
    	System.assertEquals(expectedXml, actualXml);
    	Httprequest request = LitleRequestXml.getCreateSubMerchantRequest(TEST_STRING, TEST_STRING, TEST_STRING, subMerchantModel, 'CERT');
    	Blob headerValue = Blob.valueOf(TEST_STRING+':'+TEST_STRING); 
 	    String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
 	    
 	    System.assertEquals(LitleConstants.LITLE_ENV_CERT + LitleConstants.URL_SEPARATOR + LitleConstants.LEGAL_ENTITY_URI +LitleConstants.URL_SEPARATOR
 	    						+ TEST_STRING + LitleConstants.URL_SEPARATOR + LitleConstants.SUBMERCHANT_URI , request.getEndpoint());
    	System.assertEquals(authorizationHeader, request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_ACCEPT_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
 		System.assertEquals(LitleConstants.CREATE_HTTP_REQUEST_METHOD, request.getMethod());
 		System.assertEquals(expectedXml, request.getBody());
    }
    
    
    static String getCreateSubMerchantRequestXML(String defaultValue){
    	return '<?xml version="1.0" encoding="UTF-8"?>'
				+ '<subMerchantCreateRequest xmlns="http://psp.litle.com/api/merchant/onboard">'
				+ '<address>'
				+ (String.isNotEmpty(defaultValue) ? '<streetAddress1>'+ defaultValue +'</streetAddress1>': '')
				+ (String.isNotEmpty(defaultValue) ? '<streetAddress2>'+ defaultValue +'</streetAddress2>': '')
				+ (String.isNotEmpty(defaultValue) ? '<city>'+ defaultValue +'</city>': '')
				+ (String.isNotEmpty(defaultValue) ? '<stateProvince>'+ defaultValue +'</stateProvince>': '')
				+ (String.isNotEmpty(defaultValue) ? '<postalCode>'+ defaultValue +'</postalCode>': '')
				+ (String.isNotEmpty(defaultValue) ? '<countryCode>'+ defaultValue +'</countryCode>': '')
				+ '</address>'
				+ (String.isNotEmpty(defaultValue) ? '<amexMid>'+ defaultValue +'</amexMid>': '')
				+ (String.isNotEmpty(defaultValue) ? '<bankAccountNumber>'+ defaultValue +'</bankAccountNumber>': '')
				+ (String.isNotEmpty(defaultValue) ? '<bankRoutingNumber>'+ defaultValue +'</bankRoutingNumber>': '')
				+ (String.isNotEmpty(defaultValue) ? '<createCredentials>'+ defaultValue +'</createCredentials>': '')
				+ (String.isNotEmpty(defaultValue) ? '<customerServiceNumber>'+ defaultValue +'</customerServiceNumber>': '')
				+ (String.isNotEmpty(defaultValue) ? '<discoverConveyedMid>'+ defaultValue +'</discoverConveyedMid>': '')
				+ (String.isNotEmpty(defaultValue) ? '<hardCodedBillingDescriptor>'+ defaultValue +'</hardCodedBillingDescriptor>': '')
				+ (String.isNotEmpty(defaultValue) ? '<maxTransactionAmount>'+ defaultValue +'</maxTransactionAmount>': '')
				+ (String.isNotEmpty(defaultValue) ? '<merchantCategoryCode>'+ defaultValue +'</merchantCategoryCode>': '')
				+ (String.isNotEmpty(defaultValue) ? '<merchantName>'+ defaultValue +'</merchantName>': '')
				+ '<primaryContact>'
				+ (String.isNotEmpty(defaultValue) ? '<firstName>'+ defaultValue +'</firstName>': '')
				+ (String.isNotEmpty(defaultValue) ? '<lastName>'+ defaultValue +'</lastName>': '')
				+ (String.isNotEmpty(defaultValue) ? '<phone>'+ defaultValue +'</phone>': '')
				+ (String.isNotEmpty(defaultValue) ? '<emailAddress>'+ defaultValue +'</emailAddress>': '')
				+ '</primaryContact>'
				+ (String.isNotEmpty(defaultValue) ? '<pspMerchantId>'+ defaultValue +'</pspMerchantId>': '')
				+ (String.isNotEmpty(defaultValue) ? '<url>'+ defaultValue +'</url>': '')
				+ (String.isNotEmpty(defaultValue) ? '<eCheckBillingDescriptor>'+ defaultValue +'</eCheckBillingDescriptor>': '')
				+ (String.isNotEmpty(defaultValue) ? '<eCheckCompanyName>'+ defaultValue +'</eCheckCompanyName>': '')
				+ '</subMerchantCreateRequest>';
				    	
    }
    static String getCreateLegalEntityRequestXML(String defaultValue, String legalEntityType, Boolean maskPiInformation){
    	return '<?xml version="1.0" encoding="UTF-8"?>'+
					'<legalEntityCreateRequest xmlns="http://psp.litle.com/api/merchant/onboard">'+
						(String.isNotEmpty(defaultValue) ? '<legalEntityName>'+ defaultValue +'</legalEntityName>' : '')+
						(String.isNotEmpty(defaultValue) ? '<legalEntityType>'+ legalEntityType +'</legalEntityType>' : '')+
						(String.isNotEmpty(defaultValue) ? '<doingBusinessAs>'+ defaultValue +'</doingBusinessAs>' : '')+
						(String.isNotEmpty(defaultValue) ? '<taxId>'+ defaultValue +'</taxId>' : '')+
						(String.isNotEmpty(defaultValue) ? '<contactPhone>'+ defaultValue +'</contactPhone>' : '')+
						(String.isNotEmpty(defaultValue) ? '<annualCreditCardSalesVolume>'+ defaultValue +'</annualCreditCardSalesVolume>' : '')+
						(String.isNotEmpty(defaultValue) ? '<hasAcceptedCreditCards>'+ defaultValue +'</hasAcceptedCreditCards>' : '')+
						'<address>'+
							(String.isNotEmpty(defaultValue) ? '<streetAddress1>'+ defaultValue +'</streetAddress1>' : '')+
							(String.isNotEmpty(defaultValue) ? '<streetAddress2>'+ defaultValue +'</streetAddress2>' : '')+
							(String.isNotEmpty(defaultValue) ? '<city>'+ defaultValue +'</city>' : '')+
							(String.isNotEmpty(defaultValue) ? '<stateProvince>'+ defaultValue +'</stateProvince>' : '')+
							(String.isNotEmpty(defaultValue) ? '<postalCode>'+ defaultValue +'</postalCode>' : '')+
							(String.isNotEmpty(defaultValue) ? '<countryCode>'+ defaultValue +'</countryCode>' : '')+
						'</address>' +
						'<PCI>' +
							(String.isNotEmpty(defaultValue) ? '<isExclusiveToPsp>'+ defaultValue +'</isExclusiveToPsp>' : '')+
							(String.isNotEmpty(defaultValue) ? '<isPciComplianceValidated>'+ defaultValue +'</isPciComplianceValidated>' : '')+
							(String.isNotEmpty(defaultValue) ? '<scanningVendor>'+ defaultValue +'</scanningVendor>' : '')+
							(String.isNotEmpty(defaultValue) ? '<qualifiedSecurityAssessor>'+ defaultValue +'</qualifiedSecurityAssessor>' : '')+
							(String.isNotEmpty(defaultValue) ? '<mostRecentlyPassedScan>'+ defaultValue +'</mostRecentlyPassedScan>' : '')+
							(String.isNotEmpty(defaultValue) ? '<reportOnCompliance>'+ defaultValue +'</reportOnCompliance>' : '')+
							(String.isNotEmpty(defaultValue) ? '<pciLevel>'+ defaultValue +'</pciLevel>' : '')+
						'</PCI>' +
						'<principals>' +
							'<principal>' +
								(String.isNotEmpty(defaultValue) ? '<firstName>'+ defaultValue +'</firstName>' : '')+
								(String.isNotEmpty(defaultValue) ? '<lastName>'+ defaultValue +'</lastName>' : '')+
								(String.isNotEmpty(defaultValue) ? '<emailAddress>'+ defaultValue +'</emailAddress>' : '')+
								(maskPiInformation ? (String.isNotEmpty(defaultValue) ? '<ssn>'+ StringUtil.getMaskCharacters(defaultValue) +'</ssn>' : '') : (String.isNotEmpty(defaultValue) ? '<ssn>'+ defaultValue +'</ssn>': ''))
								+(String.isNotEmpty(defaultValue) ? '<contactPhone>'+ defaultValue +'</contactPhone>' : '')+
								(String.isNotEmpty(defaultValue) ? '<dateOfBirth>'+ defaultValue +'</dateOfBirth>' : '')+
								(maskPiInformation ? (String.isNotEmpty(defaultValue) ? '<driversLicense>'+ StringUtil.getMaskCharacters(defaultValue) +'</driversLicense>' : '') : (String.isNotEmpty(defaultValue) ? '<driversLicense>'+ defaultValue +'</driversLicense>': ''))
								+(String.isNotEmpty(defaultValue) ? '<driversLicenseState>'+ defaultValue +'</driversLicenseState>' : '')+
								'<address>' +
									(String.isNotEmpty(defaultValue) ? '<streetAddress1>'+ defaultValue +'</streetAddress1>' : '')+
									(String.isNotEmpty(defaultValue) ? '<streetAddress2>'+ defaultValue +'</streetAddress2>' : '')+
									(String.isNotEmpty(defaultValue) ? '<city>'+ defaultValue +'</city>' : '')+
									(String.isNotEmpty(defaultValue) ? '<stateProvince>'+ defaultValue +'</stateProvince>' : '')+
									(String.isNotEmpty(defaultValue) ? '<postalCode>'+ defaultValue +'</postalCode>' : '')+
									(String.isNotEmpty(defaultValue) ? '<countryCode>'+ defaultValue +'</countryCode>' : '')+
								'</address>' +
							'</principal>'+
						'</principals>' +
					'</legalEntityCreateRequest>';
    }
}
