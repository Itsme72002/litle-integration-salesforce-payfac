public class LitleRequestXml {
	/*private String createLegalEntityRequestXml;
	private String createSubMerchantRequestXml;
	/*private HttpRequest createLegalEntityRequest;
	private HttpRequest createSubMerchantRequest;*/
	
	
	
	/*public LitleRequestXml(LegalEntityModel legalEntityModel, SubMerchantModel subMerchantModel, Boolean maskPiInformation){
		createLegalEntityRequestXml = generateCreateLegalEntityRequestXml(legalEntityModel, maskPiInformation);
		createSubMerchantRequestXml = generateCreateSubMerchantRequestXml(subMerchantModel);
	}
	
	public void setCreateLegalEntityRequestXml(String createLegalEntityRequestXml){
		this.createLegalEntityRequestXml = createLegalEntityRequestXml;
	}
	
	public String getCreateLegalEntityRequestXml(){
		return createLegalEntityRequestXml;
	}
	
	public void setCreateSubMerchantRequestXml(String createSubMerchantRequestXml){
		this.createSubMerchantRequestXml = createSubMerchantRequestXml;
	}
	
	public String getCreateSubMerchantRequestXml(){
		return createSubMerchantRequestXml;
	}
	
	/*public void setCreateLegalEntityRequest(HttpRequest createLegalEntityRequest){
		this.createLegalEntityRequest = createLegalEntityRequest;
	}
	
	public HttpRequest getCreateLegalEntityRequest(){
		return createLegalEntityRequest;
	}
	
	public void setCreateSubMerchantRequest(HttpRequest createSubMerchantRequest){
		this.createSubMerchantRequest = createSubMerchantRequest;
	}
	
	public HttpRequest getCreateSubMerchantRequest(){
		return createSubMerchantRequest;
	}*/
	
	//creates start and end tag with the given name and the given value
	//e.g: tagName = 'legalEntity' value='Individual'
	//outputs <legalEntity>Individual</legalEntity>
	public static void addTagToXml(Xmlstreamwriter xmlWriter, String tagName, String value){
		xmlWriter.writeStartElement(null, tagName, null);	//start tagName
		if(String.isNotEmpty(value)){
			xmlWriter.writeCharacters(value.escapeXml());
		}
		xmlWriter.writeEndElement();	//end tagName
	} 
	
	//generate create legal entity request from the legalentitymodel
	public static String generateCreateLegalEntityRequestXml(LegalEntityModel legalEntityModel, Boolean maskPiInformation){
		if(legalEntityModel != null){
			Xmlstreamwriter requestXml = new Xmlstreamwriter();
			// encoding and version
			requestXml.writeStartDocument(LitleConstants.XML_ENCODING, LitleConstants.XML_VERSION);
			//requestXml.writeAttribute(null, null, 'standalone', 'yes');
			//main element and namespace
			requestXml.writeStartElement(null, 'legalEntityCreateRequest', null);
			requestXml.writeDefaultNamespace(LitleConstants.REQUEST_XML_NAMESPACE);
			//requestXml.writeStartElement(null, 'legalEntityName', null);	//start legal entity name
			addTagToXml(requestXml, 'legalEntityName', legalEntityModel.getLegalEntityName());
			addTagToXml(requestXml, 'legalEntityType', legalEntityModel.getLegalEntityType());
			addTagToXml(requestXml, 'doingBusinessAs', legalEntityModel.getLegalEntityDoingBusinessAs());
			addTagToXml(requestXml, 'taxId', legalEntityModel.getLegalEntityTaxId());
			addTagToXml(requestXml, 'contactPhone', legalEntityModel.getLegalEntityContactPhone());
			addTagToXml(requestXml, 'annualCreditCardSalesVolume', legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
			addTagToXml(requestXml, 'hasAcceptedCreditCards', legalEntityModel.getLegalEntityHasAcceptedCreditCards());
			requestXml.writeStartElement(null, 'address', null);
				addTagToXml(requestXml, 'streetAddress1', legalEntityModel.getLegalEntityAddress().getStreetAddress1());
				addTagToXml(requestXml, 'streetAddress2', legalEntityModel.getLegalEntityAddress().getStreetAddress2());
				addTagToXml(requestXml, 'city', legalEntityModel.getLegalEntityAddress().getCity());
				addTagToXml(requestXml, 'stateProvince', legalEntityModel.getLegalEntityAddress().getStateProvince());
				addTagToXml(requestXml, 'postalCode', legalEntityModel.getLegalEntityAddress().getPostalCode());
				addTagToXml(requestXml, 'countryCode', legalEntityModel.getLegalEntityAddress().getCountryCode());
			requestXml.writeEndElement();	//end legal entity address
			requestXml.writeStartElement(null, 'PCI', null);
				addTagToXml(requestXml, 'isExclusiveToPsp', legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp());
				addTagToXml(requestXml, 'isPciComplianceValidated', legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated());
				addTagToXml(requestXml, 'scanningVendor', legalEntityModel.getLegalEntityPci().getScanningVendor());
				addTagToXml(requestXml, 'qualifiedSecurityAssessor', legalEntityModel.getLegalEntityPci().getQualifiedSecurityAssessor());
				addTagToXml(requestXml, 'mostRecentlyPassedScan', legalEntityModel.getLegalEntityPci().getMostRecentlyPassedScan());
				addTagToXml(requestXml, 'reportOnCompliance', legalEntityModel.getLegalEntityPci().getReportOnCompliance());
				addTagToXml(requestXml, 'pciLevel', legalEntityModel.getLegalEntityPci().getPciLevel());
			requestXml.writeEndElement();	//end legal entity PCI
			requestXml.writeStartElement(null, 'principals', null);
				requestXml.writeStartElement(null, 'principal', null);
					addTagToXml(requestXml, 'firstName', legalEntityModel.getLegalEntityPrincipal().getFirstName());
					addTagToXml(requestXml, 'lastName', legalEntityModel.getLegalEntityPrincipal().getLastName());
					addTagToXml(requestXml, 'emailAddress', legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
					if(maskPiInformation){
						addTagToXml(requestXml, 'ssn', StringUtil.getMaskCharacters(legalEntityModel.getLegalEntityPrincipal().getSsn()));
					}else{
						addTagToXml(requestXml, 'ssn', legalEntityModel.getLegalEntityPrincipal().getSsn());
					}
					addTagToXml(requestXml, 'contactPhone', legalEntityModel.getLegalEntityPrincipal().getContactPhone());
					addTagToXml(requestXml, 'dateOfBirth', legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
					if(maskPiInformation){
						addTagToXml(requestXml, 'driversLicense', StringUtil.getMaskCharacters(legalEntityModel.getLegalEntityPrincipal().getDriversLicense()));
					}else{
						addTagToXml(requestXml, 'driversLicense', legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
					}	
					addTagToXml(requestXml, 'driversLicenseState', legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
					requestXml.writeStartElement(null, 'address', null);	//start legal entity principal address
						addTagToXml(requestXml, 'streetAddress1', legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress1());
						addTagToXml(requestXml, 'streetAddress2', legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress2());
						addTagToXml(requestXml, 'city', legalEntityModel.getLegalEntityPrincipal().getAddress().getCity());
						addTagToXml(requestXml, 'stateProvince', legalEntityModel.getLegalEntityPrincipal().getAddress().getStateProvince());
						addTagToXml(requestXml, 'postalCode', legalEntityModel.getLegalEntityPrincipal().getAddress().getPostalCode());
						addTagToXml(requestXml, 'countryCode', legalEntityModel.getLegalEntityPrincipal().getAddress().getCountryCode());
					requestXml.writeEndElement();	//end legal entity principal address
				requestXml.writeEndElement();	//end legal entity principle	
			requestXml.writeEndElement();	//end legal entity principles
			requestXml.writeEndElement(); //end main request
			requestXml.writeEndDocument();
			String request = requestXml.getXmlString();
			requestXml.close();
			return request;
		}
		return null;
	}
	
	//generate create sub merchant request from subMerchantModel
	public static String generateCreateSubMerchantRequestXml(SubMerchantModel subMerchantModel){
		if(subMerchantModel != null){
			Xmlstreamwriter requestXml = new Xmlstreamwriter();
			// encoding and version
			requestXml.writeStartDocument(LitleConstants.XML_ENCODING, LitleConstants.XML_VERSION);
			//marequest
			requestXml.writeStartElement(null, 'subMerchantCreateRequest', null);
			requestXml.writeDefaultNamespace(LitleConstants.REQUEST_XML_NAMESPACE);
			requestXml.writeStartElement(null, 'address', null);
				addTagToXml(requestXml, 'streetAddress1', subMerchantModel.getSubMerchantAddress().getStreetAddress1());
				addTagToXml(requestXml, 'streetAddress2', subMerchantModel.getSubMerchantAddress().getStreetAddress2());
				addTagToXml(requestXml, 'city', subMerchantModel.getSubMerchantAddress().getCity());
				addTagToXml(requestXml, 'stateProvince', subMerchantModel.getSubMerchantAddress().getStateProvince());
				addTagToXml(requestXml, 'postalCode', subMerchantModel.getSubMerchantAddress().getPostalCode());
				addTagToXml(requestXml, 'countryCode', subMerchantModel.getSubMerchantAddress().getCountryCode());
			requestXml.writeEndElement();	//end legal entity address
			addTagToXml(requestXml, 'amexMid', subMerchantModel.getSubMerchantAmexMid());
			addTagToXml(requestXml, 'bankAccountNumber', subMerchantModel.getSubMerchantBankAccountNumber());
			addTagToXml(requestXml, 'bankRoutingNumber', subMerchantModel.getSubMerchantBankRoutingNumber());
			addTagToXml(requestXml, 'createCredentials', subMerchantModel.getSubMerchantCreateCredentials());
			addTagToXml(requestXml, 'customerServiceNumber', subMerchantModel.getSubMerchantCustomerServiceNumber());
			addTagToXml(requestXml, 'discoverConveyedMid', subMerchantModel.getSubMerchantDiscoverConveyMid());
			addTagToXml(requestXml, 'hardCodedBillingDescriptor', subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
			addTagToXml(requestXml, 'maxTransactionAmount', subMerchantModel.getSubMerchantMaxTransactionAmount());
			addTagToXml(requestXml, 'merchantCategoryCode', subMerchantModel.getSubMerchantMerchantCategoryCode());
			addTagToXml(requestXml, 'merchantName', subMerchantModel.getSubMerchantMerchantName());
			requestXml.writeStartElement(null, 'primaryContact', null);	//primary contact
				addTagToXml(requestXml, 'firstName', subMerchantModel.getSubMerchantPrimaryContact().getFirstName());
				addTagToXml(requestXml, 'lastName', subMerchantModel.getSubMerchantPrimaryContact().getLastName());
				addTagToXml(requestXml, 'phone', subMerchantModel.getSubMerchantPrimaryContact().getPhone());
				addTagToXml(requestXml, 'emailAddress', subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress());
			requestXml.writeEndElement();	//end primary contact
			addTagToXml(requestXml, 'pspMerchantId', subMerchantModel.getSubMerchantPspMerchantId());
			addTagToXml(requestXml, 'url', subMerchantModel.getSubMerchantUrl());
			addTagToXml(requestXml, 'eCheckBillingDescriptor', subMerchantModel.getSubMerchanteCheckBillingDescriptor());
			addTagToXml(requestXml, 'eCheckCompanyName', subMerchantModel.getSubMerchanteCheckCompanyName());
			requestXml.writeEndElement(); //end main request
			requestXml.writeEndDocument();
			String request = requestXml.getXmlString();
			requestXml.close();
			return request;
		}
		return null;
	}
	
	public static Httprequest getCreateLegalEntityRequest(String username, String password, LegalEntityModel legalEntityModel, Boolean maskPiInformation
															, String litleEnv){
		Httprequest createLegalEntityRequest = new Httprequest();
		String LEGAL_ENTITY_REQUEST_ENDPOINT= LitleEnvironment.getEnvironmentUrl(litleEnv) + LitleConstants.URL_SEPARATOR + LitleConstants.LEGAL_ENTITY_URI;
		return HttpUtil.setRequestHeaders(createLegalEntityRequest, 
        				LEGAL_ENTITY_REQUEST_ENDPOINT, 
        				LitleConstants.CREATE_HTTP_REQUEST_METHOD, 
        				generateCreateLegalEntityRequestXml(legalEntityModel, maskPiInformation), username, password);     
	}
	
	public static Httprequest getCreateSubMerchantRequest(String username, String password, String legalEntityId, SubMerchantModel subMerchantModel
														, String litleEnv){
		Httprequest createSubMerchantRequest = new Httprequest();
        //sub merchant endpoint /legalentity/legalentityid/submerchant
        String LEGAL_ENTITY_REQUEST_ENDPOINT= LitleEnvironment.getEnvironmentUrl(litleEnv);
        String subMerchantEndpoint = LEGAL_ENTITY_REQUEST_ENDPOINT + LitleConstants.URL_SEPARATOR + LitleConstants.LEGAL_ENTITY_URI
        							+ LitleConstants.URL_SEPARATOR + legalEntityId 
        							+ LitleConstants.URL_SEPARATOR + 'submerchant';
        return HttpUtil.setRequestHeaders(createSubMerchantRequest, 
        				subMerchantEndpoint, 
        				LitleConstants.CREATE_HTTP_REQUEST_METHOD, 
        				generateCreateSubMerchantRequestXml(subMerchantModel), username, password);
	}
	
	
	// Set the request parameters of the given http request
	/*public void setRequestParams(HttpRequest request, String endPoint, String method, String body
									, String username, String password){
		request.setEndpoint(endPoint);
        // create header
        Blob headerValue = Blob.valueOf(username+':'+password); //Enter username and password
        String authorizationHeader = 'Basic ' + Encodingutil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);
        request.setHeader('Content-Type', CONTENT_TYPE);
		request.setHeader('Accept', ACCEPT);
		request.setMethod(method);
        request.setBody(body);
	}*/
}