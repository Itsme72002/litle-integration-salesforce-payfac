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
private class LitleFormControllerTest {
	public static final String LONG_STRING = 'Lopado­­temacho­­selacho­­galeo­­kranio­­leipsano­­drim­­hypo­­trimmato­­silphio­­parao­­melito­­katakechy­­meno­­kichl­­epi­­kossypho­­phatto­­perister­­alektryon­­opte­­kephallio­­kigklo­­peleio­­lagoio­­siraio­­baphe­­tragano­­pterygon';
	public static final String STATE = 'MA';
	public static final String DATE_STRING = '2013-06-01';
	public static final String BOOLEAN_STRING = 'true';
	public static final String INTEGER_STRING = '2';
	public static final String ACCOUNT_NAME = 'Test Account';
	public static final String OPPORTUNITY_NAME = 'Test Opportunity';
	public static final String DEFAULT_STRING = 'Default String';
	public static final Date DEFAULT_DATE = Date.today();
	public static final String TEN_INTEGERS = '1234567890';
	public static final String FIVE_INTEGERS = '12345';
	public static final String FIFTEEN_INTEGERS = '123456789012345';
	public static final String THIRTEEN_INTEGERS = '1234567890123';
	public static final String NINE_INTEGERS = '123456789';

   static testMethod void testIsInputDataValid() {
        // Input all incorrect data
        
        LitleMidFormController litleMidFormController = new LitleMidFormController();
        litleMidFormController.legalEntityModel.setLegalEntityName(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityType(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(LONG_STRING);
		// IsInputDataValid should return false
        System.assertEquals(false, litleMidFormController.isInputDataValid());
        // Select Individual sole proprietorship as legal entity type
        litleMidFormController.legalEntityModel.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name());
        // IsInputDataValid should return false
        System.assertEquals(false, litleMidFormController.isInputDataValid());
        // Input all correct fields
        litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(TEN_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(NINE_INTEGERS);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(FIFTEEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(THIRTEEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		System.assertEquals(true, litleMidFormController.isInputDataValid());
    }
    
    static testMethod void testAreRequiredFieldsFilled() {
    	
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	litleMidFormController.legalEntityModel = new LegalEntityModel();
    	litleMidFormController.subMerchantModel = new SubMerchantModel();
    	// Initially all fields are null/empty
    	System.assertEquals(false, litleMidFormController.areRequiredFieldsFilled());
    	litleMidFormController.legalEntityModel.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name());
    	System.assertEquals(false, litleMidFormController.areRequiredFieldsFilled());
    	litleMidFormController.legalEntityModel.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.LIMITED_LIABILITY_COMPANY.name());
    	System.assertEquals(false, litleMidFormController.areRequiredFieldsFilled());
    	// Set all the required fields for entity type other than sole proprietorship
    	litleMidFormController.legalEntityModel.setLegalEntityName(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityType(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(LONG_STRING);
		
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(LONG_STRING);
		//new required fields
		System.assertEquals(false, litleMidFormController.areRequiredFieldsFilled());
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(LONG_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(LONG_STRING);
		System.assertEquals(true, litleMidFormController.areRequiredFieldsFilled());
		// set the entity type to sole proprietorship
		litleMidFormController.legalEntityModel.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name());
		System.assertEquals(false, litleMidFormController.areRequiredFieldsFilled());
		// set the required fields and check
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(LONG_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(FIVE_INTEGERS);
		System.assertEquals(true, litleMidFormController.areRequiredFieldsFilled());
    }
    
    static testMethod void testLitleMidPopulation(){
    	Account account = new Account(name = ACCOUNT_NAME);
    	account.Litle_Mid__c = '8675309';
    	insert account;
    	
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals('8675309', litleMidFormController.litleMid);
    	System.assert(litleMidFormController.getIsLitleMidAvailable());
    	delete account;
    	account = new Account(name = ACCOUNT_NAME);
    	insert account;
    	
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
        litleMidFormController = new LitleMidFormController();
        System.assertEquals(null, litleMidFormController.litleMid);
        
        account = new Account(name = ACCOUNT_NAME);
        account.Litle_Mid__C = '404 : Unauthorized';
        insert account;
        
        ApexPages.currentPage().getParameters().put('accid',account.Id);
        litleMidFormController = new LitleMidFormController();
        System.assertEquals('404 : Unauthorized', litleMidFormController.litleMid);
        System.assert(!litleMidFormController.getIsLitleMidAvailable());

    }
    
    static testMethod void testConstructor(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE, AccountId = account.id);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(account.id, litleMidFormController.urlAccountId);
    	System.assertEquals('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.', Apexpages.getMessages().get(0).getSummary());
    	// bad opp id
    	ApexPages.currentPage().getParameters().put('oppid','123');
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(null, litleMidFormController.urlAccountId);
    	System.assertEquals(1, Apexpages.getMessages().size());
    	System.assertEquals('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.', Apexpages.getMessages().get(0).getSummary());
    }
    
    static testMethod void testConstructor_SucessMcc(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// insert username and password
    	mappingObject.merchantUsername__c = DEFAULT_STRING;
    	mappingObject.merchantPassword__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
    	insert mappingObject;
    	Test.startTest();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new MccSuccessResponse(), null));
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	List<Selectoption> expectedMccSelectOptions = new List<Selectoption>();
    	expectedMccSelectOptions.add(new Selectoption('', '-- Select Option --'));
    	expectedMccSelectOptions.add(new Selectoption('5960', '5960'));
    	expectedMccSelectOptions.add(new Selectoption('5964', '5964'));
    	expectedMccSelectOptions.add(new Selectoption('5965', '5965'));
    	expectedMccSelectOptions.add(new Selectoption('8220','8220'));
    	System.assertEquals(account.id, litleMidFormController.urlAccountId);
    	System.assertEquals(0, Apexpages.getMessages().size());
    	System.assertEquals(litleMidFormController.mccSelectList, expectedMccSelectOptions);
    	Test.stopTest();
    }

    static testMethod void testConstructor_ErrorMcc(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// insert username and password
    	mappingObject.merchantUsername__c = DEFAULT_STRING;
    	mappingObject.merchantPassword__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
    	insert mappingObject;
    	List<Selectoption> expectedMccSelectOptions = new List<Selectoption>();
    	expectedMccSelectOptions.add(new Selectoption('', '-- Select Option --'));
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(account.id, litleMidFormController.urlAccountId);
    	System.assertEquals(1, Apexpages.getMessages().size());
    	System.assertEquals('Could not retrieve available Merchant Category Codes. Please contact Litle support.', Apexpages.getMessages().get(0).getSummary());
    	System.assertEquals(expectedMccSelectOptions, litleMidFormController.mccSelectList);
    }
    
    static testMethod void testSubmitInvalidEntriesNoValueSavedInAccount(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(INTEGER_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(DATE_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		litleMidFormController.submit();
		System.assertEquals(null, account.Litle_Mid__c);
		System.assertEquals(null, account.PayFac_Portal_Link__c);
		System.assert(!litleMidFormController.getIsLitleMidAvailable());
    }
    
    static testMethod void testSubmitInvalidEntriesNoValueSavedInOpportunity(){
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(INTEGER_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(DATE_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		litleMidFormController.submit();
		System.assertEquals(null, opportunity.Litle_Mid__c);
		System.assertEquals(null, opportunity.PayFac_Portal_Link__c);
		System.assert(!litleMidFormController.getIsLitleMidAvailable());
    }
       
    static testMethod void testSubmitSuccessInAccount(){
    	
    	Account insertedaccount = new Account(name=ACCOUNT_NAME);
    	insert insertedaccount;
    	ApexPages.currentPage().getParameters().put('accid',insertedaccount.Id);
		LitleMidFormController litleMidFormController = new LitleMidFormController();
		SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// insert username and password
    	litleMidFormController.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	litleMidFormController.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	
    	litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(TEN_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(NINE_INTEGERS);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(INTEGER_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(DATE_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(FIFTEEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(true), new SubMerchantApprovedResponse()));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		//expectedMessagesList.add('Litle Mid has been generated successfully. It will appear on the Litle MID field.');
		expectedMessagesList.add('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.');
		expectedMessagesList.add('Your KYC Information has been successfully recorded. You can view it by clicking on the \'Litle KYC Information\' button.');
		List<String> actualMessageList = new List<String>();
		for(Apexpages.Message message: Apexpages.getMessages()){
			actualMessageList.add(message.getSummary());
		}
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :insertedaccount.Id];	
		System.assertEquals(expectedMessagesList, actualMessageList);	
		System.assertEquals('01100003', thisAccount.Litle_Mid__c);
		System.assertEquals(LitleConstants.LITLE_ENV_CERT + '/metaui/payfacPortal/legalEntity/82821536565084223/subMerchant/1100003?pspSubmerchantId=MA', thisAccount.PayFac_Portal_Link__c);
		
		LitleRequestResponseLog__c litleRequestResponseLog = [select Account__c, Opportunity__c from LitleRequestResponseLog__c where legalEntityId__c = '82821536565084223'];
		System.assertEquals(insertedaccount.Id, litleRequestResponseLog.Account__c);
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
		System.assert(litleMidFormController.getIsLitleMidAvailable());
		Test.stopTest();
    }
    
    static testMethod void testSubmitInAccount_ErrorInLegalEntity(){
    	
    	Account insertedaccount = new Account(name=ACCOUNT_NAME);
    	insert insertedaccount;
    	ApexPages.currentPage().getParameters().put('accid',insertedaccount.Id);
		LitleMidFormController litleMidFormController = new LitleMidFormController();
		SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// insert username and password
    	litleMidFormController.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	litleMidFormController.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	
    	litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(TEN_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(NINE_INTEGERS);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(INTEGER_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(DATE_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(FIFTEEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		//expectedMessagesList.add('Litle Mid has been generated successfully. It will appear on the Litle MID field.');
		expectedMessagesList.add('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.');
		expectedMessagesList.add('You are not authorized to access this resource. Please check your credentials.');
		List<String> actualMessageList = new List<String>();
		for(Apexpages.Message message: Apexpages.getMessages()){
			actualMessageList.add(message.getSummary());
		}
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :insertedaccount.Id];	
		System.assertEquals(expectedMessagesList, actualMessageList);	
		System.assertEquals('401 : Unauthorized', thisAccount.Litle_Mid__c);
		System.assertEquals(null, thisAccount.PayFac_Portal_Link__c);
		
		LitleRequestResponseLog__c litleRequestResponseLog = [select Account__c, Opportunity__c from LitleRequestResponseLog__c];
		System.assertEquals(insertedaccount.Id, litleRequestResponseLog.Account__c);
		System.assertEquals(null, litleRequestResponseLog.Opportunity__c);
		System.assert(!litleMidFormController.getIsLitleMidAvailable());
		Test.stopTest();
    }
    
    static testMethod void testSubmitSuccessInOpportunity(){
    	
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
		LitleMidFormController litleMidFormController = new LitleMidFormController();
		SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// insert username and password
    	litleMidFormController.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	litleMidFormController.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	
    	litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(TEN_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(NINE_INTEGERS);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(INTEGER_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(DATE_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(FIFTEEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(true), new SubMerchantApprovedResponse()));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		//expectedMessagesList.add('Litle Mid has been generated successfully. It will appear on the Litle MID field.');
		expectedMessagesList.add('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.');
		expectedMessagesList.add('Your KYC Information has been successfully recorded. You can view it by clicking on the \'Litle KYC Information\' button.');
		List<String> actualMessageList = new List<String>();
		for(Apexpages.Message message: Apexpages.getMessages()){
			actualMessageList.add(message.getSummary());
		}
		Opportunity thisOpportunity = [select Litle_Mid__c, PayFac_Portal_Link__c from Opportunity where Id = :opportunity.Id];	
		System.assertEquals(expectedMessagesList, actualMessageList);	
		System.assertEquals('01100003', thisOpportunity.Litle_Mid__c);
		System.assertEquals(LitleConstants.LITLE_ENV_CERT + '/metaui/payfacPortal/legalEntity/82821536565084223/subMerchant/1100003?pspSubmerchantId=MA', thisOpportunity.PayFac_Portal_Link__c);
		
		LitleRequestResponseLog__c litleRequestResponseLog = [select Account__c, Opportunity__c from LitleRequestResponseLog__c where legalEntityId__c = '82821536565084223'];
		System.assertEquals(opportunity.Id, litleRequestResponseLog.Opportunity__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);
		System.assert(litleMidFormController.getIsLitleMidAvailable());
		Test.stopTest();
    }
    
    static testMethod void testSubmitInOpportunity_ErrorInLegalEntity(){
    	
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
		LitleMidFormController litleMidFormController = new LitleMidFormController();
		SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// insert username and password
    	litleMidFormController.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	litleMidFormController.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	
    	litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(TEN_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(NINE_INTEGERS);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(INTEGER_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(DATE_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(FIFTEEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		//expectedMessagesList.add('Litle Mid has been generated successfully. It will appear on the Litle MID field.');
		expectedMessagesList.add('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.');
		expectedMessagesList.add('You are not authorized to access this resource. Please check your credentials.');
		List<String> actualMessageList = new List<String>();
		for(Apexpages.Message message: Apexpages.getMessages()){
			actualMessageList.add(message.getSummary());
		}
		Opportunity thisOpportunity = [select Litle_Mid__c, PayFac_Portal_Link__c from Opportunity where Id = :opportunity.Id];	
		System.assertEquals(expectedMessagesList, actualMessageList);	
		System.assertEquals('401 : Unauthorized', thisOpportunity.Litle_Mid__c);
		System.assertEquals(null, thisOpportunity.PayFac_Portal_Link__c);
		
		LitleRequestResponseLog__c litleRequestResponseLog = [select Account__c, Opportunity__c from LitleRequestResponseLog__c];
		System.assertEquals(opportunity.Id, litleRequestResponseLog.Opportunity__c);
		System.assertEquals(null, litleRequestResponseLog.Account__c);
		System.assert(!litleMidFormController.getIsLitleMidAvailable());
		Test.stopTest();
    }
    
    static testMethod void testSubmitInAccountLegalEntityRequestManualReview(){
    	Account insertedaccount = new Account(name=ACCOUNT_NAME);
    	insert insertedaccount;
    	ApexPages.currentPage().getParameters().put('accid',insertedaccount.Id);
		LitleMidFormController litleMidFormController = new LitleMidFormController();
		SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// insert username and password
    	litleMidFormController.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	litleMidFormController.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	
    	litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(TEN_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(NINE_INTEGERS);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(INTEGER_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(DATE_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(FIFTEEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityManualReviewResponse(true), null));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		expectedMessagesList.add('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.');
		expectedMessagesList.add('Your request is under Manual Review. The status shall be updated within 2 business days.');
		expectedMessagesList.add('Your KYC Information has been successfully recorded. You can view it by clicking on the \'Litle KYC Information\' button.');
		List<String> actualMessageList = new List<String>();
		for(Apexpages.Message message: Apexpages.getMessages()){
			actualMessageList.add(message.getSummary());
		}
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :insertedaccount.Id];	
		System.assertEquals(expectedMessagesList, actualMessageList);	
		System.assertEquals('20 : Manual Review', thisAccount.Litle_Mid__c);
		System.assertEquals(null, thisAccount.PayFac_Portal_Link__c);
		System.assert(!litleMidFormController.getIsLitleMidAvailable());
		Test.stopTest();
    }
    
    static testMethod void testSubmitInOpportunityLegalEntityRequestManualReview(){
    	
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
		LitleMidFormController litleMidFormController = new LitleMidFormController();
		SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// insert username and password
    	litleMidFormController.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	litleMidFormController.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	
    	litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(TEN_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(NINE_INTEGERS);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(INTEGER_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(DATE_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(FIFTEEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityManualReviewResponse(true), null));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		expectedMessagesList.add('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.');
		expectedMessagesList.add('Your request is under Manual Review. The status shall be updated within 2 business days.');
		expectedMessagesList.add('Your KYC Information has been successfully recorded. You can view it by clicking on the \'Litle KYC Information\' button.');
		List<String> actualMessageList = new List<String>();
		for(Apexpages.Message message: Apexpages.getMessages()){
			actualMessageList.add(message.getSummary());
		}
		Opportunity thisOpportunity = [select Litle_Mid__c, PayFac_Portal_Link__c from Opportunity where Id = :opportunity.Id];	
		System.assertEquals(expectedMessagesList, actualMessageList);	
		System.assertEquals('20 : Manual Review', thisOpportunity.Litle_Mid__c);
		System.assertEquals(null, thisOpportunity.PayFac_Portal_Link__c);
		System.assert(!litleMidFormController.getIsLitleMidAvailable());
		Test.stopTest();
    }
    
    static testMethod void testMakeCreateLegalEntityRequest_ApprovedResponse(){
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	//LitleRequestXml LitleRequestXml = new LitleRequestXml(controller.legalEntityModel, controller.subMerchantModel);
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(true), null));
    	//Enter username and password
    	String authorizationHeader = HttpUtil.getBasicAuthorizationHeader(controller.savedMappings.merchantUsername__c,controller.savedMappings.merchantPassword__c);
        Httprequest request = LitleRequestXml.getCreateLegalEntityRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c,controller.legalEntityModel, false, 'CERT');
    	LegalEntityResponse legalEntityResponse = controller.makeCreateLegalEntityRequest(litleRequestResponseLog, request);
        // check request xml in log
    	//check response log status code and message
    	System.assertEquals(String.valueOf(LegalEntityApprovedResponse.STATUS_CODE)
    							, litleRequestResponseLog.createLegalEntityResponseStatusCode__c);
    	System.assertEquals(LegalEntityApprovedResponse.STATUS_MESSAGE , litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);
    	//check legal entity response fields;
    	System.assertEquals(LegalEntityApprovedResponse.TRANSACTION_ID, legalEntityResponse.getTransactionId());
    	System.assertEquals(LegalEntityApprovedResponse.RESPONSE_CODE, legalEntityResponse.getResponseCode());
    	System.assertEquals(LegalEntityApprovedResponse.RESPONSE_DESCRIPTION, legalEntityResponse.getResponseDespcription());
    	System.assertEquals('10 : Approved', controller.litleMid);
    	// check if response code is approved
    	System.assertEquals(LitleConstants.RESPONSE_APPROVED, legalEntityResponse.getResponseCode());
    	// check legal entity id
    	System.assertEquals(LegalEntityApprovedResponse.LEGAL_ENTITY_ID, legalEntityResponse.getLegalEntityId());
    }
    
    
    static testMethod void testMakeCreateLegalEntityRequest_DuplicateResponse(){	
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	//LitleRequestXml LitleRequestXml = new LitleRequestXml(controller.legalEntityModel, controller.subMerchantModel);
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityDuplicateResponse(true), null));
    	litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Httprequest request = LitleRequestXml.getCreateLegalEntityRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c,controller.legalEntityModel, false, 'CERT');
    	
    	LegalEntityResponse legalEntityResponse = controller.makeCreateLegalEntityRequest(litleRequestResponseLog, request);
    	
    	//check response log status code and message
    	System.assertEquals(String.valueOf(LegalEntityDuplicateResponse.STATUS_CODE)
    							, litleRequestResponseLog.createLegalEntityResponseStatusCode__c);
    	System.assertEquals(LegalEntityDuplicateResponse.STATUS_MESSAGE , litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);
    	//check legal entity response fields;
    	System.assertEquals(LegalEntityDuplicateResponse.TRANSACTION_ID, legalEntityResponse.getTransactionId());
    	System.assertEquals('10', legalEntityResponse.getResponseCode());
    	System.assertEquals('Approved', legalEntityResponse.getResponseDespcription());
    	System.assertEquals('10 : Approved', controller.litleMid);
    	System.assertEquals('82821203948912667', legalEntityResponse.getLegalEntityId());
    }
    
    static testMethod void testMakeCreateLegalEntityRequest_FullDuplicateResponse(){	
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	//LitleRequestXml LitleRequestXml = new LitleRequestXml(controller.legalEntityModel, controller.subMerchantModel);
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityFullDupeResponse(true), null));
    	litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Httprequest request = LitleRequestXml.getCreateLegalEntityRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c,controller.legalEntityModel, false, 'CERT');
    	
    	LegalEntityResponse legalEntityResponse = controller.makeCreateLegalEntityRequest(litleRequestResponseLog, request);
    	
    	//check response log status code and message
    	System.assertEquals('201', litleRequestResponseLog.createLegalEntityResponseStatusCode__c);
    	System.assertEquals('Success', litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);
    	//check legal entity response fields;
    	System.assertEquals('82821536674283575', legalEntityResponse.getTransactionId());
    	System.assertEquals('10', legalEntityResponse.getResponseCode());
    	System.assertEquals('Approved', legalEntityResponse.getResponseDespcription());
    	System.assertEquals('10 : Approved', controller.litleMid);
    	System.assertEquals('82821536565084611', legalEntityResponse.getLegalEntityId());
    }
    
    static testMethod void testMakeCreateLegalEntityRequest_ManualReviewResponse(){	
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	//LitleRequestXml LitleRequestXml = new LitleRequestXml(controller.legalEntityModel, controller.subMerchantModel);
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityManualReviewResponse(true), null));
    	litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Httprequest request = LitleRequestXml.getCreateLegalEntityRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c,controller.legalEntityModel, false, 'CERT');
    	
    	LegalEntityResponse legalEntityResponse = controller.makeCreateLegalEntityRequest(litleRequestResponseLog, request);
    	
    	//check response log status code and message
    	System.assertEquals(String.valueOf(LegalEntityManualReviewResponse.STATUS_CODE)
    							, litleRequestResponseLog.createLegalEntityResponseStatusCode__c);
    	System.assertEquals(LegalEntityManualReviewResponse.STATUS_MESSAGE , litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);
    	//check legal entity response fields;
    	System.assertEquals(LegalEntityManualReviewResponse.TRANSACTION_ID, legalEntityResponse.getTransactionId());
    	System.assertEquals(LegalEntityManualReviewResponse.RESPONSE_CODE, legalEntityResponse.getResponseCode());
    	System.assertEquals(LegalEntityManualReviewResponse.RESPONSE_DESCRIPTION, legalEntityResponse.getResponseDespcription());
    	System.assertEquals('20 : Manual Review', controller.litleMid);
    	// check if response code is manual review
    	System.assertEquals(LitleConstants.RESPONSE_MANUAL_REVIEW, legalEntityResponse.getResponseCode());
    	// check legal entity id to be null
    	System.assertEquals(LegalEntityManualReviewResponse.LEGAL_ENTITY_ID, legalEntityResponse.getLegalEntityId());
    }
    
    static testMethod void testMakeCreateLegalEntityRequest_ErrorResponse(){	
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	//LitleRequestXml LitleRequestXml = new LitleRequestXml(controller.legalEntityModel, controller.subMerchantModel);
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LitleErrorResponse(), null));
    	litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Httprequest request = LitleRequestXml.getCreateLegalEntityRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c,controller.legalEntityModel, false, 'CERT');
    	
    	LegalEntityResponse legalEntityResponse = controller.makeCreateLegalEntityRequest(litleRequestResponseLog, request);
		//check response log status code and message
    	System.assertEquals(String.valueOf(LitleErrorResponse.STATUS_CODE)
    							, litleRequestResponseLog.createLegalEntityResponseStatusCode__c);
    	System.assertEquals(LitleErrorResponse.STATUS_MESSAGE , litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);
    	//check legal entity response fields;
    	System.assertEquals(String.valueOf(LitleErrorResponse.STATUS_CODE), legalEntityResponse.getResponseCode());
    	System.assertEquals('Unauthorized', legalEntityResponse.getResponseDespcription());
    	System.assertEquals('401 : Unauthorized', controller.litleMid);
		System.assertEquals(null, legalEntityResponse.getLegalEntityId());
    	
    }
    
    static testMethod void testGenerateResponseDescForErrorResponse(){
    	LitleMidFormController controller = new LitleMidFormController();
    	Httpresponse response = new Httpresponse();
    	String body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
						'<errorResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
						    '<transactionId>82821592641044699</transactionId>'+
						    '<errors>'+
						        '<error>Error of [may not be null] on [annualCreditCardSalesVolume]</error>'+
						    '</errors>'+
						'</errorResponse>';
		response.setBody(body);
		//System.assertEquals('Error of [may not be null] on [annualCreditCardSalesVolume]', controller.generateResponseDescForErrorResponse(response));
		controller.generateErrorMessages(response);
		System.assertEquals(2, Apexpages.getMessages().size());
		System.assertEquals('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.', Apexpages.getMessages().get(0).getSummary());
		System.assertEquals('Error of [may not be null] on [annualCreditCardSalesVolume]', Apexpages.getMessages().get(1).getSummary());
		
		// multiple error response
		String errors = '<error>Error of [may not be null] on [annualCreditCardSalesVolume]</error>'+
						        '<error>Error of [may not be null] on [hasAcceptedCreditCards]</error>'+
						        '<error>Error of [may not be null] on [pciInfo.isExclusiveToPsp]</error>'+
						        '<error>Error of [may not be null] on [pciInfo.isPciComplianceValidated]</error>'+
						        '<error>Error of [must be between 1 and 4] on [pciInfo.pciLevel]</error>'+
						        '<error>Error of [size must be between 1 and 20] on [addressUpdatable.city]</error>'+
						        '<error>Error of [size must be between 1 and 2] on [addressUpdatable.stateProvince]</error>'+
						        '<error>Error of [size must be between 1 and 50] on [pciInfo.qualifiedSecurityAssessor]</error>'+
						        '<error>Error of [size must be between 1 and 50] on [pciInfo.scanningVendor]</error>'+
						        '<error>Error of [size must be between 1 and 5] on [addressUpdatable.postalCode]</error>'+
						        '<error>Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress1]</error>'+
						        '<error>Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress2]</error>';
		body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
						'<errorResponse xmlns="http://psp.litle.com/api/merchant/onboard">'+
						    '<transactionId>82821592641044699</transactionId>'+
						    '<errors>'+
						        errors +
						    '</errors>'+
						'</errorResponse>';
		response.setBody(body);
		
		controller.generateErrorMessages(response);
		System.assertEquals(13, Apexpages.getMessages().size());
		System.assertEquals('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.', Apexpages.getMessages().get(0).getSummary());
		System.assertEquals('Error of [may not be null] on [annualCreditCardSalesVolume]', Apexpages.getMessages().get(1).getSummary());
		System.assertEquals('Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress2]', Apexpages.getMessages().get(12).getSummary());
    	
    }
    
    
    static testMethod void testMakeCreateSubMerchantRequest_ApprovedResponse(){
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(null, new SubMerchantApprovedResponse()));
    	String authorizationHeader = HttpUtil.getBasicAuthorizationHeader(controller.savedMappings.merchantUsername__c,controller.savedMappings.merchantPassword__c);
        Httprequest request = LitleRequestXml.getCreateSubMerchantRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c
		        																					,'123',controller.subMerchantModel, 'CERT');
		controller.makeCreateSubMerchantRequest(litleRequestResponseLog, request, '123');
    	//check log response status code and status message
    	System.assertEquals(String.valueOf(LitleConstants.SUB_MERCHANT_SUCCESS_RESPONSE_CODE), litleRequestResponseLog.createSubMerchantResponseStatusCode__c);
    	System.assertEquals(SubMerchantApprovedResponse.STATUS_MESSAGE , litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);
    	System.assertEquals(SubMerchantApprovedResponse.LITLE_MID, controller.litleMid);
    }
    
    static testMethod void testMakeCreateSubMerchantRequest_PartialDupeResponse(){
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(null, new SubMerchantPartialDupeResponse()));
    	String authorizationHeader = HttpUtil.getBasicAuthorizationHeader(controller.savedMappings.merchantUsername__c,controller.savedMappings.merchantPassword__c);
        Httprequest request = LitleRequestXml.getCreateSubMerchantRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c
		        																					,'123',controller.subMerchantModel, 'CERT');
		controller.makeCreateSubMerchantRequest(litleRequestResponseLog, request, '123');
    	//check log response status code and status message
    	System.assertEquals('201', litleRequestResponseLog.createSubMerchantResponseStatusCode__c);
    	System.assertEquals('Success' , litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);
    	System.assertEquals('01100012', controller.litleMid);
    }
    
