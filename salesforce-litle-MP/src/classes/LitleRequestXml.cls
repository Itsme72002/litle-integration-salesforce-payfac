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
public class LitleRequestXml {
	
	//generate create legal entity request from the legalentitymodel
	public static String generateCreateLegalEntityRequestXml(LegalEntityModel legalEntityModel, Boolean maskPiInformation){
		if(legalEntityModel != null){
			Xmlstreamwriter requestXml = new Xmlstreamwriter();
			// encoding and version
			requestXml.writeStartDocument(LitleConstants.XML_ENCODING, LitleConstants.XML_VERSION);
			//requestXml.writeAttribute(null, null, 'standalone', 'yes');
			//main element and namespace
			requestXml.writeStartElement(null, LitleConstants.XML_TAG_LEGALENTITY_CREATE_REQUEST, null);
			requestXml.writeDefaultNamespace(LitleConstants.REQUEST_XML_NAMESPACE);
			
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_LEGALENTITY_NAME, legalEntityModel.getLegalEntityName());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_LEGALENTITY_TYPE, legalEntityModel.getLegalEntityType());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_DOING_BUSINESS_AS, legalEntityModel.getLegalEntityDoingBusinessAs());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_TAXID, legalEntityModel.getLegalEntityTaxId());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_CONTACT_PHONE, legalEntityModel.getLegalEntityContactPhone());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_ANNUAL_CREDIT_CARD_SALES_VOLUME, legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_HAS_ACCEPTED_CREDIT_CARDS, legalEntityModel.getLegalEntityHasAcceptedCreditCards());
			
			// Start Legal Entity's Address
			requestXml.writeStartElement(null, LitleConstants.XML_TAG_ADDRESS, null);
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_STREET_ADDRESS1, legalEntityModel.getLegalEntityAddress().getStreetAddress1());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_STREET_ADDRESS2, legalEntityModel.getLegalEntityAddress().getStreetAddress2());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_CITY, legalEntityModel.getLegalEntityAddress().getCity());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_STATE_PROVINCE, legalEntityModel.getLegalEntityAddress().getStateProvince());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_POSTAL_CODE, legalEntityModel.getLegalEntityAddress().getPostalCode());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_COUNTRY_CODE, legalEntityModel.getLegalEntityAddress().getCountryCode());
			requestXml.writeEndElement();	
			// End Legal Entity's Address
			
			// Start PCI Details
			requestXml.writeStartElement(null, LitleConstants.XML_TAG_PCI, null);
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_IS_EXCLUSIVE_TO_PSP, legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_IS_PCI_COMPLIANCE_VALIDATED, legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_SCANNING_VENDOR, legalEntityModel.getLegalEntityPci().getScanningVendor());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_QUALIFIED_SECURITY_ASSESSOR, legalEntityModel.getLegalEntityPci().getQualifiedSecurityAssessor());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_MOST_RECENTLY_PASSED_SCAN, legalEntityModel.getLegalEntityPci().getMostRecentlyPassedScan());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_REPORT_ON_COMPLIANCE, legalEntityModel.getLegalEntityPci().getReportOnCompliance());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_PCI_LEVEL, legalEntityModel.getLegalEntityPci().getPciLevel());
			requestXml.writeEndElement();	
			// End PCI Details
			
			// Start Company Representative
			requestXml.writeStartElement(null, LitleConstants.XML_TAG_PRINCIPALS, null);
			
			// Start Principal
			requestXml.writeStartElement(null, LitleConstants.XML_TAG_PRINCIPAL, null);
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_FIRST_NAME, legalEntityModel.getLegalEntityPrincipal().getFirstName());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_LAST_NAME, legalEntityModel.getLegalEntityPrincipal().getLastName());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_EMAIL_ADDRESS, legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
			if(maskPiInformation){
				XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_SSN, StringUtil.getMaskCharacters(legalEntityModel.getLegalEntityPrincipal().getSsn()));
			}else{
				XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_SSN, legalEntityModel.getLegalEntityPrincipal().getSsn());
			}
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_CONTACT_PHONE, legalEntityModel.getLegalEntityPrincipal().getContactPhone());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_DATE_OF_BIRTH, legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
			if(maskPiInformation){
				XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_DRIVERS_LICENSE, StringUtil.getMaskCharacters(legalEntityModel.getLegalEntityPrincipal().getDriversLicense()));
			}else{
				XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_DRIVERS_LICENSE, legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
			}	
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_DRIVERS_LICENSE_STATE, legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
			
			// Start Principal's Address
			requestXml.writeStartElement(null, LitleConstants.XML_TAG_ADDRESS, null);	
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_STREET_ADDRESS1, legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress1());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_STREET_ADDRESS2, legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress2());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_CITY, legalEntityModel.getLegalEntityPrincipal().getAddress().getCity());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_STATE_PROVINCE, legalEntityModel.getLegalEntityPrincipal().getAddress().getStateProvince());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_POSTAL_CODE, legalEntityModel.getLegalEntityPrincipal().getAddress().getPostalCode());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_COUNTRY_CODE, legalEntityModel.getLegalEntityPrincipal().getAddress().getCountryCode());
			requestXml.writeEndElement();	
			// End Principal's Address
			
			// End Principal
			requestXml.writeEndElement();
			
			// End Company Representative	
			requestXml.writeEndElement();	
			
			// End Main Request
			requestXml.writeEndElement();
			
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
			requestXml.writeStartElement(null, LitleConstants.XML_TAG_SUBMERCHANT_CREATE_REQUEST, null);
			requestXml.writeDefaultNamespace(LitleConstants.REQUEST_XML_NAMESPACE);
			
			// Start Sub Merchant's Address
			requestXml.writeStartElement(null, LitleConstants.XML_TAG_ADDRESS, null);
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_STREET_ADDRESS1, subMerchantModel.getSubMerchantAddress().getStreetAddress1());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_STREET_ADDRESS2, subMerchantModel.getSubMerchantAddress().getStreetAddress2());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_CITY, subMerchantModel.getSubMerchantAddress().getCity());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_STATE_PROVINCE, subMerchantModel.getSubMerchantAddress().getStateProvince());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_POSTAL_CODE, subMerchantModel.getSubMerchantAddress().getPostalCode());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_COUNTRY_CODE, subMerchantModel.getSubMerchantAddress().getCountryCode());
			requestXml.writeEndElement();	
			// End Sub Merchant Address
			
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_AMEX_MID, subMerchantModel.getSubMerchantAmexMid());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_BANK_ACCOUNT_NUMBER, subMerchantModel.getSubMerchantBankAccountNumber());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_BANK_ROUNTING_NUMBER, subMerchantModel.getSubMerchantBankRoutingNumber());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_CREATE_CREDENTIALS, subMerchantModel.getSubMerchantCreateCredentials());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_CUSTOMER_SERVICE_NUMBER, subMerchantModel.getSubMerchantCustomerServiceNumber());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_DISCOVER_CONVEY_MID, subMerchantModel.getSubMerchantDiscoverConveyMid());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_HARD_CODE_BILLING_DESCRIPTOR, subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_MAX_TRANSACTION_AMOUNT, subMerchantModel.getSubMerchantMaxTransactionAmount());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_MERCHANT_CATEGORY_CODE, subMerchantModel.getSubMerchantMerchantCategoryCode());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_MERCHANT_NAME, subMerchantModel.getSubMerchantMerchantName());
			
			// Start Primary Contact
			requestXml.writeStartElement(null, LitleConstants.XML_TAG_PRIMARY_CONTACT, null);	//primary contact
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_FIRST_NAME, subMerchantModel.getSubMerchantPrimaryContact().getFirstName());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_LAST_NAME, subMerchantModel.getSubMerchantPrimaryContact().getLastName());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_PHONE, subMerchantModel.getSubMerchantPrimaryContact().getPhone());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_EMAIL_ADDRESS, subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress());
			requestXml.writeEndElement();	
			// End Primary Contact
			
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_PSP_MERCHANT_ID, subMerchantModel.getSubMerchantPspMerchantId());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_URL, subMerchantModel.getSubMerchantUrl());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_ECHECK_BILING_DESCRIPTOR, subMerchantModel.getSubMerchanteCheckBillingDescriptor());
			XmlUtil.addTagToXml(requestXml, LitleConstants.XML_TAG_ECHECK_COMPANY_NAME, subMerchantModel.getSubMerchanteCheckCompanyName());
			requestXml.writeEndElement(); 
			// End Main Request XML
			
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
        							+ LitleConstants.URL_SEPARATOR + LitleConstants.SUBMERCHANT_URI;
        return HttpUtil.setRequestHeaders(createSubMerchantRequest, 
        				subMerchantEndpoint, 
        				LitleConstants.CREATE_HTTP_REQUEST_METHOD, 
        				generateCreateSubMerchantRequestXml(subMerchantModel), username, password);
	}
}