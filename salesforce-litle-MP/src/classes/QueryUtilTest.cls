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
