public class LitleRequestXml {
	private String createLegalEntityRequest;
	private String createSubMerchantRequest;
	public static final String XML_HEADER = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>';
	
	public LitleRequestXml(){
		
	}
	
	public void setCreateLegalEntityRequest(String createLegalEntityRequest){
		this.createLegalEntityRequest = createLegalEntityRequest;
	}
	
	public String getCreateLegalEntityRequest(){
		return createLegalEntityRequest;
	}
	
	public void setCreateSubMerchantRequest(String createSubMerchantRequest){
		this.createSubMerchantRequest = createSubMerchantRequest;
	}
	
	public String getCreateSubMerchantRequest(){
		return createSubMerchantRequest;
	}
	
	//creates start and end tag with the given name and the given value
	//e.g: tagName = 'legalEntity' value='Individual'
	//outputs <legalEntity>Individual</legalEntity>
	public void addTagToXml(Xmlstreamwriter xmlWriter, String tagName, String value){
		xmlWriter.writeStartElement(null, tagName, null);	//start tagName
		if(String.isNotEmpty(value)){
			xmlWriter.writeCharacters(value.escapeXml());
		}
		xmlWriter.writeEndElement();	//end tagName
	} 
	
	//generate create legal entity request from the legalentitymodel
	public String generateCreateLegalEntityRequest(LegalEntityModel legalEntityModel){
		if(legalEntityModel != null){
			Xmlstreamwriter createLegalEntityRequestXml = new Xmlstreamwriter();
			// encoding and version
			createLegalEntityRequestXml.writeStartDocument('UTF-8', '1.0');
			//createLegalEntityRequestXml.writeAttribute(null, null, 'standalone', 'yes');
			//main element and namespace
			createLegalEntityRequestXml.writeStartElement(null, 'legalEntityCreateRequest', null);
			createLegalEntityRequestXml.writeDefaultNamespace('http://psp.litle.com/api/merchant/onboard');
			//createLegalEntityRequestXml.writeStartElement(null, 'legalEntityName', null);	//start legal entity name
			addTagToXml(createLegalEntityRequestXml, 'legalEntityName', legalEntityModel.getLegalEntityName());
			addTagToXml(createLegalEntityRequestXml, 'legalEntityType', legalEntityModel.getLegalEntityType());
			addTagToXml(createLegalEntityRequestXml, 'doingBusinessAs', legalEntityModel.getLegalEntityDoingBusinessAs());
			addTagToXml(createLegalEntityRequestXml, 'taxId', legalEntityModel.getLegalEntityTaxId());
			addTagToXml(createLegalEntityRequestXml, 'contactPhone', legalEntityModel.getLegalEntityContactPhone());
			addTagToXml(createLegalEntityRequestXml, 'annualCreditCardSalesVolume', legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
			addTagToXml(createLegalEntityRequestXml, 'hasAcceptedCreditCards', legalEntityModel.getLegalEntityHasAcceptedCreditCards());
			createLegalEntityRequestXml.writeStartElement(null, 'address', null);
				addTagToXml(createLegalEntityRequestXml, 'streetAddress1', legalEntityModel.getLegalEntityStreetAddress1());
				addTagToXml(createLegalEntityRequestXml, 'streetAddress2', legalEntityModel.getLegalEntityStreetAddress2());
				addTagToXml(createLegalEntityRequestXml, 'city', legalEntityModel.getLegalEntityCity());
				addTagToXml(createLegalEntityRequestXml, 'stateProvince', legalEntityModel.getLegalEntityStateProvince());
				addTagToXml(createLegalEntityRequestXml, 'postalCode', legalEntityModel.getLegalEntityPostalCode());
				addTagToXml(createLegalEntityRequestXml, 'countryCode', legalEntityModel.getLegalEntityCountryCode());
			createLegalEntityRequestXml.writeEndElement();	//end legal entity address
			createLegalEntityRequestXml.writeStartElement(null, 'PCI', null);
				addTagToXml(createLegalEntityRequestXml, 'isExclusiveToPsp', legalEntityModel.getLegalEntityIsExclusiveToPsp());
				addTagToXml(createLegalEntityRequestXml, 'isPciComplianceValidated', legalEntityModel.getLegalEntityIsPciComplianceValidated());
				addTagToXml(createLegalEntityRequestXml, 'scanningVendor', legalEntityModel.getLegalEntityScanningVendor());
				addTagToXml(createLegalEntityRequestXml, 'qualifiedSecurityAssessor', legalEntityModel.getLegalEntityQualifiedSecurityAssessor());
				addTagToXml(createLegalEntityRequestXml, 'mostRecentlyPassedScan', legalEntityModel.getLegalEntityMostRecentlyPassedScan());
				addTagToXml(createLegalEntityRequestXml, 'reportOnCompliance', legalEntityModel.getLegalEntityReportOnCompliance());
				addTagToXml(createLegalEntityRequestXml, 'pciLevel', legalEntityModel.getLegalEntityPciLevel());
			createLegalEntityRequestXml.writeEndElement();	//end legal entity PCI
			createLegalEntityRequestXml.writeStartElement(null, 'principals', null);
				createLegalEntityRequestXml.writeStartElement(null, 'principal', null);
					addTagToXml(createLegalEntityRequestXml, 'firstName', legalEntityModel.getLegalEntityFirstName());
					addTagToXml(createLegalEntityRequestXml, 'lastName', legalEntityModel.getLegalEntityLastName());
					addTagToXml(createLegalEntityRequestXml, 'emailAddress', legalEntityModel.getLegalEntityEmailAddress());
					addTagToXml(createLegalEntityRequestXml, 'ssn', legalEntityModel.getLegalEntitySsn());
					addTagToXml(createLegalEntityRequestXml, 'contactPhone', legalEntityModel.getLegalEntityContactPhone());
					addTagToXml(createLegalEntityRequestXml, 'dateOfBirth', legalEntityModel.getLegalEntityDateOfBirth());
					addTagToXml(createLegalEntityRequestXml, 'driversLicense', legalEntityModel.getLegalEntityDriversLicense());
					addTagToXml(createLegalEntityRequestXml, 'driversLicenseState', legalEntityModel.getLegalEntityDriversLicenseState());
					createLegalEntityRequestXml.writeStartElement(null, 'address', null);	//start legal entity principal address
						addTagToXml(createLegalEntityRequestXml, 'streetAddress1', legalEntityModel.getLegalEntityStreetAddress1());
						addTagToXml(createLegalEntityRequestXml, 'streetAddress2', legalEntityModel.getLegalEntityStreetAddress2());
						addTagToXml(createLegalEntityRequestXml, 'city', legalEntityModel.getLegalEntityCity());
						addTagToXml(createLegalEntityRequestXml, 'stateProvince', legalEntityModel.getLegalEntityStateProvince());
						addTagToXml(createLegalEntityRequestXml, 'postalCode', legalEntityModel.getLegalEntityPostalCode());
						addTagToXml(createLegalEntityRequestXml, 'countryCode', legalEntityModel.getLegalEntityCountryCode());
					createLegalEntityRequestXml.writeEndElement();	//end legal entity principal address
				createLegalEntityRequestXml.writeEndElement();	//end legal entity principle	
			createLegalEntityRequestXml.writeEndElement();	//end legal entity principles
			createLegalEntityRequestXml.writeEndElement(); //end main request
			createLegalEntityRequestXml.writeEndDocument();
			this.createLegalEntityRequest = createLegalEntityRequestXml.getXmlString();
			createLegalEntityRequestXml.close();
		}
		return createLegalEntityRequest;
	}
	
	//generate create sub merchant request from subMerchantModel
	public String generateCreateSubMerchantRequest(SubMerchantModel subMerchantModel){
		if(subMerchantModel != null){
			Xmlstreamwriter createSubMerchantRequestXml = new Xmlstreamwriter();
			// encoding and version
			createSubMerchantRequestXml.writeStartDocument('UTF-8', '1.0');
			//main element and namespace
			createSubMerchantRequestXml.writeStartElement(null, 'subMerchantCreateRequest', null);
			createSubMerchantRequestXml.writeDefaultNamespace('http://psp.litle.com/api/merchant/onboard');
			createSubMerchantRequestXml.writeStartElement(null, 'address', null);
				addTagToXml(createSubMerchantRequestXml, 'streetAddress1', subMerchantModel.getSubMerchantStreetAddress1());
				addTagToXml(createSubMerchantRequestXml, 'streetAddress2', subMerchantModel.getSubMerchantStreetAddress2());
				addTagToXml(createSubMerchantRequestXml, 'city', subMerchantModel.getSubMerchantCity());
				addTagToXml(createSubMerchantRequestXml, 'stateProvince', subMerchantModel.getSubMerchantStateProvince());
				addTagToXml(createSubMerchantRequestXml, 'postalCode', subMerchantModel.getSubMerchantPostalCode());
				addTagToXml(createSubMerchantRequestXml, 'countryCode', subMerchantModel.getSubMerchantCountryCode());
			createSubMerchantRequestXml.writeEndElement();	//end legal entity address
			addTagToXml(createSubMerchantRequestXml, 'amexMid', subMerchantModel.getSubMerchantAmexMid());
			addTagToXml(createSubMerchantRequestXml, 'bankAccountNumber', subMerchantModel.getSubMerchantBankAccountNumber());
			addTagToXml(createSubMerchantRequestXml, 'bankRoutingNumber', subMerchantModel.getSubMerchantBankRoutingNumber());
			addTagToXml(createSubMerchantRequestXml, 'createCredentials', subMerchantModel.getSubMerchantCreateCredentials());
			addTagToXml(createSubMerchantRequestXml, 'customerServiceNumber', subMerchantModel.getSubMerchantCustomerServiceNumber());
			addTagToXml(createSubMerchantRequestXml, 'discoverConveyedMid', subMerchantModel.getSubMerchantDiscoverConveyMid());
			addTagToXml(createSubMerchantRequestXml, 'hardCodedBillingDescriptor', subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
			addTagToXml(createSubMerchantRequestXml, 'maxTransactionAmount', subMerchantModel.getSubMerchantMaxTransactionAmount());
			addTagToXml(createSubMerchantRequestXml, 'merchantCategoryCode', subMerchantModel.getSubMerchantMerchantCategoryCode());
			addTagToXml(createSubMerchantRequestXml, 'merchantName', subMerchantModel.getSubMerchantMerchantName());
			createSubMerchantRequestXml.writeStartElement(null, 'primaryContact', null);	//primary contact
				addTagToXml(createSubMerchantRequestXml, 'firstName', subMerchantModel.getSubMerchantFirstName());
				addTagToXml(createSubMerchantRequestXml, 'lastName', subMerchantModel.getSubMerchantLastName());
				addTagToXml(createSubMerchantRequestXml, 'phone', subMerchantModel.getSubMerchantPhone());
				addTagToXml(createSubMerchantRequestXml, 'emailAddress', subMerchantModel.getSubMerchantEmailAddress());
			createSubMerchantRequestXml.writeEndElement();	//end primary contact
			addTagToXml(createSubMerchantRequestXml, 'pspMerchantId', subMerchantModel.getSubMerchantPspMerchantId());
			addTagToXml(createSubMerchantRequestXml, 'url', subMerchantModel.getSubMerchantUrl());
			addTagToXml(createSubMerchantRequestXml, 'eCheckBillingDescriptor', subMerchantModel.getSubMerchanteCheckBillingDescriptor());
			addTagToXml(createSubMerchantRequestXml, 'eCheckCompanyName', subMerchantModel.getSubMerchanteCheckCompanyName());
			createSubMerchantRequestXml.writeEndElement(); //end main request
			createSubMerchantRequestXml.writeEndDocument();
			this.createSubMerchantRequest = createSubMerchantRequestXml.getXmlString();
			createSubMerchantRequestXml.close();
		}
		return createSubMerchantRequest;
	}
	/*
	//creates start and end tag with the given name and the given value
	//e.g: tagName = 'legalEntity' value='Individual'
	//outputs <legalEntity>Individual</legalEntity>
	public String addTagToXml(String tagName, String value){
		return '<'+ tagName +'>'+ value +'</'+ tagName +'>'
	} 
	
	public String generateCreateLegalEntityRequest(LegalEntityModel legalEntityModel){
		if(legalEntityModel != null){
			String createLegalEntityRequestXml = XML_HEADER;
			createLegalEntityRequestXml += '<legalEntityCreateRequest xmlns="http://psp.litle.com/api/merchant/onboard">';
			addTagToXml('legalEntityName', legalEntityModel.getLegalEntityName());
			addTagToXml('legalEntityType', legalEntityModel.getLegalEntityType());
			addTagToXml('doingBusinessAs', legalEntityModel.getLegalEntityDoingBusinessAs());
			addTagToXml('taxId', legalEntityModel.getLegalEntityTaxId());
			addTagToXml('contactPhone', legalEntityModel.getLegalEntityContactPhone());
			addTagToXml('annualCreditCardSalesVolume', legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
			addTagToXml('hasAcceptedCreditCards', legalEntityModel.getLegalEntityHasAcceptedCreditCards());
			'<address>'
				addTagToXml('streetAddress1', legalEntityModel.getLegalEntityStreetAddress1());
				addTagToXml('streetAddress2', legalEntityModel.getLegalEntityStreetAddress2());
				addTagToXml('city', legalEntityModel.getLegalEntityCity());
				addTagToXml('stateProvince', legalEntityModel.getLegalEntityStateProvince());
				addTagToXml('postalCode', legalEntityModel.getLegalEntityPostalCode());
				addTagToXml('countryCode', legalEntityModel.getLegalEntityCountryCode());
			'</address>'	//end legal entity address
			createLegalEntityRequestXml.writeStartElement(null, 'PCI', null);
				addTagToXml('isExclusiveToPsp', legalEntityModel.getLegalEntityIsExclusiveToPsp());
				addTagToXml('isPciComplianceValidated', legalEntityModel.getLegalEntityIsPciComplianceValidated());
				addTagToXml('scanningVendor', legalEntityModel.getLegalEntityScanningVendor());
				addTagToXml('qualifiedSecurityAssessor', legalEntityModel.getLegalEntityQualifiedSecurityAssessor());
				addTagToXml('mostRecentlyPassedScan', legalEntityModel.getLegalEntityMostRecentlyPassedScan());
				addTagToXml('reportOnCompliance', legalEntityModel.getLegalEntityReportOnCompliance());
				addTagToXml('pciLevel', legalEntityModel.getLegalEntityPciLevel());
			createLegalEntityRequestXml.writeEndElement();	//end legal entity PCI
			createLegalEntityRequestXml.writeStartElement(null, 'principals', null);
				createLegalEntityRequestXml.writeStartElement(null, 'principal', null);
					addTagToXml('firstName', legalEntityModel.getLegalEntityFirstName());
					addTagToXml('lastName', legalEntityModel.getLegalEntityLastName());
					addTagToXml('emailAddress', legalEntityModel.getLegalEntityEmailAddress());
					addTagToXml('ssn', legalEntityModel.getLegalEntitySsn());
					addTagToXml('contactPhone', legalEntityModel.getLegalEntityContactPhone());
					addTagToXml('dateOfBirth', legalEntityModel.getLegalEntityDateOfBirth());
					addTagToXml('driversLicense', legalEntityModel.getLegalEntityDriversLicense());
					addTagToXml('driversLicenseState', legalEntityModel.getLegalEntityDriversLicenseState());
					createLegalEntityRequestXml.writeStartElement(null, 'address', null);	//start legal entity principal address
						addTagToXml('streetAddress1', legalEntityModel.getLegalEntityStreetAddress1());
						addTagToXml('streetAddress2', legalEntityModel.getLegalEntityStreetAddress2());
						addTagToXml('city', legalEntityModel.getLegalEntityCity());
						addTagToXml('stateProvince', legalEntityModel.getLegalEntityStateProvince());
						addTagToXml('postalCode', legalEntityModel.getLegalEntityPostalCode());
						addTagToXml('countryCode', legalEntityModel.getLegalEntityCountryCode());
					createLegalEntityRequestXml.writeEndElement();	//end legal entity principal address
				createLegalEntityRequestXml.writeEndElement();	//end legal entity principle	
			createLegalEntityRequestXml.writeEndElement();	//end legal entity principles
			createLegalEntityRequestXml.writeEndElement(); //end main request
		}
		return createLegalEntityRequest;
	}*/

}