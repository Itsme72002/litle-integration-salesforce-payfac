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
	public static final String INTEGER_STRING = '21';
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
		litleMidFormController.subMerchantModel.setSubMerchantStreetAddress1(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantStreetAddress2(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCity(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantStateProvince(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantPostalCode(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCountryCode(LONG_STRING);
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
		litleMidFormController.subMerchantModel.setSubMerchantFirstName(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantLastName(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantEmailAddress(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantPhone(LONG_STRING);
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
		litleMidFormController.legalEntityModel.getLegalEntityPrincipal().setDateOfBirth(BOOLEAN_STRING);
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
		litleMidFormController.subMerchantModel.setSubMerchantStreetAddress1(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantStreetAddress2(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCity(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantStateProvince(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantPostalCode(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantCountryCode(STATE);
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
		litleMidFormController.subMerchantModel.setSubMerchantFirstName(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantLastName(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantEmailAddress(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantPhone(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(STATE);
		litleMidFormController.subMerchantModel.setSubMerchantUrl(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckBillingDescriptor(STATE);
		litleMidFormController.subMerchantModel.setSubMerchanteCheckCompanyName(STATE);
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
		/*litleMidFormController.legalEntityModel.setLegalEntityCity(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityStateProvince(LONG_STRING);
		litleMidFormController.legalEntityModel.setLegalEntityPostalCode(LONG_STRING);*/
		
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
		litleMidFormController.subMerchantModel.setSubMerchantCountryCode(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantBankAccountNumber(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantBankRoutingNumber(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantCustomerServiceNumber(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantHardCodeBillingDescriptor(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantMaxTransactionAmount(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantCategoryCode(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantMerchantName(LONG_STRING);
		litleMidFormController.subMerchantModel.setSubMerchantPspMerchantId(LONG_STRING);
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
    
    /*static testMethod void testOnChangeLegalEntityType(){
    	
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	// Ssn is enabled when entity type is sole proprietorship
    	litleMidFormController.legalEntityModel.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name());
    	litleMidFormController.onChangeLegalEntityType();
    	System.assertEquals(false, litleMidFormController.isTaxDisplayed);
    	// tax id should be enabled when entity type is not sole proprietorship
    	litleMidFormController.legalEntityModel.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.LIMITED_LIABILITY_COMPANY.name());
    	litleMidFormController.onChangeLegalEntityType();
    	System.assertEquals(true, litleMidFormController.isTaxDisplayed);
    }*/
    
    // test legal entity name 
    static testMethod void testPopulateLEName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityNameX__c = true;
    	mappingObject.legalEntityName__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityNameX__c = false;
    	mappingObject.legalEntityNameD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityDoingBusinessAs());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityDoingBusinessAsX__c = false;
    	mappingObject.legalEntityDoingBusinessAsD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress1());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityStreetAddress1X__c = false;
    	mappingObject.legalEntityStreetAddress1D__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStreetAddress2());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityStreetAddress2X__c = false;
    	mappingObject.legalEntityStreetAddress2D__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCity());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityCityX__c = false;
    	mappingObject.legalEntityCityD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getStateProvince());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityStateProvinceX__c = false;
    	mappingObject.legalEntityStateProvinceD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getPostalCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPostalCodeX__c = false;
    	mappingObject.legalEntityPostalCodeD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCountryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityCountryCodeX__c = false;
    	mappingObject.legalEntityCountryCodeD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAddress().getCountryCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEFirstName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityFirstNameX__c = true;
    	mappingObject.legalEntityFirstName__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getFirstName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityFirstNameX__c = false;
    	mappingObject.legalEntityFirstNameD__c = DEFAULT_STRING;
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
    	mappingObject.legalEntityFirstNameX__c = true;
    	mappingObject.legalEntityFirstName__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getFirstName());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLELastName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityLastNameX__c = true;
    	mappingObject.legalEntityLastName__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getLastName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityLastNameX__c = false;
    	mappingObject.legalEntityLastNameD__c = DEFAULT_STRING;
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
    	mappingObject.legalEntityLastNameX__c = true;
    	mappingObject.legalEntityLastName__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getLastName());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEEmailAddress(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityEmailAddressX__c = true;
    	mappingObject.legalEntityEmailAddress__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityEmailAddressX__c = false;
    	mappingObject.legalEntityEmailAddressD__c = DEFAULT_STRING;
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
    	mappingObject.legalEntityEmailAddressX__c = true;
    	mappingObject.legalEntityEmailAddress__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getEmailAddress());
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getContactPhone());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityContactPhoneX__c = false;
    	mappingObject.legalEntityContactPhoneD__c = DEFAULT_STRING;
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
    	mappingObject.legalEntityContactPhoneX__c = true;
    	mappingObject.legalEntityContactPhone__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getContactPhone());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEDateOfBirth(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityDateOfBirthX__c = true;
    	mappingObject.legalEntityDateOfBirth__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityDateOfBirthX__c = false;
    	mappingObject.legalEntityDateOfBirthD__c = DEFAULT_STRING;
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
    	mappingObject.legalEntityDateOfBirthX__c = true;
    	mappingObject.legalEntityDateOfBirth__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDateOfBirth());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEDriversLicense(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityDriversLicenseX__c = true;
    	mappingObject.legalEntityDriversLicense__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityDriversLicenseX__c = false;
    	mappingObject.legalEntityDriversLicenseD__c = DEFAULT_STRING;
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
    	mappingObject.legalEntityDriversLicenseX__c = true;
    	mappingObject.legalEntityDriversLicense__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicense());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEDriversLicenseState(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityDriversLicenseStateX__c = true;
    	mappingObject.legalEntityDriversLicenseState__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityDriversLicenseStateX__c = false;
    	mappingObject.legalEntityDriversLicenseStateD__c = DEFAULT_STRING;
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
    	mappingObject.legalEntityDriversLicenseStateX__c = true;
    	mappingObject.legalEntityDriversLicenseState__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getDriversLicenseState());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLESsn(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntitySsnX__c = true;
    	mappingObject.legalEntitySsn__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPrincipal().getSsn());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntitySsnX__c = false;
    	mappingObject.legalEntitySsnD__c = DEFAULT_STRING;
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
    	mappingObject.legalEntitySsnX__c = true;
    	mappingObject.legalEntitySsn__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityTaxId());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityTaxIdX__c = false;
    	mappingObject.legalEntityTaxIdD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityTaxId());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEIsExclusiveToPsp(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityIsExclusiveToPspX__c = true;
    	mappingObject.legalEntityIsExclusiveToPsp__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsExclusiveToPsp());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityIsExclusiveToPspX__c = false;
    	mappingObject.legalEntityIsExclusiveToPspD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getIsPciComplianceValidated());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityIsPciComplianceValidatedX__c = false;
    	mappingObject.legalEntityIsPciComplianceValidatedD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getPciLevel());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPciLevelX__c = false;
    	mappingObject.legalEntityPciLevelD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
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
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getScanningVendor());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityScanningVendorX__c = false;
    	mappingObject.legalEntityScanningVendorD__c = DEFAULT_STRING;
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
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getScanningVendor());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEQualifiedSecurityAssessor(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityQualifiedSecurityAssessorX__c = true;
    	mappingObject.legalEntityQualifiedSecurityAssessor__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getQualifiedSecurityAssessor());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityQualifiedSecurityAssessorX__c = false;
    	mappingObject.legalEntityQualifiedSecurityAssessorD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPci().getQualifiedSecurityAssessor());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityQualifiedSecurityAssessorX__c = true;
    	mappingObject.legalEntityQualifiedSecurityAssessor__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getQualifiedSecurityAssessor());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEMostRecentlyPassedScan(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityMostRecentlyPassedScanX__c = true;
    	mappingObject.legalEntityMostRecentlyPassedScan__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getMostRecentlyPassedScan());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityMostRecentlyPassedScanX__c = false;
    	mappingObject.legalEntityMostRecentlyPassedScanD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPci().getMostRecentlyPassedScan());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityMostRecentlyPassedScanX__c = true;
    	mappingObject.legalEntityMostRecentlyPassedScan__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getMostRecentlyPassedScan());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEReportOnCompliance(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityReportOnComplianceX__c = true;
    	mappingObject.legalEntityReportOnCompliance__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getReportOnCompliance());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityReportOnComplianceX__c = false;
    	mappingObject.legalEntityReportOnComplianceD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityPci().getReportOnCompliance());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityReportOnComplianceX__c = true;
    	mappingObject.legalEntityReportOnCompliance__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityPci().getReportOnCompliance());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEAnnualCreditCardSalesVolume(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeX__c = true;
    	mappingObject.legalEntityAnnualCreditCardSalesVolume__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeX__c = false;
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeX__c = true;
    	mappingObject.legalEntityAnnualCreditCardSalesVolume__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEHasAcceptedCreditCards(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityHasAcceptedCreditCardsX__c = true;
    	mappingObject.legalEntityHasAcceptedCreditCards__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityHasAcceptedCreditCards());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityHasAcceptedCreditCardsX__c = false;
    	mappingObject.legalEntityHasAcceptedCreditCardsD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.legalEntityModel.getLegalEntityHasAcceptedCreditCards());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityHasAcceptedCreditCardsX__c = true;
    	mappingObject.legalEntityHasAcceptedCreditCards__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityHasAcceptedCreditCards());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateSMStreetAddress1(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantStreetAddress1X__c = true;
    	mappingObject.subMerchantStreetAddress1__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantStreetAddress1());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantStreetAddress1X__c = false;
    	mappingObject.subMerchantStreetAddress1D__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantStreetAddress1());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantStreetAddress1X__c = true;
    	mappingObject.subMerchantStreetAddress1__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantStreetAddress1());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateSMStreetAddress2(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantStreetAddress2X__c = true;
    	mappingObject.subMerchantStreetAddress2__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantStreetAddress2());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantStreetAddress2X__c = false;
    	mappingObject.subMerchantStreetAddress2D__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantStreetAddress2());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantStreetAddress2X__c = true;
    	mappingObject.subMerchantStreetAddress2__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantStreetAddress2());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateSMCity(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCityX__c = true;
    	mappingObject.subMerchantCity__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantCity());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCityX__c = false;
    	mappingObject.subMerchantCityD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantCity());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCityX__c = true;
    	mappingObject.subMerchantCity__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantCity());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateSMStateProvince(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantStateProvinceX__c = true;
    	mappingObject.subMerchantStateProvince__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantStateProvince());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantStateProvinceX__c = false;
    	mappingObject.subMerchantStateProvinceD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantStateProvince());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantStateProvinceX__c = true;
    	mappingObject.subMerchantStateProvince__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantStateProvince());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateSMPostalCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantPostalCodeX__c = true;
    	mappingObject.subMerchantPostalCode__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantPostalCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantPostalCodeX__c = false;
    	mappingObject.subMerchantPostalCodeD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantPostalCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantPostalCodeX__c = true;
    	mappingObject.subMerchantPostalCode__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPostalCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateSMCountryCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCountryCodeX__c = true;
    	mappingObject.subMerchantCountryCode__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantCountryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCountryCodeX__c = false;
    	mappingObject.subMerchantCountryCodeD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantCountryCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCountryCodeX__c = true;
    	mappingObject.subMerchantCountryCode__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantCountryCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateSMAmexMid(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantAmexMidX__c = true;
    	mappingObject.subMerchantAmexMid__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantAmexMid());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantAmexMidX__c = false;
    	mappingObject.subMerchantAmexMidD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantAmexMid());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantAmexMidX__c = true;
    	mappingObject.subMerchantAmexMid__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAmexMid());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMBankAccountNumber(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantBankAccountNumberX__c = true;
    	mappingObject.subMerchantBankAccountNumber__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantBankAccountNumber());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantBankAccountNumberX__c = false;
    	mappingObject.subMerchantBankAccountNumberD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantBankAccountNumber());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantBankAccountNumberX__c = true;
    	mappingObject.subMerchantBankAccountNumber__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantBankAccountNumber());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMBankRoutingNumber(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantBankRoutingNumberX__c = true;
    	mappingObject.subMerchantBankRoutingNumber__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantBankRoutingNumber());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantBankRoutingNumberX__c = false;
    	mappingObject.subMerchantBankRoutingNumberD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantBankRoutingNumber());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantBankRoutingNumberX__c = true;
    	mappingObject.subMerchantBankRoutingNumber__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantBankRoutingNumber());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMCreateCredentials(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCreateCredentialsX__c = true;
    	mappingObject.subMerchantCreateCredentials__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantCreateCredentials());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCreateCredentialsX__c = false;
    	mappingObject.subMerchantCreateCredentialsD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantCreateCredentials());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCreateCredentialsX__c = true;
    	mappingObject.subMerchantCreateCredentials__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantCreateCredentials());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMCustomerServiceNumber(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCustomerServiceNumberX__c = true;
    	mappingObject.subMerchantCustomerServiceNumber__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantCustomerServiceNumber());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCustomerServiceNumberX__c = false;
    	mappingObject.subMerchantCustomerServiceNumberD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantCustomerServiceNumber());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCustomerServiceNumberX__c = true;
    	mappingObject.subMerchantCustomerServiceNumber__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantCustomerServiceNumber());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMDiscoverConveyMid(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantDiscoverConveyMidX__c = true;
    	mappingObject.subMerchantDiscoverConveyMid__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantDiscoverConveyMid());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantDiscoverConveyMidX__c = false;
    	mappingObject.subMerchantDiscoverConveyMidD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantDiscoverConveyMid());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantDiscoverConveyMidX__c = true;
    	mappingObject.subMerchantDiscoverConveyMid__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantDiscoverConveyMid());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMHardCodeBillingDescriptor(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantHardCodeBillingDescriptorX__c = true;
    	mappingObject.subMerchantHardCodeBillingDescriptor__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantHardCodeBillingDescriptorX__c = false;
    	mappingObject.subMerchantHardCodeBillingDescD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantHardCodeBillingDescriptorX__c = true;
    	mappingObject.subMerchantHardCodeBillingDescriptor__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMMaxTransactionAmount(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantMaxTransactionAmountX__c = true;
    	mappingObject.subMerchantMaxTransactionAmount__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantMaxTransactionAmount());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantMaxTransactionAmountX__c = false;
    	mappingObject.subMerchantMaxTransactionAmountD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantMaxTransactionAmount());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantMaxTransactionAmountX__c = true;
    	mappingObject.subMerchantMaxTransactionAmount__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantMaxTransactionAmount());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMMerchantCategoryCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantMerchantCategoryCodeX__c = true;
    	mappingObject.subMerchantMerchantCategoryCode__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantMerchantCategoryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantMerchantCategoryCodeX__c = false;
    	mappingObject.subMerchantMerchantCategoryCodeD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantMerchantCategoryCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantMerchantCategoryCodeX__c = true;
    	mappingObject.subMerchantMerchantCategoryCode__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantMerchantCategoryCode());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMMerchantName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantMerchantNameX__c = true;
    	mappingObject.subMerchantMerchantName__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantMerchantName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantMerchantNameX__c = false;
    	mappingObject.subMerchantMerchantNameD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantMerchantName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantMerchantNameX__c = true;
    	mappingObject.subMerchantMerchantName__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantMerchantName());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMFirstName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantFirstNameX__c = true;
    	mappingObject.subMerchantFirstName__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantFirstName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantFirstNameX__c = false;
    	mappingObject.subMerchantFirstNameD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantFirstName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantFirstNameX__c = true;
    	mappingObject.subMerchantFirstName__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantFirstName());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMLastName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantLastNameX__c = true;
    	mappingObject.subMerchantLastName__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantLastName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantLastNameX__c = false;
    	mappingObject.subMerchantLastNameD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantLastName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantLastNameX__c = true;
    	mappingObject.subMerchantLastName__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantLastName());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMEmailAddress(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantEmailAddressX__c = true;
    	mappingObject.subMerchantEmailAddress__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantEmailAddress());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantEmailAddressX__c = false;
    	mappingObject.subMerchantEmailAddressD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantEmailAddress());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantEmailAddressX__c = true;
    	mappingObject.subMerchantEmailAddress__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantEmailAddress());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMPhone(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantPhoneX__c = true;
    	mappingObject.subMerchantPhone__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantPhone());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantPhoneX__c = false;
    	mappingObject.subMerchantPhoneD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantPhone());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantPhoneX__c = true;
    	mappingObject.subMerchantPhone__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPhone());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMPspMerchantId(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantPspMerchantIdX__c = true;
    	mappingObject.subMerchantPspMerchantId__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantPspMerchantId());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantPspMerchantIdX__c = false;
    	mappingObject.subMerchantPspMerchantIdD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantPspMerchantId());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantPspMerchantIdX__c = true;
    	mappingObject.subMerchantPspMerchantId__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPspMerchantId());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMUrl(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantUrlX__c = true;
    	mappingObject.subMerchantUrl__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantUrl());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantUrlX__c = false;
    	mappingObject.subMerchantUrlD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantUrl());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantUrlX__c = true;
    	mappingObject.subMerchantUrl__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantUrl());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMeCheckBillingDescriptor(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchanteCheckBillingDescriptorX__c = true;
    	mappingObject.subMerchanteCheckBillingDescriptor__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchanteCheckBillingDescriptor());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchanteCheckBillingDescriptorX__c = false;
    	mappingObject.subMerchanteCheckBillingDescD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchanteCheckBillingDescriptor());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchanteCheckBillingDescriptorX__c = true;
    	mappingObject.subMerchanteCheckBillingDescriptor__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchanteCheckBillingDescriptor());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateSMeCheckCompanyName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchanteCheckCompanyNameX__c = true;
    	mappingObject.subMerchanteCheckCompanyName__c = 'Account.Name';
    	insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchanteCheckCompanyName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchanteCheckCompanyNameX__c = false;
    	mappingObject.subMerchanteCheckCompanyNameD__c = DEFAULT_STRING;
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchanteCheckCompanyName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchanteCheckCompanyNameX__c = true;
    	mappingObject.subMerchanteCheckCompanyName__c = 'Opportunity.Name';
    	insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchanteCheckCompanyName());
    	delete mappingObject;
    }
    
}