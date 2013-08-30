public class SalesForceSelectOptionsService {
	
	public List < Selectoption > fetchAllSalesforceFields() {
        List < Selectoption > allFields = new List < Selectoption > ();
        allFields.add(new Selectoption('', '-- Select Option --'));
        
        // Add account fields
        SObjectType objToken = Schema.getGlobalDescribe().get('Account');
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map < String, SObjectField > fields = objDef.fields.getMap();
        Set < String > fieldSet = fields.keySet();
        for (String s: fieldSet) {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            allFields.add(new Selectoption('Account.' + selectedField.getName(), 'Account.' + selectedField.getLabel()));
        }
        //Add Opportunity fields
        objToken = Schema.getGlobalDescribe().get('Opportunity');
        objDef = objToken.getDescribe();
        fields = objDef.fields.getMap();
        fieldSet = fields.keySet();
		for (String s: fieldSet) {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            allFields.add(new Selectoption('Opportunity.' + selectedField.getName(),
            								 'Opportunity.' + selectedField.getLabel()));
		}	
		return allFields;
    }
    
    public List < Selectoption > fetchAllSalesforceBooleanFields() {
        List < Selectoption > booleanFields = new List < Selectoption > ();
        booleanFields.add(new Selectoption('', '-- Select Option --'));
        
        // Add account fields
        SObjectType objToken = Schema.getGlobalDescribe().get('Account');
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map < String, SObjectField > fields = objDef.fields.getMap();
        Set < String > fieldSet = fields.keySet();
        for (String s: fieldSet) {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            if(selectedField.getType() == Schema.DisplayType.BOOLEAN){
            	booleanFields.add(new Selectoption('Account.' + selectedField.getName(), 'Account.' + selectedField.getLabel()));
            }

        }
        //Add Opportunity fields
        objToken = Schema.getGlobalDescribe().get('Opportunity');
        objDef = objToken.getDescribe();
        fields = objDef.fields.getMap();
        fieldSet = fields.keySet();
		for (String s: fieldSet) {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
			if(selectedField.getType() == Schema.DisplayType.BOOLEAN){
            	booleanFields.add(new Selectoption('Opportunity.' + selectedField.getName(), 'Opportunity.' + selectedField.getLabel()));
            }
		}	
		return booleanFields;
    }
    
    public List < SelectOption > fetchAllBooleanOption(){
    	List < Selectoption > booleanOptions = new List < Selectoption > ();
        booleanOptions.add(new Selectoption('', '-- Select Option --'));
        booleanOptions.add(new SelectOption('true', 'True'));
        booleanOptions.add(new SelectOption('false', 'False'));
        
        return booleanOptions;
    }

}