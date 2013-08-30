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
private class SubMerchantModelServiceTest {
	
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
        SubMerchantModelService service = new SubMerchantModelService(null, null);
        SubMerchantModel model = new SubMerchantModel();
       
		model.setSubMerchantAmexMid(LONG_STRING);
		model.setSubMerchantBankAccountNumber(LONG_STRING);
		model.setSubMerchantBankRoutingNumber(LONG_STRING);
		model.setSubMerchantCreateCredentials(LONG_STRING);
		model.setSubMerchantCustomerServiceNumber(LONG_STRING);
		model.setSubMerchantDiscoverConveyMid(LONG_STRING);
		model.setSubMerchantHardCodeBillingDescriptor(LONG_STRING);
		model.setSubMerchantMaxTransactionAmount(LONG_STRING);
		model.setSubMerchantMerchantCategoryCode(LONG_STRING);
		model.setSubMerchantMerchantName(LONG_STRING);
		model.getSubMerchantPrimaryContact().setFirstName(LONG_STRING);
		model.getSubMerchantPrimaryContact().setLastName(LONG_STRING);
		model.getSubMerchantPrimaryContact().setEmailAddress(LONG_STRING);
		model.getSubMerchantPrimaryContact().setPhone(LONG_STRING);
		model.setSubMerchantPspMerchantId(LONG_STRING);
		model.setSubMerchantUrl(LONG_STRING);
		model.setSubMerchanteCheckBillingDescriptor(LONG_STRING);
		model.setSubMerchanteCheckCompanyName(LONG_STRING);
		// IsInputDataValid should return false
        System.assertEquals(false, service.isSubMerchantModelValid(model, false));
         // Input all correct fields
        model.getSubMerchantAddress().setStreetAddress1(STATE);
		model.getSubMerchantAddress().setStreetAddress2(STATE);
		model.getSubMerchantAddress().setCity(STATE);
		model.getSubMerchantAddress().setStateProvince(STATE);
		model.getSubMerchantAddress().setPostalCode('12345');
		model.getSubMerchantAddress().setCountryCode(STATE);
		model.setSubMerchantAmexMid('1234567890');
		model.setSubMerchantBankAccountNumber(STATE);
		model.setSubMerchantBankRoutingNumber(STATE);
		model.setSubMerchantCreateCredentials(BOOLEAN_STRING);
		model.setSubMerchantCustomerServiceNumber('1234567890');
		model.setSubMerchantDiscoverConveyMid('123456789012345');
		model.setSubMerchantHardCodeBillingDescriptor('1234');
		model.setSubMerchantMaxTransactionAmount('12345');
		model.setSubMerchantMerchantCategoryCode(STATE);
		model.setSubMerchantMerchantName(STATE);
		model.getSubMerchantPrimaryContact().setFirstName(STATE);
		model.getSubMerchantPrimaryContact().setLastName(STATE);
		model.getSubMerchantPrimaryContact().setEmailAddress(STATE);
		model.getSubMerchantPrimaryContact().setPhone('1234567890');
		model.setSubMerchantPspMerchantId(STATE);
		model.setSubMerchantUrl(STATE);
		model.setSubMerchanteCheckBillingDescriptor(STATE);
		model.setSubMerchanteCheckCompanyName(STATE);
		System.assertEquals(true, service.isSubMerchantModelValid(model, false));
    }
    
    static testMethod void testAreRequiredFieldsFilled() {
    	
    	SubMerchantModelService service = new SubMerchantModelService(null, null);
    	SubMerchantModel model = new SubMerchantModel();
    	// Initially all fields are null/empty
    	System.assertEquals(false, service.areRequiredFieldsPresent(model, false));
    	model.getSubMerchantAddress().setCountryCode(LONG_STRING);
		model.setSubMerchantBankAccountNumber(LONG_STRING);
		model.setSubMerchantBankRoutingNumber(LONG_STRING);
		model.setSubMerchantCustomerServiceNumber(LONG_STRING);
		model.setSubMerchantHardCodeBillingDescriptor(LONG_STRING);
		model.setSubMerchantMaxTransactionAmount(LONG_STRING);
		model.setSubMerchantMerchantCategoryCode(LONG_STRING);
		model.setSubMerchantMerchantName(LONG_STRING);
		model.setSubMerchantPspMerchantId(LONG_STRING);
		//new required fields
		System.assertEquals(false, service.areRequiredFieldsPresent(model, false));
		model.getSubMerchantAddress().setStreetAddress1(LONG_STRING);
		model.getSubMerchantAddress().setCity(LONG_STRING);
		model.getSubMerchantAddress().setPostalCode(LONG_STRING);
		model.getSubMerchantAddress().setStateProvince(LONG_STRING);
		model.getSubMerchantPrimaryContact().setFirstName(LONG_STRING);
		model.getSubMerchantPrimaryContact().setLastName(LONG_STRING);
		model.getSubMerchantPrimaryContact().setEmailAddress(LONG_STRING);
		model.getSubMerchantPrimaryContact().setPhone(LONG_STRING);
		System.assertEquals(true, service.areRequiredFieldsPresent(model, false));
	
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStreetAddress1());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantStreetAddress1X__c = false;
    	mappingObject.subMerchantStreetAddress1D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStreetAddress1());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStreetAddress1());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getIsStreetAddress1FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStreetAddress1());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStreetAddress2());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantStreetAddress2X__c = false;
    	mappingObject.subMerchantStreetAddress2D__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStreetAddress2());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStreetAddress2());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getIsStreetAddress2FromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStreetAddress2());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getCity());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCityX__c = false;
    	mappingObject.subMerchantCityD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getCity());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getCity());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getIsCityFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getCity());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStateProvince());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantStateProvinceX__c = false;
    	mappingObject.subMerchantStateProvinceD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStateProvince());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStateProvince());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getIsStateProvinceFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getStateProvince());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getPostalCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantPostalCodeX__c = false;
    	mappingObject.subMerchantPostalCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getPostalCode());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getPostalCode());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getIsPostalCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getPostalCode());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getCountryCode());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCountryCodeX__c = false;
    	mappingObject.subMerchantCountryCodeD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getCountryCode());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getCountryCode());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getIsCountryCodeFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAddress().getCountryCode());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAmexMid());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantAmexMidX__c = false;
    	mappingObject.subMerchantAmexMidD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAmexMid());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAmexMid());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantAmexMidFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantAmexMid());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantBankAccountNumber());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantBankAccountNumberX__c = false;
    	mappingObject.subMerchantBankAccountNumberD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantBankAccountNumber());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantBankAccountNumber());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantBankAccountNumberFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantBankAccountNumber());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantBankRoutingNumber());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantBankRoutingNumberX__c = false;
    	mappingObject.subMerchantBankRoutingNumberD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantBankRoutingNumber());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantBankRoutingNumber());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantBankRoutingNumberFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantBankRoutingNumber());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantCreateCredentials());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCreateCredentialsX__c = false;
    	mappingObject.subMerchantCreateCredentialsD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantCreateCredentials());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantCreateCredentials());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantCreateCredentialsFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantCreateCredentials());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantCustomerServiceNumber());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantCustomerServiceNumberX__c = false;
    	mappingObject.subMerchantCustomerServiceNumberD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantCustomerServiceNumber());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantCustomerServiceNumber());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantCustomerServiceNumberFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantCustomerServiceNumber());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantDiscoverConveyMid());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantDiscoverConveyMidX__c = false;
    	mappingObject.subMerchantDiscoverConveyMidD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantDiscoverConveyMid());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantDiscoverConveyMid());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantDiscoverConveyMidFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantDiscoverConveyMid());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantHardCodeBillingDescriptor());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantHardCodeBillingDescriptorX__c = false;
    	mappingObject.subMerchantHardCodeBillingDescD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantHardCodeBillingDescriptor());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantHardCodeBillingDescriptor());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantHardCodeBillingDescriptorFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantHardCodeBillingDescriptor());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantMaxTransactionAmount());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantMaxTransactionAmountX__c = false;
    	mappingObject.subMerchantMaxTransactionAmountD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantMaxTransactionAmount());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantMaxTransactionAmount());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantMaxTransactionAmountFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantMaxTransactionAmount());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantMerchantName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantMerchantNameX__c = false;
    	mappingObject.subMerchantMerchantNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantMerchantName());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantMerchantName());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantMerchantNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantMerchantName());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getFirstName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantFirstNameX__c = false;
    	mappingObject.subMerchantFirstNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getFirstName());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getFirstName());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getIsFirstNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getFirstName());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getLastName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantLastNameX__c = false;
    	mappingObject.subMerchantLastNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getLastName());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getLastName());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getIsLastNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getLastName());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getEmailAddress());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantEmailAddressX__c = false;
    	mappingObject.subMerchantEmailAddressD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getEmailAddress());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getEmailAddress());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getIsEmailAddressFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getEmailAddress());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getPhone());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantPhoneX__c = false;
    	mappingObject.subMerchantPhoneD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getPhone());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getPhone());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getIsPhoneFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPrimaryContact().getPhone());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPspMerchantId());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantPspMerchantIdX__c = false;
    	mappingObject.subMerchantPspMerchantIdD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPspMerchantId());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPspMerchantId());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantPspMerchantIdFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantPspMerchantId());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantUrl());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchantUrlX__c = false;
    	mappingObject.subMerchantUrlD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantUrl());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantUrl());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchantUrlFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchantUrl());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchanteCheckBillingDescriptor());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchanteCheckBillingDescriptorX__c = false;
    	mappingObject.subMerchanteCheckBillingDescD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchanteCheckBillingDescriptor());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchanteCheckBillingDescriptor());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchanteCheckBillingDescriptorFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchanteCheckBillingDescriptor());
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
    	SubMerchantModelService service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(ACCOUNT_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchanteCheckCompanyName());
    	delete mappingObject;
    	// check default textbox value
    	mappingObject = new SalesforceLitleMappingsObject__c();
    	mappingObject.subMerchanteCheckCompanyNameX__c = false;
    	mappingObject.subMerchanteCheckCompanyNameD__c = DEFAULT_STRING;
    	mappingObject.litleEnvironment__c = 'CERT';
		insert mappingObject;
    	service = new SubMerchantModelService(account.Id, null);
    	System.assertEquals(DEFAULT_STRING, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchanteCheckCompanyName());
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
    	service = new SubMerchantModelService(null, opportunity.Id);
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchanteCheckCompanyName());
    	
    	// check as if initiated from account page
    	service = new SubMerchantModelService(account.Id, opportunity.Id);
    	System.assert(service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getIsSubMerchanteCheckCompanyNameFromOpportunity());
    	System.assertEquals(OPPORTUNITY_NAME, service.setSubMerchantModelFromMappingObject(new SubMerchantModel(), mappingObject, null).getSubMerchanteCheckCompanyName());
    	delete mappingObject;
    }

}