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
		log.litleEnvironment__c = mappings.litleEnvironment__c;
        log.merchantUsername__c = mappings.merchantUsername__c;
        log.subMerchantAmexMid__c = mappings.subMerchantAmexMid__c;
        log.subMerchantAmexMidD__c = mappings.subMerchantAmexMidD__c;
        log.subMerchantAmexMidX__c = mappings.subMerchantAmexMidX__c;
        log.subMerchantBankAccountNumber__c = mappings.subMerchantBankAccountNumber__c;
        log.subMerchantBankAccountNumberD__c = mappings.subMerchantBankAccountNumberD__c;
        log.subMerchantBankAccountNumberX__c = mappings.subMerchantBankAccountNumberX__c;
        log.subMerchantBankRoutingNumber__c = mappings.subMerchantBankRoutingNumber__c;
        log.subMerchantBankRoutingNumberD__c = mappings.subMerchantBankRoutingNumberD__c;
        log.subMerchantBankRoutingNumberX__c = mappings.subMerchantBankRoutingNumberX__c;
        log.subMerchantCity__c = mappings.subMerchantCity__c;
        log.subMerchantCityD__c = mappings.subMerchantCityD__c;
        log.subMerchantCityX__c = mappings.subMerchantCityX__c;
        log.subMerchantCountryCode__c = mappings.subMerchantCountryCode__c;
        log.subMerchantCountryCodeD__c = mappings.subMerchantCountryCodeD__c;
        log.subMerchantCountryCodeX__c = mappings.subMerchantCountryCodeX__c;
        log.subMerchantCreateCredentials__c = mappings.subMerchantCreateCredentials__c;
        log.subMerchantCreateCredentialsD__c = mappings.subMerchantCreateCredentialsD__c;
        log.subMerchantCreateCredentialsX__c = mappings.subMerchantCreateCredentialsX__c;
        log.subMerchantCustomerServiceNumber__c = mappings.subMerchantCustomerServiceNumber__c;
        log.subMerchantCustomerServiceNumberD__c = mappings.subMerchantCustomerServiceNumberD__c;
        log.subMerchantCustomerServiceNumberX__c = mappings.subMerchantCustomerServiceNumberX__c;
        log.subMerchantDiscoverConveyMid__c = mappings.subMerchantDiscoverConveyMid__c;
        log.subMerchantDiscoverConveyMidD__c = mappings.subMerchantDiscoverConveyMidD__c;
        log.subMerchantDiscoverConveyMidX__c = mappings.subMerchantDiscoverConveyMidX__c;
        log.subMerchantEmailAddress__c = mappings.subMerchantEmailAddress__c;
        log.subMerchantEmailAddressD__c = mappings.subMerchantEmailAddressD__c;
        log.subMerchantEmailAddressX__c = mappings.subMerchantEmailAddressX__c;
        log.subMerchantFirstName__c = mappings.subMerchantFirstName__c;
        log.subMerchantFirstNameD__c = mappings.subMerchantFirstNameD__c;
        log.subMerchantFirstNameX__c = mappings.subMerchantFirstNameX__c;
        log.subMerchantHardCodeBillingDescD__c = mappings.subMerchantHardCodeBillingDescD__c;
        log.subMerchantHardCodeBillingDescriptor__c = mappings.subMerchantHardCodeBillingDescriptor__c;
        log.subMerchantHardCodeBillingDescriptorX__c = mappings.subMerchantHardCodeBillingDescriptorX__c;
        log.subMerchantLastName__c = mappings.subMerchantLastName__c;
        log.subMerchantLastNameD__c = mappings.subMerchantLastNameD__c;
        log.subMerchantLastNameX__c = mappings.subMerchantLastNameX__c;
        log.subMerchantMaxTransactionAmount__c = mappings.subMerchantMaxTransactionAmount__c;
        log.subMerchantMaxTransactionAmountD__c = mappings.subMerchantMaxTransactionAmountD__c;
        log.subMerchantMaxTransactionAmountX__c = mappings.subMerchantMaxTransactionAmountX__c;
        log.subMerchantMerchantCategoryCode__c = mappings.subMerchantMerchantCategoryCode__c;
        log.subMerchantMerchantCategoryCodeD__c = mappings.subMerchantMerchantCategoryCodeD__c;
        log.subMerchantMerchantCategoryCodeX__c = mappings.subMerchantMerchantCategoryCodeX__c;
        log.subMerchantMerchantName__c = mappings.subMerchantMerchantName__c;
        log.subMerchantMerchantNameD__c = mappings.subMerchantMerchantNameD__c;
        log.subMerchantMerchantNameX__c = mappings.subMerchantMerchantNameX__c;
        log.subMerchantPhone__c = mappings.subMerchantPhone__c;
        log.subMerchantPhoneD__c = mappings.subMerchantPhoneD__c;
        log.subMerchantPhoneX__c = mappings.subMerchantPhoneX__c;
        log.subMerchantPostalCode__c = mappings.subMerchantPostalCode__c;
        log.subMerchantPostalCodeD__c = mappings.subMerchantPostalCodeD__c;
        log.subMerchantPostalCodeX__c = mappings.subMerchantPostalCodeX__c;
        log.subMerchantPspMerchantId__c = mappings.subMerchantPspMerchantId__c;
        log.subMerchantPspMerchantIdD__c = mappings.subMerchantPspMerchantIdD__c;
        log.subMerchantPspMerchantIdX__c = mappings.subMerchantPspMerchantIdX__c;
        log.subMerchantStateProvince__c = mappings.subMerchantStateProvince__c;
        log.subMerchantStateProvinceD__c = mappings.subMerchantStateProvinceD__c;
        log.subMerchantStateProvinceX__c = mappings.subMerchantStateProvinceX__c;
        log.subMerchantStreetAddress1__c = mappings.subMerchantStreetAddress1__c;
        log.subMerchantStreetAddress1D__c = mappings.subMerchantStreetAddress1D__c;
        log.subMerchantStreetAddress1X__c = mappings.subMerchantStreetAddress1X__c;
        log.subMerchantStreetAddress2__c = mappings.subMerchantStreetAddress2__c;
        log.subMerchantStreetAddress2D__c = mappings.subMerchantStreetAddress2D__c;
        log.subMerchantStreetAddress2X__c = mappings.subMerchantStreetAddress2X__c;
        log.subMerchantUrl__c = mappings.subMerchantUrl__c;
        log.subMerchantUrlD__c = mappings.subMerchantUrlD__c;
        log.subMerchantUrlX__c = mappings.subMerchantUrlX__c;
        log.subMerchanteCheckBillingDescriptor__c = mappings.subMerchanteCheckBillingDescriptor__c;
        log.subMerchanteCheckBillingDescD__c = mappings.subMerchanteCheckBillingDescD__c;
        log.subMerchanteCheckBillingDescriptorX__c = mappings.subMerchanteCheckBillingDescriptorX__c;
        log.subMerchanteCheckCompanyName__c = mappings.subMerchanteCheckCompanyName__c;
        log.subMerchanteCheckCompanyNameD__c = mappings.subMerchanteCheckCompanyNameD__c;
        log.subMerchanteCheckCompanyNameX__c = mappings.subMerchanteCheckCompanyNameX__c;
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
			   if(String.isNotEmpty(header)){
				   responseParams += header + ' :' + response.getHeader(header) + '\n';
			   }
			}
			responseParams += String.valueOf(response.getBody());
			return responseParams;
		}
		return null;		 
	}
}