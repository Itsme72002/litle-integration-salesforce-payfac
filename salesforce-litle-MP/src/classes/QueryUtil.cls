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