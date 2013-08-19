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
private class LegalEntityModelServiceTest {
	public static final String LONG_STRING = 'Lopado­­temacho­­selacho­­galeo­­kranio­­leipsano­­drim­­hypo­­trimmato­­silphio­­parao­­melito­­katakechy­­meno­­kichl­­epi­­kossypho­­phatto­­perister­­alektryon­­opte­­kephallio­­kigklo­­peleio­­lagoio­­siraio­­baphe­­tragano­­pterygon';
	public static final String STATE = 'MA';
	public static final String DATE_STRING = '2013-06-01';
	public static final String BOOLEAN_STRING = 'true';
	public static final String INTEGER_STRING = '2';
	public static final String ACCOUNT_NAME = 'Test Account';
	public static final String OPPORTUNITY_NAME = 'Test Opportunity';
	public static final String DEFAULT_STRING = 'Default String';
	public static final Date DEFAULT_DATE = Date.today();
	
	/*static testMethod void testIsInputDataValid() {
        // Input all incorrect data
        
        LegalEntityModelService service = new LegalEntityModelService(null, null);
        LegalEntityModel model = new LegalEntityModel();
        model.setLegalEntityName(LONG_STRING);
		model.setLegalEntityType(LONG_STRING);
		model.setLegalEntityDoingBusinessAs(LONG_STRING);
		model.getLegalEntityAddress().setStreetAddress1(LONG_STRING);
		model.getLegalEntityAddress().setStreetAddress2(LONG_STRING);
		model.getLegalEntityAddress().setCity(LONG_STRING);
		model.getLegalEntityAddress().setStateProvince(LONG_STRING);
		model.getLegalEntityAddress().setPostalCode(LONG_STRING);
		model.getLegalEntityAddress().setCountryCode(LONG_STRING);
		model.getLegalEntityPrincipal().setFirstName(LONG_STRING);
		model.getLegalEntityPrincipal().setLastName(LONG_STRING);
		model.getLegalEntityPrincipal().setEmailAddress(LONG_STRING);
		model.getLegalEntityPrincipal().setContactPhone(LONG_STRING);
		model.getLegalEntityPrincipal().setDateOfBirth(LONG_STRING);
		model.getLegalEntityPrincipal().setDriversLicense(LONG_STRING);
		model.getLegalEntityPrincipal().setDriversLicenseState(LONG_STRING);
		model.getLegalEntityPrincipal().setSsn(LONG_STRING);
		model.setLegalEntityTaxId(LONG_STRING);
		model.setLegalEntityAnnualCreditCardSalesVolume(LONG_STRING);
		model.setLegalEntityHasAcceptedCreditCards(LONG_STRING);
		// IsInputDataValid should return false
        System.assertEquals(false, service.isLegalEntityValid(model, false));
        System.assertEquals(0, Apexpages.getMessages().size());
        
        System.assertEquals(false, service.isLegalEntityValid(model, true));
        System.assertEquals(19, Apexpages.getMessages().size());
        
        // Select Individual sole proprietorship as legal entity type
        model.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name());
        // IsInputDataValid should return false
        
        System.assertEquals(false, service.isLegalEntityValid(model, false));
        System.assertEquals(19, Apexpages.getMessages().size());
        System.assertEquals(false, service.isLegalEntityValid(model, true));
        System.assertEquals(19, Apexpages.getMessages().size());
        // Input all correct fields
        model.setLegalEntityName(STATE);
		model.setLegalEntityType(STATE);
		model.setLegalEntityDoingBusinessAs(STATE);
		model.getLegalEntityAddress().setStreetAddress1(STATE);
		model.getLegalEntityAddress().setStreetAddress2(STATE);
		model.getLegalEntityAddress().setCity(STATE);
		model.getLegalEntityAddress().setStateProvince(STATE);
		model.getLegalEntityAddress().setPostalCode(STATE);
		model.getLegalEntityAddress().setCountryCode(STATE);
		model.getLegalEntityPrincipal().setFirstName(STATE);
		model.getLegalEntityPrincipal().setLastName(STATE);
		model.getLegalEntityPrincipal().setEmailAddress(STATE);
		model.getLegalEntityPrincipal().setContactPhone(STATE);
		model.getLegalEntityPrincipal().setDateOfBirth(DATE_STRING);
		model.getLegalEntityPrincipal().setDriversLicense(STATE);
		model.getLegalEntityPrincipal().setDriversLicenseState(STATE);
		model.getLegalEntityPrincipal().setSsn(STATE);
		model.setLegalEntityTaxId(STATE);
		model.setLegalEntityAnnualCreditCardSalesVolume(INTEGER_STRING);
		model.setLegalEntityHasAcceptedCreditCards(BOOLEAN_STRING);
		System.assertEquals(true, service.isLegalEntityValid(model, false));
		System.assertEquals(19, Apexpages.getMessages().size());
		System.assertEquals(true, service.isLegalEntityValid(model, true));
		System.assertEquals(19, Apexpages.getMessages().size());
    }
    
    static testMethod void testAreRequiredFieldsPresent() {
    	
    	LegalEntityModelService service = new LegalEntityModelService(null, null);
    	LegalEntityModel model = new LegalEntityModel();
    	// Initially all fields are null/empty
    	System.assertEquals(false, service.areRequiredFieldsPresent(model, false));
    	System.assertEquals(0, Apexpages.getMessages().size());
    	System.assertEquals(false, service.areRequiredFieldsPresent(model, true));
    	System.assertEquals(8, Apexpages.getMessages().size());
    	model.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name());
    	System.assertEquals(false, service.areRequiredFieldsPresent(model, false));
    	System.assertEquals(8, Apexpages.getMessages().size());
    	System.assertEquals(false, service.areRequiredFieldsPresent(model, true));
    	System.assertEquals(12, Apexpages.getMessages().size());
    	model.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.LIMITED_LIABILITY_COMPANY.name());
    	System.assertEquals(false, service.areRequiredFieldsPresent(model, false));
    	System.assertEquals(12, Apexpages.getMessages().size());
    	System.assertEquals(false, service.areRequiredFieldsPresent(model, true));
    	System.assertEquals(13, Apexpages.getMessages().size());
    	// Set all the required fields for entity type other than sole proprietorship
    	model.setLegalEntityName(LONG_STRING);
		model.setLegalEntityType(LONG_STRING);
		model.getLegalEntityAddress().setStreetAddress1(LONG_STRING);
		
		model.getLegalEntityPrincipal().setFirstName(LONG_STRING);
		model.getLegalEntityPrincipal().setLastName(LONG_STRING);
		model.getLegalEntityAddress().setCountryCode(LONG_STRING);
		model.getLegalEntityPrincipal().setSsn(LONG_STRING);
		model.setLegalEntityTaxId(LONG_STRING);
		model.setLegalEntityAnnualCreditCardSalesVolume(LONG_STRING);
		model.setLegalEntityHasAcceptedCreditCards(LONG_STRING);
		
		System.assertEquals(true, service.areRequiredFieldsPresent(model, false));
		System.assertEquals(13, Apexpages.getMessages().size());
		System.assertEquals(true, service.areRequiredFieldsPresent(model, true));
		System.assertEquals(13, Apexpages.getMessages().size());
		// set the entity type to sole proprietorship
		model.setLegalEntityType(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name());
		System.assertEquals(false, service.areRequiredFieldsPresent(model, false));
		System.assertEquals(13, Apexpages.getMessages().size());
		System.assertEquals(false, service.areRequiredFieldsPresent(model, true));
		System.assertEquals(13, Apexpages.getMessages().size());
		// set the required fields and check
		model.getLegalEntityAddress().setCity(LONG_STRING);
		model.getLegalEntityAddress().setStateProvince(LONG_STRING);
		model.getLegalEntityAddress().setPostalCode(LONG_STRING);
		System.assertEquals(true, service.areRequiredFieldsPresent(model, false));
		System.assertEquals(13, Apexpages.getMessages().size());
		System.assertEquals(true, service.areRequiredFieldsPresent(model, true));
		System.assertEquals(13, Apexpages.getMessages().size());
    }*/
    
