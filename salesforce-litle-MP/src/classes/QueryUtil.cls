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
public class QueryUtil {

	// Returns all opportunity names from the given Account Id
	public static List<Selectoption> getOpportunityNameOptions(String accountId){
		List<Opportunity> opportunities = new List<Opportunity>();
		List<Selectoption> values = new List<Selectoption>();
		if(String.isNotEmpty(accountId)){
			String query = String.escapeSingleQuotes('select Name from Opportunity where AccountId= :accountId');
			try{
				opportunities = Database.query(query);
	    		if(!opportunities.isEmpty()){
	    			values.add(new Selectoption('', '-- Select Opportunity --'));
	    			for(Opportunity o : opportunities){
	    				// add all the field values in the list
	    				// skip blank values
	    				if(String.isNotEmpty(String.valueOf(o.Name))){
	    					values.add(new Selectoption(o.Id, String.valueOf(o.Name)));
	    				}
	    			}	
	    		}
			}catch(Queryexception e){
				system.debug('Error names of opportunity for account id: '+accountId+' , ' + e);
			}
		}
		return values;
	}
	
	// Returns the value of the given field of Account of the given Id
	public static String getAccountFieldValue(String accountFieldName, String accountId){
		if(String.isNotEmpty(accountFieldName) && String.isNotEmpty(accountId)){
			String query = String.escapeSingleQuotes('select '+accountFieldName+' from Account where id= :accountId');
			try{
				List<Account> sObjectValue = Database.query(query);
	    		if(!sObjectValue.isEmpty()){
	    			return String.valueOf(sObjectValue.get(0).get(accountFieldName));	
	    		}
			}catch(Queryexception e){
				system.debug('Error get values from account for field: '+accountFieldName+' , ' + e);
			}
		}
		return null;
	}
	
	// Returns the value of the given field of Opportunity of the given Id
	public static String getOpportunityFieldValue(String opportunityFieldName, String opportunityId){
		if(String.isNotEmpty(opportunityFieldName) && String.isNotEmpty(opportunityId)){
			String query = String.escapeSingleQuotes('select '+opportunityFieldName+' from Opportunity where id= :opportunityId');
			try{
				List<Opportunity> sObjectValue = Database.query(query);
	    		if(!sObjectValue.isEmpty()){
	    			return String.valueOf(sObjectValue.get(0).get(opportunityFieldName));	
	    		}
			}catch(Queryexception e){
				system.debug('Error get values from opportunity for field: '+opportunityFieldName+' , ' + e);
			}
		}
		return null;
	}
}