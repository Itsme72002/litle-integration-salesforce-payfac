public class AccountLitleMapping {
    // private AccountLitleMappedField accountLitleMappedObject;

    private LegalEntityModel legalEntityModel;
    private SubMerchantModel subMerchantModel;
    private List<Selectoption> salesforceFields;
    
    public void setLegalEntityModel(LegalEntityModel legalEntityModel){
    	this.legalEntityModel = legalEntityModel;
    }
    
    public LegalEntityModel getLegalEntityModel(){
    	return legalEntityModel;
    }
    
    public void setSubMerchantModel(SubMerchantModel subMerchantModel){
    	this.subMerchantModel = subMerchantModel;
    }
    
    public SubMerchantModel getSubMerchantModel(){
    	return subMerchantModel;
    }
    
    public List<Selectoption> getSalesforceFields(){
    	return fetchAccountFields();
    }
    
    public void setSalesforceFields(List<Selectoption> salesforceFields){
    	this.salesforceFields = salesforceFields;
    }

    public List<Selectoption> fetchAccountFields(){
	    SObjectType objToken = Schema.getGlobalDescribe().get('Account');
	    DescribeSObjectResult objDef = objToken.getDescribe();
	    Map<String, SObjectField> fields = objDef.fields.getMap(); 
	    List<Selectoption> accountFields = new List<Selectoption>();
	    Set<String> fieldSet = fields.keySet();
	    accountFields.add(new Selectoption('','-- Select Option --'));
	    for(String s:fieldSet)
	    {
	        SObjectField fieldToken = fields.get(s);
	        DescribeFieldResult selectedField = fieldToken.getDescribe();
	        accountFields.add(new Selectoption(selectedField.getName(),selectedField.getName()));
	    }
	    return accountFields;
	 }

}