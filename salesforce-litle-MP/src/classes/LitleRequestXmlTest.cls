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
private class LitleRequestXmlTest {
	public static final String TEST_STRING = 'test';
	public static final String CONTENT_TYPE = 'application/com.litle.psp-v5+xml';
    public static final String ACCEPT = 'application/com.litle.psp-v5+xml';
    
    static testMethod void testCreateLegalEntityRequestXml() {
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        LitleRequestXml litleRequestXml = new LitleRequestXml(legalEntityModel, subMerchantModel) ;
        // Check if the account is null initially
        System.assertEquals(litleRequestXml.getCreateLegalEntityRequestXml(), getCreateLegalEntityRequestXML('',''));
        litleRequestXml.setCreateLegalEntityRequestXml(TEST_STRING);
        // First check if the value is set
        System.assertNotEquals(litleRequestXml.getCreateLegalEntityRequestXml(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(litleRequestXml.getCreateLegalEntityRequestXml(), TEST_STRING);
    }
    
    static testMethod void testCreateSubMerchantRequestXml() {
        LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        LitleRequestXml litleRequestXml = new LitleRequestXml(legalEntityModel, subMerchantModel) ;
        // Check if the account is null initially
        System.assertEquals(litleRequestXml.getCreateSubMerchantRequestXml(), getCreateSubMerchantRequestXML(''));
        litleRequestXml.setCreateSubMerchantRequestXml(TEST_STRING);
        // First check if the value is set
        System.assertNotEquals(litleRequestXml.getCreateSubMerchantRequestXml(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(litleRequestXml.getCreateSubMerchantRequestXml(), TEST_STRING);
    }
    
    static testMethod void testGenerateCreateLegalEntityRequestXml(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        LitleRequestXml litleRequestXml = new LitleRequestXml(legalEntityModel, subMerchantModel) ;
    	// TODO check for null
    	System.assertEquals(null, litleRequestXml.generateCreateLegalEntityRequestXml(null));
    	
    	// Check for XML with no values, just tags
    	//LegalEntityModel legalEntityModel = new LegalEntityModel();
    	String actualXml = litleRequestXml.generateCreateLegalEntityRequestXml(legalEntityModel);
    	String expectedXml = getCreateLegalEntityRequestXML('','');
    	
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
    	 actualXml = litleRequestXml.generateCreateLegalEntityRequestXml(legalEntityModel);
    	 expectedXml = getCreateLegalEntityRequestXML(TEST_STRING,LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name());
    	System.assertEquals(expectedXml, actualXml);
    	
    	// change the legal entity type and check
    	legalEntityModel.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.CORPORATION.name());
    	actualXml = litleRequestXml.generateCreateLegalEntityRequestXml(legalEntityModel);
    	expectedXml = getCreateLegalEntityRequestXML(TEST_STRING,LegalEntityType.LegalEntityTypeEnum.CORPORATION.name());
    	System.assertEquals(expectedXml, actualXml);
    }
    
    
    static testMethod void testGenerateCreateSubMerchantRequestXml(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        LitleRequestXml litleRequestXml = new LitleRequestXml(legalEntityModel, subMerchantModel) ;
    	// TODO check for null
    	System.assertEquals(null, litleRequestXml.generateCreateSubMerchantRequestXml(null));
    	
    	// Check for XML with no values, just tags
    	//SubMerchantModel subMerchantModel = new SubMerchantModel();
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
        LitleRequestXml litleRequest = new LitleRequestXml(legalEntityModel, subMerchantModel) ;
    	
    	// Check for XML with no values, just tags
    	String actualXml = litleRequest.generateCreateLegalEntityRequestXml(legalEntityModel);
    	String expectedXml = getCreateLegalEntityRequestXML('','');
    	System.assertEquals(expectedXml, actualXml);
    	Httprequest request = litleRequest.getCreateLegalEntityRequest(TEST_STRING, TEST_STRING);
    	Blob headerValue = Blob.valueOf(TEST_STRING+':'+TEST_STRING); 
 	    String authorizationHeader = 'Basic ' + Encodingutil.base64Encode(headerValue);
 	    System.assertEquals(LitleRequestXml.LEGAL_ENTITY_ENDPOINT, request.getEndpoint());
    	System.assertEquals(authorizationHeader, request.getHeader('Authorization'));
 	    System.assertEquals(CONTENT_TYPE, request.getHeader('Content-Type'));
 	    System.assertEquals(ACCEPT, request.getHeader('Accept'));
 		System.assertEquals('POST', request.getMethod());
 		System.assertEquals(expectedXml, request.getBody());
    }
    
    static testMethod void testGetCreateSubMerchantRequest(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        LitleRequestXml litleRequest = new LitleRequestXml(legalEntityModel, subMerchantModel) ;
    	
    	// Check for XML with no values, just tags
    	String actualXml = litleRequest.generateCreateSubMerchantRequestXml(subMerchantModel);
    	String expectedXml = getCreateSubMerchantRequestXML('');
    	System.assertEquals(expectedXml, actualXml);
    	Httprequest request = litleRequest.getCreateSubMerchantRequest(TEST_STRING, TEST_STRING, TEST_STRING);
    	Blob headerValue = Blob.valueOf(TEST_STRING+':'+TEST_STRING); 
 	    String authorizationHeader = 'Basic ' + Encodingutil.base64Encode(headerValue);
 	    System.assertEquals(LitleRequestXml.LEGAL_ENTITY_ENDPOINT+LitleRequestXml.URL_SEPARATOR
 	    						+ TEST_STRING + LitleRequestXml.URL_SEPARATOR + 'submerchant' , request.getEndpoint());
    	System.assertEquals(authorizationHeader, request.getHeader('Authorization'));
 	    System.assertEquals(CONTENT_TYPE, request.getHeader('Content-Type'));
 	    System.assertEquals(ACCEPT, request.getHeader('Accept'));
 		System.assertEquals('POST', request.getMethod());
 		System.assertEquals(expectedXml, request.getBody());
    }
    static testMethod void testSetRequestParams(){
    	LegalEntityModel legalEntityModel = new LegalEntityModel();
    	SubMerchantModel subMerchantModel = new SubMerchantModel();
        LitleRequestXml litleRequestXml = new LitleRequestXml(legalEntityModel, subMerchantModel) ;
    	HttpRequest request = new Httprequest();
    	String method = 'POST';
    	litleRequestXml.setRequestParams(request, TEST_STRING, method, TEST_STRING,TEST_STRING,TEST_STRING);
    	System.assertEquals(TEST_STRING, request.getEndpoint());
    	Blob headerValue = Blob.valueOf(TEST_STRING+':'+TEST_STRING); 
 	    String authorizationHeader = 'Basic ' + Encodingutil.base64Encode(headerValue);
 	    System.assertEquals(authorizationHeader, request.getHeader('Authorization'));
 	    System.assertEquals(CONTENT_TYPE, request.getHeader('Content-Type'));
 	    System.assertEquals(ACCEPT, request.getHeader('Accept'));
 		System.assertEquals('POST', request.getMethod());
 		System.assertEquals(TEST_STRING, request.getBody());
    }
    
    
    static String getCreateSubMerchantRequestXML(String defaultValue){
    	return '<?xml version="1.0" encoding="UTF-8"?>'
				+ '<subMerchantCreateRequest xmlns="http://psp.litle.com/api/merchant/onboard">'
				+ '<address>'
				+ '<streetAddress1>'+ defaultValue +'</streetAddress1>'
				+ '<streetAddress2>'+ defaultValue +'</streetAddress2>'
				+ '<city>'+ defaultValue +'</city>'
				+ '<stateProvince>'+ defaultValue +'</stateProvince>'
				+ '<postalCode>'+ defaultValue +'</postalCode>'
				+ '<countryCode>'+ defaultValue +'</countryCode>'
				+ '</address>'
				+ '<amexMid>'+ defaultValue +'</amexMid>'
				+ '<bankAccountNumber>'+ defaultValue +'</bankAccountNumber>'
				+ '<bankRoutingNumber>'+ defaultValue +'</bankRoutingNumber>'
				+ '<createCredentials>'+ defaultValue +'</createCredentials>'
				+ '<customerServiceNumber>'+ defaultValue +'</customerServiceNumber>'
				+ '<discoverConveyedMid>'+ defaultValue +'</discoverConveyedMid>'
				+ '<hardCodedBillingDescriptor>'+ defaultValue +'</hardCodedBillingDescriptor>'
				+ '<maxTransactionAmount>'+ defaultValue +'</maxTransactionAmount>'
				+ '<merchantCategoryCode>'+ defaultValue +'</merchantCategoryCode>'
				+ '<merchantName>'+ defaultValue +'</merchantName>'
				+ '<primaryContact>'
				+ '<firstName>'+ defaultValue +'</firstName>'
				+ '<lastName>'+ defaultValue +'</lastName>'
				+ '<phone>'+ defaultValue +'</phone>'
				+ '<emailAddress>'+ defaultValue +'</emailAddress>'
				+ '</primaryContact>'
				+ '<pspMerchantId>'+ defaultValue +'</pspMerchantId>'
				+ '<url>'+ defaultValue +'</url>'
				+ '<eCheckBillingDescriptor>'+ defaultValue +'</eCheckBillingDescriptor>'
				+ '<eCheckCompanyName>'+ defaultValue +'</eCheckCompanyName>'
				+ '</subMerchantCreateRequest>';
				    	
    }
    static String getCreateLegalEntityRequestXML(String defaultValue, String legalEntityType){
    	return '<?xml version="1.0" encoding="UTF-8"?>'+
					'<legalEntityCreateRequest xmlns="http://psp.litle.com/api/merchant/onboard">'+
						'<legalEntityName>'+ defaultValue +'</legalEntityName>'+
						'<legalEntityType>'+ legalEntityType +'</legalEntityType>'+
						'<doingBusinessAs>'+ defaultValue +'</doingBusinessAs>'+
						'<taxId>'+ defaultValue +'</taxId>'+
						'<contactPhone>'+ defaultValue +'</contactPhone>'+
						'<annualCreditCardSalesVolume>'+ defaultValue +'</annualCreditCardSalesVolume>'+
						'<hasAcceptedCreditCards>'+ defaultValue +'</hasAcceptedCreditCards>'+
						'<address>'+
							'<streetAddress1>'+ defaultValue +'</streetAddress1>'+
							'<streetAddress2>'+ defaultValue +'</streetAddress2>'+
							'<city>'+ defaultValue +'</city>'+
							'<stateProvince>'+ defaultValue +'</stateProvince>'+
							'<postalCode>'+ defaultValue +'</postalCode>'+
							'<countryCode>'+ defaultValue +'</countryCode>'+
						'</address>'+
						'<PCI>'+
							'<isExclusiveToPsp>'+ defaultValue +'</isExclusiveToPsp>'+
							'<isPciComplianceValidated>'+ defaultValue +'</isPciComplianceValidated>'+
							'<scanningVendor>'+ defaultValue +'</scanningVendor>'+
							'<qualifiedSecurityAssessor>'+ defaultValue +'</qualifiedSecurityAssessor>'+
							'<mostRecentlyPassedScan>'+ defaultValue +'</mostRecentlyPassedScan>'+
							'<reportOnCompliance>'+ defaultValue +'</reportOnCompliance>'+
							'<pciLevel>'+ defaultValue +'</pciLevel>'+
						'</PCI>'+
						'<principals>'+
							'<principal>'+
								'<firstName>'+ defaultValue +'</firstName>'+
								'<lastName>'+ defaultValue +'</lastName>'+
								'<emailAddress>'+ defaultValue +'</emailAddress>'+
								'<ssn>'+ defaultValue +'</ssn>'+
								'<contactPhone>'+ defaultValue +'</contactPhone>'+
								'<dateOfBirth>'+ defaultValue +'</dateOfBirth>'+
								'<driversLicense>'+ defaultValue +'</driversLicense>'+
								'<driversLicenseState>'+ defaultValue +'</driversLicenseState>'+
								'<address>'+
									'<streetAddress1>'+ defaultValue +'</streetAddress1>'+
									'<streetAddress2>'+ defaultValue +'</streetAddress2>'+
									'<city>'+ defaultValue +'</city>'+
									'<stateProvince>'+ defaultValue +'</stateProvince>'+
									'<postalCode>'+ defaultValue +'</postalCode>'+
									'<countryCode>'+ defaultValue +'</countryCode>'+
								'</address>'+
							'</principal>'+
						'</principals>'+
					'</legalEntityCreateRequest>';
    }
}