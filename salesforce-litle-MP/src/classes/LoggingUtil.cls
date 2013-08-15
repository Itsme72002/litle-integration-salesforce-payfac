public class LoggingUtil {
	
	public static void logSObjectDetails(String accid, String oppid, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null){
			if(String.isNotEmpty(oppid)){
				//get opportunity details
				try{
					Opportunity thisOpportunity = [select name from Opportunity where id=:oppid];
					fillSObjectLogObject('Opportunity', thisOpportunity.Name, oppid, litleRequestResponseLog);
				}catch (Queryexception e){
					System.debug('Error fetching opportunity details for logging'+ e);
				}
			}else if(String.isNotEmpty(accid)){
				//get account details
				try{
					Account thisAccount = [select name from Account where id=:accid];
					fillSObjectLogObject('Account', thisAccount.Name, accid, litleRequestResponseLog);
				}catch (Queryexception e){
					System.debug('Error fetching account details for logging'+ e);
				}
			} 
		}
	}
	
	public static void fillSObjectLogObject(String sObjectType, String sObjectName, String sObjectId, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null){
			litleRequestResponseLog.sObjectType__c = sObjectType;
			litleRequestResponseLog.sObjectName__c = sObjectName;
			if(String.isNotEmpty(sObjectType) && sObjectType.equals('Account')){
				litleRequestResponseLog.Account__c = sObjectId;
			}else if(String.isNotEmpty(sObjectType) && sObjectType.equals('Opportunity')){
				litleRequestResponseLog.Opportunity__c = sObjectId;
			}
		}
	}
	
	public static void logCreateLegalEntityRequest(HttpRequest request, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null && request != null){
			litleRequestResponseLog.createLegalEntityRequestDate__c = Datetime.now();
			litleRequestResponseLog.legalEntityEndpoint__c = request.getEndpoint();
			litleRequestResponseLog.legalEntityAcceptHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT);
			litleRequestResponseLog.legalEntityContentTypeHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE);
			litleRequestResponseLog.legalEntityAuthorizationHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION);
			litleRequestResponseLog.createLegalEntityRequestXml__c = request.getBody();
		}
	}
	
	public static void logCreateSubMerchantRequest(HttpRequest request, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null && request != null){
			litleRequestResponseLog.createSubMerchantRequestDate__c = Datetime.now();
			litleRequestResponseLog.subMerchantEndpoint__c = request.getEndpoint();
			litleRequestResponseLog.subMerchantAcceptHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT);
			litleRequestResponseLog.subMerchantContentTypeHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE);
			litleRequestResponseLog.subMerchantAuthorizationHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION);
			litleRequestResponseLog.createSubMerchantRequestXml__c = request.getBody();
		}
	}
	
	public static void logCreateLegalEntityResponse(HttpResponse response, LitleRequestResponseLog__c litleRequestResponseLog){
		system.debug('!!response:'+response);
		if(litleRequestResponseLog != null && response != null){
			litleRequestResponseLog.createLegalEntityResponseDate__c = Datetime.now();
	    	litleRequestResponseLog.createLegalEntityResponseXml__c = getResponseParamsLog(response);
	    	litleRequestResponseLog.createLegalEntityResponseStatusCode__c = String.valueOf(response.getStatusCode());
	    	litleRequestResponseLog.createLegalEntityResponseStatusMessage__c = response.getStatus();
		}
	}
	
	public static void logCreateSubMerchantResponse(HttpResponse response, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null && response != null){
			litleRequestResponseLog.createSubMerchantResponseDate__c = Datetime.now();
	    	litleRequestResponseLog.createSubMerchantResponseXml__c = getResponseParamsLog(response);
	    	litleRequestResponseLog.createSubMerchantResponseStatusCode__c = String.valueOf(response.getStatusCode());
	    	litleRequestResponseLog.createSubMerchantResponseStatusMessage__c = response.getStatus();
		}
	}
	
	public static void logSaveLitleMappings(SalesforceLitleMappingsObject__c mappings, LitleMappingsSaveLog__c log){
		log.legalEntityAnnualCreditCardSalesVolume__c = mappings.legalEntityAnnualCreditCardSalesVolume__c;
		log.legalEntityAnnualCreditCardSalesVolumeD__c = mappings.legalEntityAnnualCreditCardSalesVolumeD__c;
		log.legalEntityAnnualCreditCardSalesVolumeX__c = mappings.legalEntityAnnualCreditCardSalesVolumeX__c;
		log.legalEntityCity__c = mappings.legalEntityCity__c;
		log.legalEntityCityD__c = mappings.legalEntityCityD__c;
		log.legalEntityCityX__c = mappings.legalEntityCityX__c;
		log.legalEntityContactPhone__c = mappings.legalEntityContactPhone__c;
		log.legalEntityContactPhoneD__c = mappings.legalEntityContactPhoneD__c;
		log.legalEntityContactPhoneX__c = mappings.legalEntityContactPhoneX__c;
		log.legalEntityCountryCode__c = mappings.legalEntityCountryCode__c;
		log.legalEntityCountryCodeD__c = mappings.legalEntityCountryCodeD__c;
		log.legalEntityCountryCodeX__c = mappings.legalEntityCountryCodeX__c;
		log.legalEntityDateOfBirth__c = mappings.legalEntityDateOfBirth__c;
		log.legalEntityDateOfBirthD__c = mappings.legalEntityDateOfBirthD__c;
		log.legalEntityDateOfBirthX__c = mappings.legalEntityDateOfBirthX__c;
		log.legalEntityDoingBusinessAs__c = mappings.legalEntityDoingBusinessAs__c;
		log.legalEntityDoingBusinessAsD__c = mappings.legalEntityDoingBusinessAsD__c;
		log.legalEntityDoingBusinessAsX__c = mappings.legalEntityDoingBusinessAsX__c;
		log.legalEntityFirstName__c = mappings.legalEntityFirstName__c;
		log.legalEntityFirstNameD__c = mappings.legalEntityFirstNameD__c;
		log.legalEntityFirstNameX__c = mappings.legalEntityFirstNameX__c;
		log.legalEntityHasAcceptedCreditCards__c = mappings.legalEntityHasAcceptedCreditCards__c;
		log.legalEntityHasAcceptedCreditCardsD__c = mappings.legalEntityHasAcceptedCreditCardsD__c;
		log.legalEntityHasAcceptedCreditCardsX__c = mappings.legalEntityHasAcceptedCreditCardsX__c;
		log.legalEntityLastName__c = mappings.legalEntityLastName__c;
		log.legalEntityLastNameD__c = mappings.legalEntityLastNameD__c;
		log.legalEntityLastNameX__c = mappings.legalEntityLastNameX__c;
		log.legalEntityName__c = mappings.legalEntityName__c;
		log.legalEntityNameD__c = mappings.legalEntityNameD__c;
		log.legalEntityNameX__c = mappings.legalEntityNameX__c;
		log.legalEntityPostalCode__c = mappings.legalEntityPostalCode__c;
		log.legalEntityPostalCodeD__c = mappings.legalEntityPostalCodeD__c;
		log.legalEntityPostalCodeX__c = mappings.legalEntityPostalCodeX__c;
		log.legalEntityPrincipalCity__c = mappings.legalEntityPrincipalCity__c;
		log.legalEntityPrincipalCityD__c = mappings.legalEntityPrincipalCityD__c;
		log.legalEntityPrincipalCityX__c = mappings.legalEntityPrincipalCityX__c;
		log.legalEntityPrincipalContactPhone__c = mappings.legalEntityPrincipalContactPhone__c;
		log.legalEntityPrincipalContactPhoneD__c = mappings.legalEntityPrincipalContactPhoneD__c;
		log.legalEntityPrincipalContactPhoneX__c = mappings.legalEntityPrincipalContactPhoneX__c;
		log.legalEntityPrincipalCountryCode__c = mappings.legalEntityPrincipalCountryCode__c;
		log.legalEntityPrincipalCountryCodeD__c = mappings.legalEntityPrincipalCountryCodeD__c;
		log.legalEntityPrincipalCountryCodeD__c = mappings.legalEntityPrincipalCountryCodeD__c;
		log.legalEntityPrincipalCountryCodeX__c = mappings.legalEntityPrincipalCountryCodeX__c;
		log.legalEntityPrincipalDateOfBirth__c = mappings.legalEntityPrincipalDateOfBirth__c;
		log.legalEntityPrincipalDateOfBirthD__c = mappings.legalEntityPrincipalDateOfBirthD__c;
		log.legalEntityPrincipalDateOfBirthX__c = mappings.legalEntityPrincipalDateOfBirthX__c;
		log.legalEntityPrincipalDriversLicense__c = mappings.legalEntityPrincipalDriversLicense__c;
		log.legalEntityPrincipalDriversLicenseD__c = mappings.legalEntityPrincipalDriversLicenseD__c;
		log.legalEntityPrincipalDriversLicenseX__c = mappings.legalEntityPrincipalDriversLicenseX__c;
		log.legalEntityPrincipalDriversLicenseState__c = mappings.legalEntityPrincipalDriversLicenseState__c;
		log.legalEntityPrincipalDriversLicenseStateD__c = mappings.legalEntityPrincipalDriversLicenseStateD__c;
		log.legalEntityPrincipalDriversLicenseStateX__c = mappings.legalEntityPrincipalDriversLicenseStateX__c;
		log.legalEntityPrincipalEmailAddress__c = mappings.legalEntityPrincipalEmailAddress__c;
		log.legalEntityPrincipalEmailAddressD__c = mappings.legalEntityPrincipalEmailAddressD__c;
		log.legalEntityPrincipalEmailAddressX__c = mappings.legalEntityPrincipalEmailAddressX__c;
		log.legalEntityPrincipalFirstName__c = mappings.legalEntityPrincipalFirstName__c;
		log.legalEntityPrincipalFirstNameD__c = mappings.legalEntityPrincipalFirstNameD__c;
		log.legalEntityPrincipalFirstNameX__c = mappings.legalEntityPrincipalFirstNameX__c;
		log.legalEntityPrincipalLastName__c = mappings.legalEntityPrincipalLastName__c;
		log.legalEntityPrincipalLastNameD__c = mappings.legalEntityPrincipalLastNameD__c;
		log.legalEntityPrincipalLastNameX__c = mappings.legalEntityPrincipalLastNameX__c;
		log.legalEntityPrincipalPostalCode__c = mappings.legalEntityPrincipalPostalCode__c;
		log.legalEntityPrincipalPostalCodeD__c = mappings.legalEntityPrincipalPostalCodeD__c;
		log.legalEntityPrincipalPostalCodeX__c = mappings.legalEntityPrincipalPostalCodeX__c;
		log.legalEntityPrincipalSsn__c = mappings.legalEntityPrincipalSsn__c;
		log.legalEntityPrincipalSsnD__c = mappings.legalEntityPrincipalSsnD__c;
		log.legalEntityPrincipalSsnX__c = mappings.legalEntityPrincipalSsnX__c;
		log.legalEntityPrincipalStateProvince__c = mappings.legalEntityPrincipalStateProvince__c;
		log.legalEntityPrincipalStateProvinceD__c = mappings.legalEntityPrincipalStateProvinceD__c;
		log.legalEntityPrincipalStateProvinceX__c = mappings.legalEntityPrincipalStateProvinceX__c;
		log.legalEntityPrincipalStreetAddress1__c = mappings.legalEntityPrincipalStreetAddress1__c;
		log.legalEntityPrincipalStreetAddress1D__c = mappings.legalEntityPrincipalStreetAddress1D__c;
		log.legalEntityPrincipalStreetAddress1X__c = mappings.legalEntityPrincipalStreetAddress1X__c;
		log.legalEntityPrincipalStreetAddress2__c = mappings.legalEntityPrincipalStreetAddress2__c;
		log.legalEntityPrincipalStreetAddress2D__c = mappings.legalEntityPrincipalStreetAddress2D__c;
		log.legalEntityPrincipalStreetAddress2X__c = mappings.legalEntityPrincipalStreetAddress2X__c;
		log.legalEntityStateProvince__c = mappings.legalEntityStateProvince__c;
		log.legalEntityStateProvinceD__c = mappings.legalEntityStateProvinceD__c;
		log.legalEntityStateProvinceX__c = mappings.legalEntityStateProvinceX__c;
		log.legalEntityStreetAddress1__c = mappings.legalEntityStreetAddress1__c;
		log.legalEntityStreetAddress1D__c = mappings.legalEntityStreetAddress1D__c;
		log.legalEntityStreetAddress1X__c = mappings.legalEntityStreetAddress1X__c;
		log.legalEntityStreetAddress2__c = mappings.legalEntityStreetAddress2__c;
		log.legalEntityStreetAddress2D__c = mappings.legalEntityStreetAddress2D__c;
		log.legalEntityStreetAddress2X__c = mappings.legalEntityStreetAddress2X__c;
		log.legalEntityTaxId__c = mappings.legalEntityTaxId__c;
		log.legalEntityTaxIdD__c = mappings.legalEntityTaxIdD__c;
		log.legalEntityTaxIdX__c = mappings.legalEntityTaxIdX__c;
		log.legalEntityType__c = mappings.legalEntityType__c;
		log.legalEntityTypeD__c = mappings.legalEntityTypeD__c;
		log.legalEntityTypeX__c = mappings.legalEntityTypeX__c;
	}
	

	//returns the request headers and body from the given http request
	public static String getRequestParamsLog(HttpRequest request){
		if(request != null){
			return 'Authorization: '+ request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION) + '\n'
							+ 'Content-Type: '+ request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE) + '\n'
							+ 'Accept: '+ request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT) + '\n'
							+ String.valueOf(request.getBody());
		}
		return null;
	}
	
	// returns the response headers and body from the given http response
	public static String getResponseParamsLog(HttpResponse response){
		//get the list of header names (keys)
		if(response != null){
			String[] headerkeys = response.getHeaderKeys();
			String responseParams = '';
			//iterate through they keys, and populate your map
			for(String header : headerkeys){
			   //headers.put(s,res.getHeader(s));
			   if(String.isNotEmpty(header)){
				   System.debug('header: ' + header + ' value: ' + response.getHeader(header));
				   responseParams += header + ' :' + response.getHeader(header) + '\n';
			   }
			}
			responseParams += String.valueOf(response.getBody());
			return responseParams;
		}
		return null;		 
	}
}