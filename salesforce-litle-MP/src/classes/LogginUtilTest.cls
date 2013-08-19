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
private class LogginUtilTest {
	public static final String DEFAULT_NAME = 'test';
	public static final Date DEFAULT_DATE = Date.today();
	
	static testMethod void testlogSObjectDetailsAccount(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		// test for account
		Account account = new Account(name = DEFAULT_NAME);
		insert account;
		LoggingUtil.logSObjectDetails(account.id, null, litleRequestResponseLog);
		System.assertEquals('Account', litleRequestResponseLog.sObjectType__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(account.id, litleRequestResponseLog.Account__c);	
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
		
		//test with bad account id
		litleRequestResponseLog = new LitleRequestResponseLog__c();
		LoggingUtil.logSObjectDetails('123', null, litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.sObjectType__c);
		System.assertEquals(null, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);	
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);	
		
		//test for opportunity
		Opportunity opportunity = new Opportunity(name = DEFAULT_NAME, stageName=DEFAULT_NAME, CloseDate=DEFAULT_DATE);
		insert opportunity;
		LoggingUtil.logSObjectDetails( null,opportunity.id, litleRequestResponseLog);
		System.assertEquals('Opportunity', litleRequestResponseLog.sObjectType__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);	
		System.assertEquals(opportunity.id, litleRequestResponseLog.Opportunity__c);	
		
		//test with bad opportunity id
		litleRequestResponseLog = new LitleRequestResponseLog__c();
		LoggingUtil.logSObjectDetails(null, '123', litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.sObjectType__c);
		System.assertEquals(null, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);	
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
			
	} 
	static testMethod void testfillSObjectLogObject(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		LoggingUtil.fillSObjectLogObject(null, null, null, litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.sObjectType__c);
		System.assertEquals(null, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
	} 
	
	static testMethod void testFillSObject_Account(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		Account account = new Account(name = DEFAULT_NAME);
		insert account;
		LoggingUtil.fillSObjectLogObject('Account', DEFAULT_NAME, account.Id, litleRequestResponseLog);
		System.assertEquals('Account', litleRequestResponseLog.sObjectType__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(account.Id, litleRequestResponseLog.Account__c);
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
	}
	
	static testMethod void testFillSObject_Opportunity(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		Opportunity opportunity = new Opportunity(name = DEFAULT_NAME, stageName=DEFAULT_NAME, CloseDate=DEFAULT_DATE);
		insert opportunity;
		LoggingUtil.fillSObjectLogObject('Opportunity', DEFAULT_NAME, opportunity.Id, litleRequestResponseLog);
		System.assertEquals('Opportunity', litleRequestResponseLog.sObjectType__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.sObjectName__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);
		System.assertEquals(opportunity.Id, litleRequestResponseLog.Opportunity__c);
	}
	
	static testMethod void testlogCreateLegalEntityRequest(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		// test null http request
		LoggingUtil.logCreateLegalEntityRequest(null, litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.createLegalEntityRequestDate__c);
		System.assertEquals(null, litleRequestResponseLog.createLegalEntityRequestXml__c);
		System.assertEquals(null, litleRequestResponseLog.legalEntityEndpoint__c);
		System.assertEquals(null, litleRequestResponseLog.legalEntityAcceptHeader__c);
		System.assertEquals(null, litleRequestResponseLog.legalEntityContentTypeHeader__c);
		System.assertEquals(null, litleRequestResponseLog.legalEntityAuthorizationHeader__c);
		
		// test with http request
		litleRequestResponseLog = new LitleRequestResponseLog__c();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(DEFAULT_NAME);
        request.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, DEFAULT_NAME);
        request.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, DEFAULT_NAME);
		request.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, DEFAULT_NAME);
		request.setBody(DEFAULT_NAME);
		LoggingUtil.logCreateLegalEntityRequest(request, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createLegalEntityRequestDate__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createLegalEntityRequestXml__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.legalEntityEndpoint__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.legalEntityAcceptHeader__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.legalEntityContentTypeHeader__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.legalEntityAuthorizationHeader__c);
	} 
	static testMethod void testlogCreateSubMerchantRequest(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
		// test null http request
		LoggingUtil.logCreateSubMerchantRequest(null, litleRequestResponseLog);
		System.assertEquals(null, litleRequestResponseLog.createSubMerchantRequestDate__c);
		System.assertEquals(null, litleRequestResponseLog.createSubMerchantRequestXml__c);
		System.assertEquals(null, litleRequestResponseLog.subMerchantEndpoint__c);
		System.assertEquals(null, litleRequestResponseLog.subMerchantAcceptHeader__c);
		System.assertEquals(null, litleRequestResponseLog.subMerchantContentTypeHeader__c);
		System.assertEquals(null, litleRequestResponseLog.subMerchantAuthorizationHeader__c);
		
		// test with http request
		litleRequestResponseLog = new LitleRequestResponseLog__c();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(DEFAULT_NAME);
        request.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, DEFAULT_NAME);
        request.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, DEFAULT_NAME);
		request.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, DEFAULT_NAME);
		request.setBody(DEFAULT_NAME);
		LoggingUtil.logCreateSubMerchantRequest(request, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createSubMerchantRequestDate__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createSubMerchantRequestXml__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.subMerchantEndpoint__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.subMerchantAcceptHeader__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.subMerchantContentTypeHeader__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.subMerchantAuthorizationHeader__c);	
	} 
	static testMethod void testLogCreateLegalEntityResponse(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();	
		HttpResponse response = new HttpResponse();	
		// test with blank response
		LoggingUtil.logCreateLegalEntityResponse(response, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createLegalEntityResponseDate__c);
		System.assertEquals('', litleRequestResponseLog.createLegalEntityResponseXml__c);
		System.assertEquals('0', litleRequestResponseLog.createLegalEntityResponseStatusCode__c);	
		System.assertEquals(null, litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);		
		
		// set response parameters
		response.setStatus(DEFAULT_NAME);
		response.setStatusCode(200);
		response.setBody(DEFAULT_NAME);
		LoggingUtil.logCreateLegalEntityResponse(response, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createLegalEntityResponseDate__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createLegalEntityResponseXml__c);
		System.assertEquals('200', litleRequestResponseLog.createLegalEntityResponseStatusCode__c);	
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);	
	} 
	static testMethod void testLogCreateSubMerchantResponse(){
		LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();	
		HttpResponse response = new HttpResponse();	
		// test with blank response
		LoggingUtil.logCreateSubMerchantResponse(response, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createSubMerchantResponseDate__c);
		System.assertEquals('', litleRequestResponseLog.createSubMerchantResponseXml__c);
		System.assertEquals('0', litleRequestResponseLog.createSubMerchantResponseStatusCode__c);	
		System.assertEquals(null, litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);		
		
		// set response parameters
		response.setStatus(DEFAULT_NAME);
		response.setStatusCode(200);
		response.setBody(DEFAULT_NAME);
		LoggingUtil.logCreateSubMerchantResponse(response, litleRequestResponseLog);
		System.assertNotEquals(null, litleRequestResponseLog.createSubMerchantResponseDate__c);
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createSubMerchantResponseXml__c);
		System.assertEquals('200', litleRequestResponseLog.createSubMerchantResponseStatusCode__c);	
		System.assertEquals(DEFAULT_NAME, litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);	
	} 
	static testMethod void testGetRequestParamsLog(){
		System.assertEquals(null, LoggingUtil.getRequestParamsLog(null));
		HttpRequest request = new HttpRequest();
		// test with blank request
		System.assertEquals('Authorization: null\nContent-Type: null\nAccept: null\n', LoggingUtil.getRequestParamsLog(request));
		// set headers and body
		request.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, DEFAULT_NAME);
		request.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, DEFAULT_NAME);
		request.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, DEFAULT_NAME);
		request.setBody(DEFAULT_NAME);
		System.assertEquals('Authorization: '+ DEFAULT_NAME +'\nContent-Type: '+ DEFAULT_NAME +'\nAccept: '+ DEFAULT_NAME +'\n'+ DEFAULT_NAME, LoggingUtil.getRequestParamsLog(request));
			
	} 
	static testMethod void testGetResponseParamsLog(){
		System.assertEquals(null, LoggingUtil.getResponseParamsLog(null));
		HttpResponse response = new HttpResponse();	
		System.assertEquals('', LoggingUtil.getResponseParamsLog(response));
		// set headers and body
		response.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, DEFAULT_NAME);
		response.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, DEFAULT_NAME);
		response.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, DEFAULT_NAME);
		response.setBody(DEFAULT_NAME);
		System.assertEquals('Authorization :'+ DEFAULT_NAME  +'\nAccept :'+ DEFAULT_NAME +'\nContent-Type :'+ DEFAULT_NAME +'\n'+ DEFAULT_NAME, LoggingUtil.getResponseParamsLog(response));
		
	}
	
	static testMethod void testLogMappingsSave(){
		String DEFAULT_VAL = 'blabalblah';
		Boolean DEFAULT_BOOL = true;
		SalesforceLitleMappingsObject__c mappings = new SalesforceLitleMappingsObject__c();
		mappings.legalEntityAnnualCreditCardSalesVolume__c = DEFAULT_VAL;
        mappings.legalEntityAnnualCreditCardSalesVolumeD__c = DEFAULT_VAL;
        mappings.legalEntityAnnualCreditCardSalesVolumeX__c = DEFAULT_BOOL;
        mappings.legalEntityCity__c = DEFAULT_VAL;
        mappings.legalEntityCityD__c = DEFAULT_VAL;
        mappings.legalEntityCityX__c = DEFAULT_BOOL;
        mappings.legalEntityContactPhone__c = DEFAULT_VAL;
        mappings.legalEntityContactPhoneD__c = DEFAULT_VAL;
        mappings.legalEntityContactPhoneX__c = DEFAULT_BOOL;
        mappings.legalEntityCountryCode__c = DEFAULT_VAL;
        mappings.legalEntityCountryCodeD__c = DEFAULT_VAL;
        mappings.legalEntityCountryCodeX__c = DEFAULT_BOOL;
        mappings.legalEntityDoingBusinessAs__c = DEFAULT_VAL;
        mappings.legalEntityDoingBusinessAsD__c = DEFAULT_VAL;
        mappings.legalEntityDoingBusinessAsX__c = DEFAULT_BOOL;
        mappings.legalEntityFirstName__c = DEFAULT_VAL;
        mappings.legalEntityFirstNameD__c = DEFAULT_VAL;
        mappings.legalEntityFirstNameX__c = DEFAULT_BOOL;
        mappings.legalEntityHasAcceptedCreditCards__c = DEFAULT_VAL;
        mappings.legalEntityHasAcceptedCreditCardsD__c = DEFAULT_VAL;
        mappings.legalEntityHasAcceptedCreditCardsX__c = DEFAULT_BOOL;
        mappings.legalEntityLastName__c = DEFAULT_VAL;
        mappings.legalEntityLastNameD__c = DEFAULT_VAL;
        mappings.legalEntityLastNameX__c = DEFAULT_BOOL;
        mappings.legalEntityName__c = DEFAULT_VAL;
        mappings.legalEntityNameD__c = DEFAULT_VAL;
        mappings.legalEntityNameX__c = DEFAULT_BOOL;
        mappings.legalEntityPostalCode__c = DEFAULT_VAL;
        mappings.legalEntityPostalCodeD__c = DEFAULT_VAL;
        mappings.legalEntityPostalCodeX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalCity__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalCityD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalCityX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalContactPhone__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalContactPhoneD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalContactPhoneX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalCountryCode__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalCountryCodeD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalCountryCodeD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalCountryCodeX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalDateOfBirth__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalDateOfBirthD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalDateOfBirthX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalDriversLicense__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalDriversLicenseD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalDriversLicenseX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalDriversLicenseState__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalDriversLicenseStateD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalDriversLicenseStateX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalEmailAddress__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalEmailAddressD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalEmailAddressX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalFirstName__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalFirstNameD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalFirstNameX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalLastName__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalLastNameD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalLastNameX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalPostalCode__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalPostalCodeD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalPostalCodeX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalSsn__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalSsnD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalSsnX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalStateProvince__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalStateProvinceD__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalStateProvinceX__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalStreetAddress1__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalStreetAddress1D__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalStreetAddress1X__c = DEFAULT_BOOL;
        mappings.legalEntityPrincipalStreetAddress2__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalStreetAddress2D__c = DEFAULT_VAL;
        mappings.legalEntityPrincipalStreetAddress2X__c = DEFAULT_BOOL;
        mappings.legalEntityStateProvince__c = DEFAULT_VAL;
        mappings.legalEntityStateProvinceD__c = DEFAULT_VAL;
        mappings.legalEntityStateProvinceX__c = DEFAULT_BOOL;
        mappings.legalEntityStreetAddress1__c = DEFAULT_VAL;
        mappings.legalEntityStreetAddress1D__c = DEFAULT_VAL;
        mappings.legalEntityStreetAddress1X__c = DEFAULT_BOOL;
        mappings.legalEntityStreetAddress2__c = DEFAULT_VAL;
        mappings.legalEntityStreetAddress2D__c = DEFAULT_VAL;
        mappings.legalEntityStreetAddress2X__c = DEFAULT_BOOL;
        mappings.legalEntityTaxID__c = DEFAULT_VAL;
        mappings.legalEntityTaxIdD__c = DEFAULT_VAL;
        mappings.legalEntityTaxIdX__c = DEFAULT_BOOL;
        mappings.legalEntityType__c = DEFAULT_VAL;
        mappings.legalEntityTypeD__c = DEFAULT_VAL;
        mappings.legalEntityTypeX__c = DEFAULT_BOOL;
        mappings.litleEnvironment__c = DEFAULT_VAL;
        mappings.merchantUsername__c = DEFAULT_VAL;
        mappings.subMerchantAmexMiD__c = DEFAULT_VAL;
        mappings.subMerchantAmexMidD__c = DEFAULT_VAL;
        mappings.subMerchantAmexMidX__c = DEFAULT_BOOL;
        mappings.subMerchantBankAccountNumber__c = DEFAULT_VAL;
        mappings.subMerchantBankAccountNumberD__c = DEFAULT_VAL;
        mappings.subMerchantBankAccountNumberX__c = DEFAULT_BOOL;
        mappings.subMerchantBankRoutingNumber__c = DEFAULT_VAL;
        mappings.subMerchantBankRoutingNumberD__c = DEFAULT_VAL;
        mappings.subMerchantBankRoutingNumberX__c = DEFAULT_BOOL;
        mappings.subMerchantCity__c = DEFAULT_VAL;
        mappings.subMerchantCityD__c = DEFAULT_VAL;
        mappings.subMerchantCityX__c = DEFAULT_BOOL;
        mappings.subMerchantCountryCode__c = DEFAULT_VAL;
        mappings.subMerchantCountryCodeD__c = DEFAULT_VAL;
        mappings.subMerchantCountryCodeX__c = DEFAULT_BOOL;
        mappings.subMerchantCreateCredentials__c = DEFAULT_VAL;
        mappings.subMerchantCreateCredentialsD__c = DEFAULT_VAL;
        mappings.subMerchantCreateCredentialsX__c = DEFAULT_BOOL;
        mappings.subMerchantCustomerServiceNumber__c = DEFAULT_VAL;
        mappings.subMerchantCustomerServiceNumberD__c = DEFAULT_VAL;
        mappings.subMerchantCustomerServiceNumberX__c = DEFAULT_BOOL;
        mappings.subMerchantDiscoverConveyMiD__c = DEFAULT_VAL;
        mappings.subMerchantDiscoverConveyMidD__c = DEFAULT_VAL;
        mappings.subMerchantDiscoverConveyMidX__c = DEFAULT_BOOL;
        mappings.subMerchantEmailAddress__c = DEFAULT_VAL;
        mappings.subMerchantEmailAddressD__c = DEFAULT_VAL;
        mappings.subMerchantEmailAddressX__c = DEFAULT_BOOL;
        mappings.subMerchantFirstName__c = DEFAULT_VAL;
        mappings.subMerchantFirstNameD__c = DEFAULT_VAL;
        mappings.subMerchantFirstNameX__c = DEFAULT_BOOL;
        mappings.subMerchantHardCodeBillingDescD__c = DEFAULT_VAL;
        mappings.subMerchantHardCodeBillingDescriptor__c = DEFAULT_VAL;
        mappings.subMerchantHardCodeBillingDescriptorX__c = DEFAULT_BOOL;
        mappings.subMerchantLastName__c = DEFAULT_VAL;
        mappings.subMerchantLastNameD__c = DEFAULT_VAL;
        mappings.subMerchantLastNameX__c = DEFAULT_BOOL;
        mappings.subMerchantMaxTransactionAmount__c = DEFAULT_VAL;
        mappings.subMerchantMaxTransactionAmountD__c = DEFAULT_VAL;
        mappings.subMerchantMaxTransactionAmountX__c = DEFAULT_BOOL;
        mappings.subMerchantMerchantCategoryCode__c = DEFAULT_VAL;
        mappings.subMerchantMerchantCategoryCodeD__c = DEFAULT_VAL;
        mappings.subMerchantMerchantCategoryCodeX__c = DEFAULT_BOOL;
        mappings.subMerchantMerchantName__c = DEFAULT_VAL;
        mappings.subMerchantMerchantNameD__c = DEFAULT_VAL;
        mappings.subMerchantMerchantNameX__c = DEFAULT_BOOL;
        mappings.subMerchantPhone__c = DEFAULT_VAL;
        mappings.subMerchantPhoneD__c = DEFAULT_VAL;
        mappings.subMerchantPhoneX__c = DEFAULT_BOOL;
        mappings.subMerchantPostalCode__c = DEFAULT_VAL;
        mappings.subMerchantPostalCodeD__c = DEFAULT_VAL;
        mappings.subMerchantPostalCodeX__c = DEFAULT_BOOL;
        mappings.subMerchantPspMerchantID__c = DEFAULT_VAL;
        mappings.subMerchantPspMerchantIdD__c = DEFAULT_VAL;
        mappings.subMerchantPspMerchantIdX__c = DEFAULT_BOOL;
        mappings.subMerchantStateProvince__c = DEFAULT_VAL;
        mappings.subMerchantStateProvinceD__c = DEFAULT_VAL;
        mappings.subMerchantStateProvinceX__c = DEFAULT_BOOL;
        mappings.subMerchantStreetAddress1__c = DEFAULT_VAL;
        mappings.subMerchantStreetAddress1D__c = DEFAULT_VAL;
        mappings.subMerchantStreetAddress1X__c = DEFAULT_BOOL;
        mappings.subMerchantStreetAddress2__c = DEFAULT_VAL;
        mappings.subMerchantStreetAddress2D__c = DEFAULT_VAL;
        mappings.subMerchantStreetAddress2X__c = DEFAULT_BOOL;
        mappings.subMerchantUrl__c = DEFAULT_VAL;
        mappings.subMerchantUrlD__c = DEFAULT_VAL;
        mappings.subMerchantUrlX__c = DEFAULT_BOOL;
        mappings.subMerchanteCheckBillingDescriptor__c = DEFAULT_VAL;
        mappings.subMerchanteCheckBillingDescD__c = DEFAULT_VAL;
        mappings.subMerchanteCheckBillingDescriptorX__c = DEFAULT_BOOL;
        mappings.subMerchanteCheckCompanyName__c = DEFAULT_VAL;
        mappings.subMerchanteCheckCompanyNameD__c = DEFAULT_VAL;
        mappings.subMerchanteCheckCompanyNameX__c = DEFAULT_BOOL;
        
        LitleMappingsSaveLog__c log = new LitleMappingsSaveLog__c();
        
        LoggingUtil.logSaveLitleMappings(mappings, log);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityAnnualCreditCardSalesVolume__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityAnnualCreditCardSalesVolumeD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityAnnualCreditCardSalesVolumeX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityCity__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityCityD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityCityX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityContactPhone__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityContactPhoneD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityContactPhoneX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityCountryCode__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityCountryCodeD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityCountryCodeX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityDoingBusinessAs__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityDoingBusinessAsD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityDoingBusinessAsX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityFirstName__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityFirstNameD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityFirstNameX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityHasAcceptedCreditCards__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityHasAcceptedCreditCardsD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityHasAcceptedCreditCardsX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityLastName__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityLastNameD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityLastNameX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityName__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityNameD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityNameX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPostalCode__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPostalCodeD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPostalCodeX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalCity__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalCityD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalCityX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalContactPhone__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalContactPhoneD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalContactPhoneX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalCountryCode__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalCountryCodeD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalCountryCodeX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalDateOfBirth__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalDateOfBirthD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalDateOfBirthX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalDriversLicense__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalDriversLicenseD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalDriversLicenseX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalDriversLicenseState__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalDriversLicenseStateD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalDriversLicenseStateX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalEmailAddress__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalEmailAddressD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalEmailAddressX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalFirstName__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalFirstNameD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalFirstNameX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalLastName__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalLastNameD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalLastNameX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalPostalCode__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalPostalCodeD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalPostalCodeX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalSsn__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalSsnD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalSsnX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalStateProvince__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalStateProvinceD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalStateProvinceX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalStreetAddress1__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalStreetAddress1D__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalStreetAddress1X__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalStreetAddress2__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityPrincipalStreetAddress2D__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityPrincipalStreetAddress2X__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityStateProvince__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityStateProvinceD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityStateProvinceX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityStreetAddress1__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityStreetAddress1D__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityStreetAddress1X__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityStreetAddress2__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityStreetAddress2D__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityStreetAddress2X__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityTaxId__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityTaxIdD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityTaxIdX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityType__c);
        System.assertEquals(DEFAULT_VAL, mappings.legalEntityTypeD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.legalEntityTypeX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.litleEnvironment__c);
        System.assertEquals(DEFAULT_VAL, mappings.merchantUsername__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantAmexMid__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantAmexMidD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantAmexMidX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantBankAccountNumber__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantBankAccountNumberD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantBankAccountNumberX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantBankRoutingNumber__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantBankRoutingNumberD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantBankRoutingNumberX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantCity__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantCityD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantCityX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantCountryCode__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantCountryCodeD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantCountryCodeX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantCreateCredentials__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantCreateCredentialsD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantCreateCredentialsX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantCustomerServiceNumber__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantCustomerServiceNumberD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantCustomerServiceNumberX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantDiscoverConveyMid__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantDiscoverConveyMidD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantDiscoverConveyMidX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantEmailAddress__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantEmailAddressD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantEmailAddressX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantFirstName__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantFirstNameD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantFirstNameX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantHardCodeBillingDescD__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantHardCodeBillingDescriptor__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantHardCodeBillingDescriptorX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantLastName__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantLastNameD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantLastNameX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantMaxTransactionAmount__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantMaxTransactionAmountD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantMaxTransactionAmountX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantMerchantCategoryCode__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantMerchantCategoryCodeD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantMerchantCategoryCodeX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantMerchantName__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantMerchantNameD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantMerchantNameX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantPhone__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantPhoneD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantPhoneX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantPostalCode__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantPostalCodeD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantPostalCodeX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantPspMerchantId__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantPspMerchantIdD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantPspMerchantIdX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantStateProvince__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantStateProvinceD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantStateProvinceX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantStreetAddress1__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantStreetAddress1D__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantStreetAddress1X__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantStreetAddress2__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantStreetAddress2D__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantStreetAddress2X__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantUrl__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchantUrlD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchantUrlX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchanteCheckBillingDescriptor__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchanteCheckBillingDescD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchanteCheckBillingDescriptorX__c);
        
        System.assertEquals(DEFAULT_VAL, mappings.subMerchanteCheckCompanyName__c);
        System.assertEquals(DEFAULT_VAL, mappings.subMerchanteCheckCompanyNameD__c);
        System.assertEquals(DEFAULT_BOOL, mappings.subMerchanteCheckCompanyNameX__c);
	}
	 

}