    static testMethod void testMakeCreateSubMerchantRequest_FullDupeResponse(){
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(null, new SubMerchantFullDupeResponse()));
    	String authorizationHeader = HttpUtil.getBasicAuthorizationHeader(controller.savedMappings.merchantUsername__c,controller.savedMappings.merchantPassword__c);
        Httprequest request = LitleRequestXml.getCreateSubMerchantRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c
		        																					,'123',controller.subMerchantModel, 'CERT');
		controller.makeCreateSubMerchantRequest(litleRequestResponseLog, request, '123');
    	//check log response status code and status message
    	System.assertEquals('201', litleRequestResponseLog.createSubMerchantResponseStatusCode__c);
    	System.assertEquals('Success' , litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);
    	System.assertEquals('01100004', controller.litleMid);
    }
    
    static testMethod void testMakeCreateSubMerchantRequest_ErrorResponse(){
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Httprequest request = LitleRequestXml.getCreateSubMerchantRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c
		        																					,'123',controller.subMerchantModel, 'CERT');
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(null, new SubMerchantErrorResponse()));
    	litleRequestResponseLog = new LitleRequestResponseLog__c();
    	controller.makeCreateSubMerchantRequest(litleRequestResponseLog, request, '123');
    	//check log response status code and status message
    	System.assertEquals(String.valueOf(SubMerchantErrorResponse.STATUS_CODE), litleRequestResponseLog.createSubMerchantResponseStatusCode__c);
    	System.assertEquals(SubMerchantErrorResponse.STATUS_MESSAGE , litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);
    	System.assertEquals(String.valueOf(SubMerchantErrorResponse.STATUS_CODE) + ' : '+
    	SubMerchantErrorResponse.STATUS_MESSAGE, controller.litleMid);
    	
    }
    
    static testMethod void testCancelFromOpportunity(){
    	Apexpages.currentPage().getParameters().put('oppid' , DEFAULT_STRING);
        LitleMidFormController controller = new LitleMidFormController();
        System.assertEquals('/'+DEFAULT_STRING, controller.cancel().getUrl());
    }
    
    static testMethod void testCancelFromAccount(){
    	Apexpages.currentPage().getParameters().put('accid' , DEFAULT_STRING);
        LitleMidFormController controller = new LitleMidFormController();
        System.assertEquals('/'+DEFAULT_STRING, controller.cancel().getUrl());
    }
    
    static testMethod void testCancelFromNietherAccountNorOpportunity(){
    	LitleMidFormController controller = new LitleMidFormController();
    	 System.assertEquals(null, controller.cancel());
    }
    
    
    static testMethod void testOnChangeOpportunityOptions(){
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	litleMidFormController.legalEntityModel.setIsNameFromOpportunity(true);
		litleMidFormController.legalEntityModel.setIsDoingBusinessAsFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setIsStreetAddress1FromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setIsStreetAddress2FromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setIsCityFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setIsStateProvinceFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setIsPostalCodeFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setIsCountryCodeFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setIsFirstNameFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setIsLastNameFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setIsEmailAddressFromOpportunity(true);
		litleMidFormController.legalEntityModel.setIsContactPhoneFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setIsContactPhoneFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setIsDateOfBirthFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setIsDriversLicenseFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setIsDriversLicenseStateFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setIsSsnFromOpportunity(true);
		litleMidFormController.legalEntityModel.setIsTaxIdFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsIsExclusiveToPspFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsIsPciComplianceValidatedFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciLevelFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsScanningVendorFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsQualifiedSecurityAssessorFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsMostRecentlyPassedScanFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsReportOnComplianceFromOpportunity(true);
		litleMidFormController.legalEntityModel.setIsAnnualCreditCardSalesVolumeFromOpportunity(true);
		litleMidFormController.legalEntityModel.setIsHasAcceptedCreditCardsFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().setIsStreetAddress1FromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().setIsStreetAddress2FromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().setIsCityFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().setIsStateProvinceFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().setIsPostalCodeFromOpportunity(true);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().setIsCountryCodeFromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setIsStreetAddress1FromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setIsStreetAddress2FromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setIsCityFromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setIsStateProvinceFromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setIsPostalCodeFromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setIsCountryCodeFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantAmexMidFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantBankAccountNumberFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantBankRoutingNumberFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantCreateCredentialsFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantCustomerServiceNumberFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantDiscoverConveyMidFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantHardCodeBillingDescriptorFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantMaxTransactionAmountFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantMerchantCategoryCodeFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantMerchantNameFromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setIsFirstNameFromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setIsLastNameFromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setIsEmailAddressFromOpportunity(true);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setIsPhoneFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantPspMerchantIdFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchantUrlFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchanteCheckBillingDescriptorFromOpportunity(true);
		litleMidFormController.subMerchantModel.setIsSubMerchanteCheckCompanyNameFromOpportunity(true);
    	// check when selected opportunity id is null
    	System.assertEquals(null, litleMidFormController.onChangeOpportunityOptions());
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	System.assertEquals(null, litleMidFormController.onChangeOpportunityOptions());
    }
    
     static testMethod void makeCreateLegalEntityReqDuplicateResponse(){
     	Account insertedaccount = new Account(name=ACCOUNT_NAME);
    	insert insertedaccount;
    	ApexPages.currentPage().getParameters().put('accid',insertedaccount.Id);
		LitleMidFormController litleMidFormController = new LitleMidFormController();
		SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// insert username and password
    	litleMidFormController.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	litleMidFormController.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	
    	litleMidFormController.legalEntityModel.setLegalEntityName(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityType(STATE);
		litleMidFormController.legalEntityModel.setLegalEntityDoingBusinessAs(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress1(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStreetAddress2(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCity(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setStateProvince(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setCountryCode(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setFirstName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setLastName(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setEmailAddress(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setContactPhone(TEN_INTEGERS);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicense(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setSsn(NINE_INTEGERS);
		litleMidFormController.legalEntityModel.setLegalEntityTaxId(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsExclusiveToPsp(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setIsPciComplianceValidated(BOOLEAN_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setPciLevel(INTEGER_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setScanningVendor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setQualifiedSecurityAssessor(STATE);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setMostRecentlyPassedScan(DATE_STRING);
		litleMidFormController.legalEntityModel.getLegalEntityPci().setReportOnCompliance(DATE_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCity(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setStateProvince(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setCountryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantAmexMid(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantDiscoverConveyMid(FIFTEEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(FIVE_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setFirstName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setLastName(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().setPhone(TEN_INTEGERS);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityDuplicateResponse(true), new SubMerchantApprovedResponse()));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		//expectedMessagesList.add('Litle Mid has been generated successfully. It will appear on the Litle MID field.');
		expectedMessagesList.add('PayFac Username or Password not set in mappings. Please set the credentials in Litle Mapping.');
		expectedMessagesList.add('Your KYC Information has been successfully recorded. You can view it by clicking on the \'Litle KYC Information\' button.');
		List<String> actualMessageList = new List<String>();
		for(Apexpages.Message message: Apexpages.getMessages()){
			actualMessageList.add(message.getSummary());
		}
		Account thisAccount = [select Litle_Mid__c, PayFac_Portal_Link__c from Account where Id = :insertedaccount.Id];	
		System.assertEquals(expectedMessagesList, actualMessageList);	
		System.assertEquals('01100003', thisAccount.Litle_Mid__c);
		System.assertEquals(LitleConstants.LITLE_ENV_CERT + '/metaui/payfacPortal/legalEntity/82821203948912667/subMerchant/1100003?pspSubmerchantId=MA', thisAccount.PayFac_Portal_Link__c);
		Test.stopTest();
     }    
}