    // test legal entity name 
    static testMethod void testPopulateLEName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityNameX__c = true;
    	mappingObject.legalEntityName__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityName());
    	delete mappingObject;
    	
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityNameX__c = false;
    	mappingObject.legalEntityNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityName());
    	delete mappingObject;
    	
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityNameX__c = true;
    	mappingObject.legalEntityName__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityName());
    	// check as if initiated from account page
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, opportunity.Id).getIsNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, opportunity.Id).getLegalEntityName());
    	delete mappingObject;
    }
    
    // test legal entity's doing business as 
    static testMethod void testPopulateLEDoingBusinessAs(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityDoingBusinessAsX__c = true;
    	mappingObject.legalEntityDoingBusinessAs__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityDoingBusinessAs());
    	delete mappingObject;
    	
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityDoingBusinessAsX__c = false;
    	mappingObject.legalEntityDoingBusinessAsD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityDoingBusinessAs());
    	delete mappingObject;
    	
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityDoingBusinessAsX__c = true;
    	mappingObject.legalEntityDoingBusinessAs__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityDoingBusinessAs());
    	// check as if initiated from account page
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, opportunity.Id).getIsDoingBusinessAsFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, opportunity.Id).getLegalEntityDoingBusinessAs());
    	delete mappingObject;
    }
    
    static testMethod void testPopulateLEStreetAddress1(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStreetAddress1X__c = true;
    	mappingObject.legalEntityStreetAddress1__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStreetAddress1());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityStreetAddress1X__c = false;
    	mappingObject.legalEntityStreetAddress1D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStreetAddress1());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStreetAddress1X__c = true;
    	mappingObject.legalEntityStreetAddress1__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStreetAddress1());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getIsStreetAddress1FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStreetAddress1());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEStreetAddress2(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStreetAddress2X__c = true;
    	mappingObject.legalEntityStreetAddress2__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStreetAddress2());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityStreetAddress2X__c = false;
    	mappingObject.legalEntityStreetAddress2D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStreetAddress2());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStreetAddress2X__c = true;
    	mappingObject.legalEntityStreetAddress2__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStreetAddress2());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getIsStreetAddress2FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStreetAddress2());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLECity(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityCityX__c = true;
    	mappingObject.legalEntityCity__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getCity());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityCityX__c = false;
    	mappingObject.legalEntityCityD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getCity());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityCityX__c = true;
    	mappingObject.legalEntityCity__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getCity());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getIsCityFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getCity());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEStateProvince(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStateProvinceX__c = true;
    	mappingObject.legalEntityStateProvince__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStateProvince());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityStateProvinceX__c = false;
    	mappingObject.legalEntityStateProvinceD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStateProvince());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityStateProvinceX__c = true;
    	mappingObject.legalEntityStateProvince__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStateProvince());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getIsStateProvinceFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getStateProvince());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPostalCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPostalCodeX__c = true;
    	mappingObject.legalEntityPostalCode__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getPostalCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPostalCodeX__c = false;
    	mappingObject.legalEntityPostalCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getPostalCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPostalCodeX__c = true;
    	mappingObject.legalEntityPostalCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getPostalCode());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getIsPostalCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getPostalCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLECountryCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityCountryCodeX__c = true;
    	mappingObject.legalEntityCountryCode__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getCountryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityCountryCodeX__c = false;
    	mappingObject.legalEntityCountryCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getCountryCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityCountryCodeX__c = true;
    	mappingObject.legalEntityCountryCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getCountryCode());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getIsCountryCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAddress().getCountryCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEContactPhone(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityContactPhoneX__c = true;
    	mappingObject.legalEntityContactPhone__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityContactPhone());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityContactPhoneX__c = false;
    	mappingObject.legalEntityContactPhoneD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityContactPhone());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityContactPhoneX__c = true;
    	mappingObject.legalEntityContactPhone__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityContactPhone());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getIsContactPhoneFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityContactPhone());
    	delete mappingObject;
	}
	
    static testMethod void testPopulateLEFirstName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalFirstNameX__c = true;
    	mappingObject.legalEntityPrincipalFirstName__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getFirstName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalFirstNameX__c = false;
    	mappingObject.legalEntityPrincipalFirstNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getFirstName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalFirstNameX__c = true;
    	mappingObject.legalEntityPrincipalFirstName__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getFirstName());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getIsFirstNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getFirstName());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLELastName(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalLastNameX__c = true;
    	mappingObject.legalEntityPrincipalLastName__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getLastName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalLastNameX__c = false;
    	mappingObject.legalEntityPrincipalLastNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getLastName());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalLastNameX__c = true;
    	mappingObject.legalEntityPrincipalLastName__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getLastName());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getIsLastNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getLastName());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEEmailAddress(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalEmailAddressX__c = true;
    	mappingObject.legalEntityPrincipalEmailAddress__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getEmailAddress());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalEmailAddressX__c = false;
    	mappingObject.legalEntityPrincipalEmailAddressD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getEmailAddress());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalEmailAddressX__c = true;
    	mappingObject.legalEntityPrincipalEmailAddress__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getEmailAddress());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getIsEmailAddressFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getEmailAddress());
    	delete mappingObject;
	}
	static testMethod void testPopulateLEPrincipalStreetAddress1(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStreetAddress1X__c = true;
    	mappingObject.legalEntityPrincipalStreetAddress1__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStreetAddress1());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalStreetAddress1X__c = false;
    	mappingObject.legalEntityPrincipalStreetAddress1D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStreetAddress1());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStreetAddress1X__c = true;
    	mappingObject.legalEntityPrincipalStreetAddress1__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStreetAddress1());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getIsStreetAddress1FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStreetAddress1());
    	delete mappingObject;
    	
	}
    
    static testMethod void testPopulateLEPrincipalStreetAddress2(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStreetAddress2X__c = true;
    	mappingObject.legalEntityPrincipalStreetAddress2__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStreetAddress2());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalStreetAddress2X__c = false;
    	mappingObject.legalEntityPrincipalStreetAddress2D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStreetAddress2());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStreetAddress2X__c = true;
    	mappingObject.legalEntityPrincipalStreetAddress2__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStreetAddress2());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getIsStreetAddress2FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStreetAddress2());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalCity(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalCityX__c = true;
    	mappingObject.legalEntityPrincipalCity__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getCity());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalCityX__c = false;
    	mappingObject.legalEntityPrincipalCityD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getCity());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalCityX__c = true;
    	mappingObject.legalEntityPrincipalCity__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getCity());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getIsCityFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getCity());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalStateProvince(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStateProvinceX__c = true;
    	mappingObject.legalEntityPrincipalStateProvince__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStateProvince());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalStateProvinceX__c = false;
    	mappingObject.legalEntityPrincipalStateProvinceD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStateProvince());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalStateProvinceX__c = true;
    	mappingObject.legalEntityPrincipalStateProvince__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStateProvince());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getIsStateProvinceFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getStateProvince());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalPostalCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalPostalCodeX__c = true;
    	mappingObject.legalEntityPrincipalPostalCode__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getPostalCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalPostalCodeX__c = false;
    	mappingObject.legalEntityPrincipalPostalCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getPostalCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalPostalCodeX__c = true;
    	mappingObject.legalEntityPrincipalPostalCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getPostalCode());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getIsPostalCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getPostalCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalCountryCode(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalCountryCodeX__c = true;
    	mappingObject.legalEntityPrincipalCountryCode__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getCountryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalCountryCodeX__c = false;
    	mappingObject.legalEntityPrincipalCountryCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getCountryCode());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalCountryCodeX__c = true;
    	mappingObject.legalEntityPrincipalCountryCode__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getCountryCode());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getIsCountryCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getAddress().getCountryCode());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalContactPhone(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalContactPhoneX__c = true;
    	mappingObject.legalEntityPrincipalContactPhone__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getContactPhone());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalContactPhoneX__c = false;
    	mappingObject.legalEntityPrincipalContactPhoneD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getContactPhone());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalContactPhoneX__c = true;
    	mappingObject.legalEntityPrincipalContactPhone__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getContactPhone());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getIsContactPhoneFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getContactPhone());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalDateOfBirth(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDateOfBirthX__c = true;
    	mappingObject.legalEntityPrincipalDateOfBirth__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDateOfBirth());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalDateOfBirthX__c = false;
    	mappingObject.legalEntityPrincipalDateOfBirthD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDateOfBirth());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDateOfBirthX__c = true;
    	mappingObject.legalEntityPrincipalDateOfBirth__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDateOfBirth());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getIsDateOfBirthFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDateOfBirth());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalDriversLicense(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDriversLicenseX__c = true;
    	mappingObject.legalEntityPrincipalDriversLicense__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDriversLicense());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalDriversLicenseX__c = false;
    	mappingObject.legalEntityPrincipalDriversLicenseD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDriversLicense());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDriversLicenseX__c = true;
    	mappingObject.legalEntityPrincipalDriversLicense__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDriversLicense());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getIsDriversLicenseFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDriversLicense());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalDriversLicenseState(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDriversLicenseStateX__c = true;
    	mappingObject.legalEntityPrincipalDriversLicenseState__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDriversLicenseState());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalDriversLicenseStateX__c = false;
    	mappingObject.legalEntityPrincipalDriversLicenseStateD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDriversLicenseState());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalDriversLicenseStateX__c = true;
    	mappingObject.legalEntityPrincipalDriversLicenseState__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDriversLicenseState());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getIsDriversLicenseStateFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getDriversLicenseState());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEPrincipalSsn(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalSsnX__c = true;
    	mappingObject.legalEntityPrincipalSsn__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getSsn());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityPrincipalSsnX__c = false;
    	mappingObject.legalEntityPrincipalSsnD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getSsn());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityPrincipalSsnX__c = true;
    	mappingObject.legalEntityPrincipalSsn__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getSsn());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getIsSsnFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityPrincipal().getSsn());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLETaxId(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityTaxIdX__c = true;
    	mappingObject.legalEntityTaxId__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityTaxId());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityTaxIdX__c = false;
    	mappingObject.legalEntityTaxIdD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityTaxId());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityTaxIdX__c = true;
    	mappingObject.legalEntityTaxId__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityTaxId());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getIsTaxIdFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityTaxId());
    	delete mappingObject;
	}
	
	static testMethod void testPopulateLEAnnualCreditCardSalesVolume(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeX__c = true;
    	mappingObject.legalEntityAnnualCreditCardSalesVolume__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAnnualCreditCardSalesVolume());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeX__c = false;
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAnnualCreditCardSalesVolume());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityAnnualCreditCardSalesVolumeX__c = true;
    	mappingObject.legalEntityAnnualCreditCardSalesVolume__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAnnualCreditCardSalesVolume());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getIsAnnualCreditCardSalesVolumeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityAnnualCreditCardSalesVolume());
    	delete mappingObject;
	}
    
    static testMethod void testPopulateLEHasAcceptedCreditCards(){
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	
    	SalesforceLitleMappingsObject__c mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityHasAcceptedCreditCardsX__c = true;
    	mappingObject.legalEntityHasAcceptedCreditCards__c = 'Account.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	LegalEntityModelService service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityHasAcceptedCreditCards());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.legalEntityHasAcceptedCreditCardsX__c = false;
    	mappingObject.legalEntityHasAcceptedCreditCardsD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityHasAcceptedCreditCards());
    	delete mappingObject;
    	//Check opportunity mapping value
    	Opportunity opportunity = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opportunity;
    	
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	// check account mapping value
    	mappingObject.legalEntityHasAcceptedCreditCardsX__c = true;
    	mappingObject.legalEntityHasAcceptedCreditCards__c = 'Opportunity.Name';
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new LegalEntityModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityHasAcceptedCreditCards());
    	
    	// check as if initiated from account page
    	
    	
    	service = new LegalEntityModelService(account.Id, opportunity.Id);
    	System.assert(service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getIsHasAcceptedCreditCardsFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setLegalEntityModelFromMappingObject(new LegalEntityModel(), mappingObject, null).getLegalEntityHasAcceptedCreditCards());
    	delete mappingObject;
	}
}