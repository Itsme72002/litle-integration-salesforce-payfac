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
private class LitleFormControllerTest2 {
	public static final String LONG_STRING = 'Lopado­­temacho­­selacho­­galeo­­kranio­­leipsano­­drim­­hypo­­trimmato­­silphio­­parao­­melito­­katakechy­­meno­­kichl­­epi­­kossypho­­phatto­­perister­­alektryon­­opte­­kephallio­­kigklo­­peleio­­lagoio­­siraio­­baphe­­tragano­­pterygon';
	public static final String STATE = 'MA';
	public static final String DATE_STRING = '2013-06-01';
	public static final String BOOLEAN_STRING = 'true';
	public static final String INTEGER_STRING = '2';
	public static final String ACCOUNT_NAME = 'Test Account';
	public static final String OPPORTUNITY_NAME = 'Test Opportunity';
	public static final String DEFAULT_STRING = 'Default String';
	public static final Date DEFAULT_DATE = Date.today();

    static testMethod void testConstructor(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE, AccountId = account.id);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(account.id, litleMidFormController.urlAccountId);
    	// bad opp id
    	ApexPages.currentPage().getParameters().put('oppid','123');
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(null, litleMidFormController.urlAccountId);
    }
    
    static testMethod void testPopulateLEAnnualCreditCardSalesVolume(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeX__c = true;
    	mappingObject.legalEntityAnnualCreditCardSalesVolume__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeX__c = false;
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEAnnualCreditCardSalesVolume();
    	System.assert(litleMidFormController.legalEntityModel.getIsAnnualCreditCardSalesVolumeFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.legalEntityModel.getLegalEntityHasAcceptedCreditCards());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityHasAcceptedCreditCardsX__c = false;
    	mappingObject.legalEntityHasAcceptedCreditCardsD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.legalEntityModel.getLegalEntityHasAcceptedCreditCards());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateLEHasAcceptedCreditCards();
    	System.assert(litleMidFormController.legalEntityModel.getIsHasAcceptedCreditCardsFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStreetAddress1());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantStreetAddress1X__c = false;
    	mappingObject.subMerchantStreetAddress1D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStreetAddress1());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantStreetAddress1X__c = true;
    	mappingObject.subMerchantStreetAddress1__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStreetAddress1());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMStreetAddress1();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantAddress().getIsStreetAddress1FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStreetAddress1());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStreetAddress2());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantStreetAddress2X__c = false;
    	mappingObject.subMerchantStreetAddress2D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStreetAddress2());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantStreetAddress2X__c = true;
    	mappingObject.subMerchantStreetAddress2__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStreetAddress2());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMStreetAddress2();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantAddress().getIsStreetAddress2FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStreetAddress2());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getCity());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCityX__c = false;
    	mappingObject.subMerchantCityD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantAddress().getCity());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCityX__c = true;
    	mappingObject.subMerchantCity__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getCity());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMCity();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantAddress().getIsCityFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getCity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStateProvince());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantStateProvinceX__c = false;
    	mappingObject.subMerchantStateProvinceD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStateProvince());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantStateProvinceX__c = true;
    	mappingObject.subMerchantStateProvince__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStateProvince());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMStateProvince();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantAddress().getIsStateProvinceFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getStateProvince());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getPostalCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantPostalCodeX__c = false;
    	mappingObject.subMerchantPostalCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantAddress().getPostalCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantPostalCodeX__c = true;
    	mappingObject.subMerchantPostalCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getPostalCode());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMPostalCode();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantAddress().getIsPostalCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getPostalCode());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getCountryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCountryCodeX__c = false;
    	mappingObject.subMerchantCountryCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantAddress().getCountryCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantCountryCodeX__c = true;
    	mappingObject.subMerchantCountryCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getCountryCode());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMCountryCode();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantAddress().getIsCountryCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAddress().getCountryCode());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantAmexMid());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantAmexMidX__c = false;
    	mappingObject.subMerchantAmexMidD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantAmexMid());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMAmexMid();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantAmexMidFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantBankAccountNumber());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantBankAccountNumberX__c = false;
    	mappingObject.subMerchantBankAccountNumberD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantBankAccountNumber());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMBankAccountNumber();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantBankAccountNumberFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantBankRoutingNumber());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantBankRoutingNumberX__c = false;
    	mappingObject.subMerchantBankRoutingNumberD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantBankRoutingNumber());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMBankRoutingNumber();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantBankRoutingNumberFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantCreateCredentials());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCreateCredentialsX__c = false;
    	mappingObject.subMerchantCreateCredentialsD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantCreateCredentials());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMCreateCredentials();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantCreateCredentialsFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantCustomerServiceNumber());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCustomerServiceNumberX__c = false;
    	mappingObject.subMerchantCustomerServiceNumberD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantCustomerServiceNumber());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMCustomerServiceNumber();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantCustomerServiceNumberFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantDiscoverConveyMid());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantDiscoverConveyMidX__c = false;
    	mappingObject.subMerchantDiscoverConveyMidD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantDiscoverConveyMid());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMDiscoverConveyMid();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantDiscoverConveyMidFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantHardCodeBillingDescriptorX__c = false;
    	mappingObject.subMerchantHardCodeBillingDescD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantHardCodeBillingDescriptor());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMHardCodeBillingDescriptor();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantHardCodeBillingDescriptorFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantMaxTransactionAmount());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantMaxTransactionAmountX__c = false;
    	mappingObject.subMerchantMaxTransactionAmountD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantMaxTransactionAmount());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMMaxTransactionAmount();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantMaxTransactionAmountFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantMerchantCategoryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantMerchantCategoryCodeX__c = false;
    	mappingObject.subMerchantMerchantCategoryCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantMerchantCategoryCode());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMMerchantCategoryCode();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantMerchantCategoryCodeFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantMerchantName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantMerchantNameX__c = false;
    	mappingObject.subMerchantMerchantNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantMerchantName());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMMerchantName();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantMerchantNameFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getFirstName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantFirstNameX__c = false;
    	mappingObject.subMerchantFirstNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getFirstName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantFirstNameX__c = true;
    	mappingObject.subMerchantFirstName__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getFirstName());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMFirstName();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getIsFirstNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getFirstName());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getLastName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantLastNameX__c = false;
    	mappingObject.subMerchantLastNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getLastName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantLastNameX__c = true;
    	mappingObject.subMerchantLastName__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getLastName());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMLastName();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getIsLastNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getLastName());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantEmailAddressX__c = false;
    	mappingObject.subMerchantEmailAddressD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantEmailAddressX__c = true;
    	mappingObject.subMerchantEmailAddress__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMEmailAddress();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getIsEmailAddressFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getEmailAddress());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getPhone());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantPhoneX__c = false;
    	mappingObject.subMerchantPhoneD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(DEFAULT_STRING, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getPhone());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	ApexPages.currentPage().getParameters().put('oppid',opportunity.Id);
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.subMerchantPhoneX__c = true;
    	mappingObject.subMerchantPhone__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getPhone());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMPhone();
    	System.assert(litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getIsPhoneFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPrimaryContact().getPhone());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantPspMerchantId());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantPspMerchantIdX__c = false;
    	mappingObject.subMerchantPspMerchantIdD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantPspMerchantId());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMPspMerchantId();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantPspMerchantIdFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchantUrl());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantUrlX__c = false;
    	mappingObject.subMerchantUrlD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchantUrl());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMUrl();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchantUrlFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchanteCheckBillingDescriptor());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchanteCheckBillingDescriptorX__c = false;
    	mappingObject.subMerchanteCheckBillingDescD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchanteCheckBillingDescriptor());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMeCheckBillingDescriptor();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchanteCheckBillingDescriptorFromOpportunity());
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LitleMidFormController litleMidFormController = new LitleMidFormController();
    	System.assertEquals(ACCOUNT_NAME, litleMidFormController.subMerchantModel.getSubMerchanteCheckCompanyName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchanteCheckCompanyNameX__c = false;
    	mappingObject.subMerchanteCheckCompanyNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
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
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	litleMidFormController = new LitleMidFormController();
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchanteCheckCompanyName());
    	
    	// check as if initiated from account page
    	ApexPages.currentPage().getParameters().put('accid',account.Id);
    	ApexPages.currentPage().getParameters().put('oppid','');
    	litleMidFormController = new LitleMidFormController();
    	litleMidFormController.selectedOpportunityId = opportunity.Id;
    	litleMidFormController.populateSMeCheckCompanyName();
    	System.assert(litleMidFormController.subMerchantModel.getIsSubMerchanteCheckCompanyNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, litleMidFormController.subMerchantModel.getSubMerchanteCheckCompanyName());
    	delete mappingObject;
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
		System.assertEquals(null, opportunity.Litle_Mid__c);
		System.assertEquals(null, opportunity.PayFac_Portal_Link__c);
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
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(), new SubMerchantApprovedResponse()));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		expectedMessagesList.add('Litle Mid has been generated successfully. It will appear on the Litle MID field.');
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
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(), new SubMerchantApprovedResponse()));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		expectedMessagesList.add('Litle Mid has been generated successfully. It will appear on the Litle MID field.');
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
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityManualReviewResponse(), null));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
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
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityManualReviewResponse(), null));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
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
		Test.stopTest();
    }
    
    static testMethod void testMakeCreateLegalEntityRequest_ApprovedResponse(){
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	//LitleRequestXml LitleRequestXml = new LitleRequestXml(controller.legalEntityModel, controller.subMerchantModel);
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityApprovedResponse(), null));
    	//Enter username and password
    	String authorizationHeader = HttpUtil.getBasicAuthorizationHeader(controller.savedMappings.merchantUsername__c,controller.savedMappings.merchantPassword__c);
        Httprequest request = LitleRequestXml.getCreateLegalEntityRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c,controller.legalEntityModel, false, 'CERT');
    	LegalEntityResponse legalEntityResponse = controller.makeCreateLegalEntityRequest(litleRequestResponseLog, request);
        // check request xml in log
    	//check response log status code and message
    	System.assertEquals(String.valueOf(MockCreateLegalEntityApprovedResponse.STATUS_CODE)
    							, litleRequestResponseLog.createLegalEntityResponseStatusCode__c);
    	System.assertEquals(MockCreateLegalEntityApprovedResponse.STATUS_MESSAGE , litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);
    	//check legal entity response fields;
    	System.assertEquals(MockCreateLegalEntityApprovedResponse.TRANSACTION_ID, legalEntityResponse.getTransactionId());
    	System.assertEquals(MockCreateLegalEntityApprovedResponse.RESPONSE_CODE, legalEntityResponse.getResponseCode());
    	System.assertEquals(MockCreateLegalEntityApprovedResponse.RESPONSE_DESCRIPTION, legalEntityResponse.getResponseDespcription());
    	System.assertEquals('10 : Approved', controller.litleMid);
    	// check if response code is approved
    	System.assertEquals(LitleConstants.RESPONSE_APPROVED, legalEntityResponse.getResponseCode());
    	// check legal entity id
    	System.assertEquals(MockCreateLegalEntityApprovedResponse.LEGAL_ENTITY_ID, legalEntityResponse.getLegalEntityId());
    }
    
    
    static testMethod void testMakeCreateLegalEntityRequest_DuplicateResponse(){	
    	LitleMidFormController controller = new LitleMidFormController();
    	controller.savedMappings.merchantUsername__c = DEFAULT_STRING;
    	controller.savedMappings.merchantPassword__c = DEFAULT_STRING;
    	//LitleRequestXml LitleRequestXml = new LitleRequestXml(controller.legalEntityModel, controller.subMerchantModel);
    	LitleRequestResponseLog__c litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityDuplicateResponse(), null));
    	litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Httprequest request = LitleRequestXml.getCreateLegalEntityRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c,controller.legalEntityModel, false, 'CERT');
    	
    	LegalEntityResponse legalEntityResponse = controller.makeCreateLegalEntityRequest(litleRequestResponseLog, request);
    	
    	//check response log status code and message
    	System.assertEquals(String.valueOf(MockCreateLegalEntityDuplicateResponse.STATUS_CODE)
    							, litleRequestResponseLog.createLegalEntityResponseStatusCode__c);
    	System.assertEquals(MockCreateLegalEntityDuplicateResponse.STATUS_MESSAGE , litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);
    	//check legal entity response fields;
    	System.assertEquals(MockCreateLegalEntityDuplicateResponse.TRANSACTION_ID, legalEntityResponse.getTransactionId());
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
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityFullDupeResponse(), null));
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
    	Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityManualReviewResponse(), null));
    	litleRequestResponseLog = new LitleRequestResponseLog__c();
    	Httprequest request = LitleRequestXml.getCreateLegalEntityRequest(controller.savedMappings.merchantUsername__c, controller.savedMappings.merchantPassword__c,controller.legalEntityModel, false, 'CERT');
    	
    	LegalEntityResponse legalEntityResponse = controller.makeCreateLegalEntityRequest(litleRequestResponseLog, request);
    	
    	//check response log status code and message
    	System.assertEquals(String.valueOf(MockCreateLEManualReviewResponse.STATUS_CODE)
    							, litleRequestResponseLog.createLegalEntityResponseStatusCode__c);
    	System.assertEquals(MockCreateLEManualReviewResponse.STATUS_MESSAGE , litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);
    	//check legal entity response fields;
    	System.assertEquals(MockCreateLEManualReviewResponse.TRANSACTION_ID, legalEntityResponse.getTransactionId());
    	System.assertEquals(MockCreateLEManualReviewResponse.RESPONSE_CODE, legalEntityResponse.getResponseCode());
    	System.assertEquals(MockCreateLEManualReviewResponse.RESPONSE_DESCRIPTION, legalEntityResponse.getResponseDespcription());
    	System.assertEquals('20 : Manual Review', controller.litleMid);
    	// check if response code is manual review
    	System.assertEquals(LitleConstants.RESPONSE_MANUAL_REVIEW, legalEntityResponse.getResponseCode());
    	// check legal entity id to be null
    	System.assertEquals(MockCreateLEManualReviewResponse.LEGAL_ENTITY_ID, legalEntityResponse.getLegalEntityId());
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
    	System.assertEquals(String.valueOf(MockCreateLEErrorResponse.STATUS_CODE)
    							, litleRequestResponseLog.createLegalEntityResponseStatusCode__c);
    	System.assertEquals(MockCreateLEErrorResponse.STATUS_MESSAGE , litleRequestResponseLog.createLegalEntityResponseStatusMessage__c);
    	//check legal entity response fields;
    	System.assertEquals(String.valueOf(MockCreateLEErrorResponse.STATUS_CODE), legalEntityResponse.getResponseCode());
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
		System.assertEquals(1, Apexpages.getMessages().size());
		System.assertEquals('Error of [may not be null] on [annualCreditCardSalesVolume]', Apexpages.getMessages().get(0).getSummary());
		
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
		System.assertEquals(12, Apexpages.getMessages().size());
		System.assertEquals('Error of [may not be null] on [annualCreditCardSalesVolume]', Apexpages.getMessages().get(0).getSummary());
		System.assertEquals('Error of [size must be between 1 and 60] on [addressUpdatable.streetAddress2]', Apexpages.getMessages().get(11).getSummary());
    	
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
    	System.assertEquals(MockCreateSMSuccess.STATUS_MESSAGE , litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);
    	System.assertEquals(MockCreateSMSuccess.LITLE_MID, controller.litleMid);
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
    	System.assertEquals(String.valueOf(MockCreateSMErrorResponse.STATUS_CODE), litleRequestResponseLog.createSubMerchantResponseStatusCode__c);
    	System.assertEquals(MockCreateSMErrorResponse.STATUS_MESSAGE , litleRequestResponseLog.createSubMerchantResponseStatusMessage__c);
    	System.assertEquals(String.valueOf(MockCreateSMErrorResponse.STATUS_CODE) + ' : '+
    	MockCreateSMErrorResponse.STATUS_MESSAGE, controller.litleMid);
    	
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
		Test.startTest();
		
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(new LegalEntityDuplicateResponse(), new SubMerchantApprovedResponse()));
		litleMidFormController.submit();
		List<String> expectedMessagesList = new List<String>();
		expectedMessagesList.add('Litle Mid has been generated successfully. It will appear on the Litle MID field.');
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