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
		litleMidFormController.subMerchantModel.getSubMerchantAddress().setPostalCode(LONG_STRING);
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
		litleMidFormController.legalEntityModel.getLegalEntityAddress().setPostalCode(LONG_STRING);
		System.assertEquals(true, litleMidFormController.areRequiredFieldsFilled());
    }
    
    
    // test legal entity name 
    static testMethod void testPopulateLEName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityNameX__c = true;
    	mappingObject.legalEntityName__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityNameX__c = false;
    	mappingObject.legalEntityNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityNameX__c = true;
    	mappingObject.legalEntityName__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityName());
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEName();
    	System.assert(litleMidFormController.legalEntityModel.getIsNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityName());
    	delete mappingObject;
    }
    
    // test legal entity's doing business as 
    static testMethod void testPopulateLEDoingBusinessAs(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityDoingBusinessAsX__c = true;
    	mappingObject.legalEntityDoingBusinessAs__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityDoingBusinessAs());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityDoingBusinessAsX__c = false;
    	mappingObject.legalEntityDoingBusinessAsD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityDoingBusinessAs());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityDoingBusinessAsX__c = true;
    	mappingObject.legalEntityDoingBusinessAs__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityDoingBusinessAs());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEDoingBusinessAs();
    	System.assert(litleMidFormController.legalEntityModel.getIsDoingBusinessAsFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityDoingBusinessAs());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateLEStreetAddress1(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStreetAddress1X__c = true;
    	mappingObject.legalEntityStreetAddress1__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress1());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityStreetAddress1X__c = false;
    	mappingObject.legalEntityStreetAddress1D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress1());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStreetAddress1X__c = true;
    	mappingObject.legalEntityStreetAddress1__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress1());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEAddress1();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityAddress().getIsStreetAddress1FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress1());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEStreetAddress2(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStreetAddress2X__c = true;
    	mappingObject.legalEntityStreetAddress2__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress2());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityStreetAddress2X__c = false;
    	mappingObject.legalEntityStreetAddress2D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress2());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStreetAddress2X__c = true;
    	mappingObject.legalEntityStreetAddress2__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress2());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEAddress2();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityAddress().getIsStreetAddress2FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress2());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLECity(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityCityX__c = true;
    	mappingObject.legalEntityCity__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCity());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityCityX__c = false;
    	mappingObject.legalEntityCityD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCity());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityCityX__c = true;
    	mappingObject.legalEntityCity__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCity());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLECity();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityAddress().getIsCityFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCity());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEStateProvince(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStateProvinceX__c = true;
    	mappingObject.legalEntityStateProvince__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStateProvince());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityStateProvinceX__c = false;
    	mappingObject.legalEntityStateProvinceD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStateProvince());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStateProvinceX__c = true;
    	mappingObject.legalEntityStateProvince__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStateProvince());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEStateProvince();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityAddress().getIsStateProvinceFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStateProvince());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPostalCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPostalCodeX__c = true;
    	mappingObject.legalEntityPostalCode__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getPostalCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPostalCodeX__c = false;
    	mappingObject.legalEntityPostalCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityAddress().getPostalCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPostalCodeX__c = true;
    	mappingObject.legalEntityPostalCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getPostalCode());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPostalCode();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityAddress().getIsPostalCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getPostalCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLECountryCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityCountryCodeX__c = true;
    	mappingObject.legalEntityCountryCode__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCountryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityCountryCodeX__c = false;
    	mappingObject.legalEntityCountryCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCountryCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityCountryCodeX__c = true;
    	mappingObject.legalEntityCountryCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCountryCode());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLECountryCode();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityAddress().getIsCountryCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCountryCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEContactPhone(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityContactPhoneX__c = true;
    	mappingObject.legalEntityContactPhone__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityContactPhone());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityContactPhoneX__c = false;
    	mappingObject.legalEntityContactPhoneD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityContactPhone());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityContactPhoneX__c = true;
    	mappingObject.legalEntityContactPhone__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityContactPhone());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEContactPhone();
    	System.assert(litleMidFormController.legalEntityModel.getIsContactPhoneFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityContactPhone());
    	delete mappingObject;
	}
	
    static testMethod void testPopulateLEFirstName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalFirstNameX__c = true;
    	mappingObject.legalEntityPrincipalFirstName__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getFirstName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalFirstNameX__c = false;
    	mappingObject.legalEntityPrincipalFirstNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getFirstName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalFirstNameX__c = true;
    	mappingObject.legalEntityPrincipalFirstName__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getFirstName());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalFirstName();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getIsFirstNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getFirstName());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLELastName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalLastNameX__c = true;
    	mappingObject.legalEntityPrincipalLastName__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getLastName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalLastNameX__c = false;
    	mappingObject.legalEntityPrincipalLastNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getLastName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalLastNameX__c = true;
    	mappingObject.legalEntityPrincipalLastName__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getLastName());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalLastName();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getIsLastNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getLastName());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEEmailAddress(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalEmailAddressX__c = true;
    	mappingObject.legalEntityPrincipalEmailAddress__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalEmailAddressX__c = false;
    	mappingObject.legalEntityPrincipalEmailAddressD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalEmailAddressX__c = true;
    	mappingObject.legalEntityPrincipalEmailAddress__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalEmailAddress();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getIsEmailAddressFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
    	delete mappingObject;
	}
	static testMethod void testPopulateLEPrincipalStreetAddress1(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStreetAddress1X__c = true;
    	mappingObject.legalEntityPrincipalStreetAddress1__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress1());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalStreetAddress1X__c = false;
    	mappingObject.legalEntityPrincipalStreetAddress1D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress1());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStreetAddress1X__c = true;
    	mappingObject.legalEntityPrincipalStreetAddress1__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress1());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalAddress1();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getIsStreetAddress1FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress1());
    	delete mappingObject;
    	
	}
    
    static testMethod void testPopulateLEPrincipalStreetAddress2(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStreetAddress2X__c = true;
    	mappingObject.legalEntityPrincipalStreetAddress2__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress2());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalStreetAddress2X__c = false;
    	mappingObject.legalEntityPrincipalStreetAddress2D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress2());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStreetAddress2X__c = true;
    	mappingObject.legalEntityPrincipalStreetAddress2__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress2());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalAddress2();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getIsStreetAddress2FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStreetAddress2());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalCity(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalCityX__c = true;
    	mappingObject.legalEntityPrincipalCity__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getCity());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalCityX__c = false;
    	mappingObject.legalEntityPrincipalCityD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getCity());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalCityX__c = true;
    	mappingObject.legalEntityPrincipalCity__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getCity());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalCity();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getIsCityFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getCity());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalStateProvince(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStateProvinceX__c = true;
    	mappingObject.legalEntityPrincipalStateProvince__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStateProvince());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalStateProvinceX__c = false;
    	mappingObject.legalEntityPrincipalStateProvinceD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStateProvince());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStateProvinceX__c = true;
    	mappingObject.legalEntityPrincipalStateProvince__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStateProvince());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalStateProvince();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getIsStateProvinceFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getStateProvince());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalPostalCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalPostalCodeX__c = true;
    	mappingObject.legalEntityPrincipalPostalCode__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getPostalCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalPostalCodeX__c = false;
    	mappingObject.legalEntityPrincipalPostalCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getPostalCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalPostalCodeX__c = true;
    	mappingObject.legalEntityPrincipalPostalCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getPostalCode());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalPostalCode();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getIsPostalCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getPostalCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalCountryCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalCountryCodeX__c = true;
    	mappingObject.legalEntityPrincipalCountryCode__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getCountryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalCountryCodeX__c = false;
    	mappingObject.legalEntityPrincipalCountryCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getCountryCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalCountryCodeX__c = true;
    	mappingObject.legalEntityPrincipalCountryCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getCountryCode());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalCountryCode();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getIsCountryCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getAddress().getCountryCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalContactPhone(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalContactPhoneX__c = true;
    	mappingObject.legalEntityPrincipalContactPhone__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getContactPhone());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalContactPhoneX__c = false;
    	mappingObject.legalEntityPrincipalContactPhoneD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getContactPhone());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalContactPhoneX__c = true;
    	mappingObject.legalEntityPrincipalContactPhone__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getContactPhone());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalContactPhone();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getIsContactPhoneFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getContactPhone());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalDateOfBirth(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDateOfBirthX__c = true;
    	mappingObject.legalEntityPrincipalDateOfBirth__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalDateOfBirthX__c = false;
    	mappingObject.legalEntityPrincipalDateOfBirthD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDateOfBirthX__c = true;
    	mappingObject.legalEntityPrincipalDateOfBirth__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalDateOfBirth();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getIsDateOfBirthFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalDriversLicense(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDriversLicenseX__c = true;
    	mappingObject.legalEntityPrincipalDriversLicense__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalDriversLicenseX__c = false;
    	mappingObject.legalEntityPrincipalDriversLicenseD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDriversLicenseX__c = true;
    	mappingObject.legalEntityPrincipalDriversLicense__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalDriversLicense();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getIsDriversLicenseFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalDriversLicenseState(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDriversLicenseStateX__c = true;
    	mappingObject.legalEntityPrincipalDriversLicenseState__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalDriversLicenseStateX__c = false;
    	mappingObject.legalEntityPrincipalDriversLicenseStateD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDriversLicenseStateX__c = true;
    	mappingObject.legalEntityPrincipalDriversLicenseState__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalDriversLicenseState();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getIsDriversLicenseStateFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalSsn(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalSsnX__c = true;
    	mappingObject.legalEntityPrincipalSsn__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getSsn());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalSsnX__c = false;
    	mappingObject.legalEntityPrincipalSsnD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getSsn());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalSsnX__c = true;
    	mappingObject.legalEntityPrincipalSsn__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getSsn());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPrincipalSsn();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getIsSsnFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getSsn());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLETaxId(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityTaxIdX__c = true;
    	mappingObject.legalEntityTaxId__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityTaxId());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityTaxIdX__c = false;
    	mappingObject.legalEntityTaxIdD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityTaxId());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityTaxIdX__c = true;
    	mappingObject.legalEntityTaxId__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityTaxId());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLETaxId();
    	System.assert(litleMidFormController.legalEntityModel.getIsTaxIdFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityTaxId());
    	delete mappingObject;
	}
    
    static testMethod void testLitleMidPopulation(){
    	Account account = new Account(name = ACCOUNT_NAME);
    	account.Litle_Mid__c = '8675309';
    	insert account;
    	
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals('8675309', litleMidFormController.litleMid);
    	
    	delete account;
    	account = new Account(name = ACCOUNT_NAME);
    	insert account;
    	
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
        litleMidFormController = new LitleMidFormController();
        System.assertEquals(null, litleMidFormController.litleMid);
        
        account = new Account(name = ACCOUNT_NAME);
        account.Litle_Mid__C = 'Error: 404, yo';
        insert account;
        
        ApexPages.currentPage().getParameters().put('accid',account.Id);
        litleMidFormController = new LitleMidFormController();
        System.assertEquals(null, litleMidFormController.litleMid);
    }
    
    /*
    static testMethod void testPopulateLEIsExclusiveToPsp(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityIsExclusiveToPspX__c = true;
    	mappingObject.legalEntityIsExclusiveToPsp__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityIsExclusiveToPspX__c = false;
    	mappingObject.legalEntityIsExclusiveToPspD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityIsExclusiveToPspX__c = true;
    	mappingObject.legalEntityIsExclusiveToPsp__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEIsExclusiveToPsp();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPci().getIsIsExclusiveToPspFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEIsPciComplianceValidated(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityIsPciComplianceValidatedX__c = true;
    	mappingObject.legalEntityIsPciComplianceValidated__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityIsPciComplianceValidatedX__c = false;
    	mappingObject.legalEntityIsPciComplianceValidatedD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityIsPciComplianceValidatedX__c = true;
    	mappingObject.legalEntityIsPciComplianceValidated__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEIsPciComplianceValidated();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPci().getIsIsPciComplianceValidatedFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPciLevel(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPciLevelX__c = true;
    	mappingObject.legalEntityPciLevel__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getPciLevel());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPciLevelX__c = false;
    	mappingObject.legalEntityPciLevelD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPci().getPciLevel());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPciLevelX__c = true;
    	mappingObject.legalEntityPciLevel__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getPciLevel());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEPciLevel();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPci().getIsPciLevelFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getPciLevel());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEScanningVendor(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityScanningVendorX__c = true;
    	mappingObject.legalEntityScanningVendor__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getScanningVendor());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityScanningVendorX__c = false;
    	mappingObject.legalEntityScanningVendorD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPci().getScanningVendor());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityScanningVendorX__c = true;
    	mappingObject.legalEntityScanningVendor__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getScanningVendor());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEScanningVendor();
    	System.assert(litleMidFormController.legalEntityModel.getLegalEntityPci().getIsScanningVendorFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getScanningVendor());
    	delete mappingObject;
	}
    
    */
    
    
    
    
    
}