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
private class QueryUtilTest {
	
	public static final String DEFAULT_NAME = 'test';
	public static final String DATE_STRING = '2013-06-01';
	public static final String ACCOUNT_NAME = 'Test Account';
	public static final String OPPORTUNITY_NAME = 'Test Opportunity';
	public static final String DEFAULT_STRING = 'Default String';
	public static final Date DEFAULT_DATE = Date.today();

    static testMethod void testGetOpportunityNameOptions(){
    	// test null values
    	System.assertEquals(0, QueryUtil.getOpportunityNameOptions(null).size());
    	System.assertEquals(0, QueryUtil.getOpportunityNameOptions('').size());
    	
    	// test with invalid account id
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	Opportunity opp = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE, AccountId= account.Id);
    	insert opp;
    	System.assertEquals(0, QueryUtil.getOpportunityNameOptions('123').size());
    	//test with proper values
    	System.assertEquals(2, QueryUtil.getOpportunityNameOptions(account.Id).size());
    	System.assertEquals(OPPORTUNITY_NAME, QueryUtil.getOpportunityNameOptions(account.Id).get(1).getLabel());
    	System.assertEquals(opp.Id, QueryUtil.getOpportunityNameOptions(account.Id).get(1).getValue());
    	delete opp;
    	delete account;
    }
    
    static testMethod void testGetAccountFieldValue(){
    	// test with null and blank inputs
    	System.assertEquals(null, QueryUtil.getAccountFieldValue(null, null));
    	System.assertEquals(null, QueryUtil.getAccountFieldValue('', ''));
    	Account account = new Account(name=ACCOUNT_NAME);
    	insert account;
    	// test with invalid account id and invalid field name
    	System.assertEquals(null, QueryUtil.getAccountFieldValue('name', '121'));
    	System.assertEquals(null, QueryUtil.getAccountFieldValue('xyz', account.Id));
    	// test with proper values
    	System.assertEquals(ACCOUNT_NAME, QueryUtil.getAccountFieldValue('name', account.Id));
    	delete account;
    	
    }
    
    static testMethod void testGetOpportunityFieldValue(){
    	System.assertEquals(null, QueryUtil.getOpportunityFieldValue(null, null));
    	System.assertEquals(null, QueryUtil.getOpportunityFieldValue('', ''));
    	Opportunity opp = new Opportunity(name=OPPORTUNITY_NAME, stageName=DEFAULT_STRING, CloseDate=DEFAULT_DATE);
    	insert opp;
    	// test with invalid Opportunity id and invalid field name
    	System.assertEquals(null, QueryUtil.getOpportunityFieldValue('name', '121'));
    	System.assertEquals(null, QueryUtil.getOpportunityFieldValue('xyz', opp.Id));
    	// test with proper values
    	System.assertEquals(OPPORTUNITY_NAME, QueryUtil.getOpportunityFieldValue('name', opp.Id));
    	delete opp;
    }
}