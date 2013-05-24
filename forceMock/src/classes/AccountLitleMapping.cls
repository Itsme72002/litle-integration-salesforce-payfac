public class AccountLitleMapping {
	public String accountValue {get;set;}
	public String litleValue {get;set;}
	private List<String> repeatList;
	private List<Selectoption> accountFieldList;
	private List<Selectoption> litleFieldList;
	
	public AccountLitleMapping(){
		repeatList = new List<String>();
		//accountFieldList = new List<Selectoption>();
		//litleFieldList = new List<Selectoption>();
	}
 
  public List<String> getRepeatList(){
  	return repeatList;
  }
  
  public void setRepeatList(List<String> accountFieldList){
  	this.repeatList = repeatList;
  }
  
  public List<Selectoption> getAccountFieldList(){
  	if (accountFieldList == null){
  		setAccountFieldList(fetchAccountFields());
  	}
  	return accountFieldList;
  }
  
  public void setAccountFieldList(List<Selectoption> accountFieldList){
  	this.accountFieldList = accountFieldList;
  }
  
  public List<Selectoption> getLitleFieldList(){
  	if (litleFieldList == null){
  		setLitleFieldList(fetchLitleFields());
  	}
  	return litleFieldList;
  }
  
  public void setLitleFieldList(List<Selectoption> litleFieldList){
  	this.litleFieldList = litleFieldList;
  }
  
  public List<Selectoption> fetchAccountFields(){
	SObjectType objToken = Schema.getGlobalDescribe().get('Account');
    DescribeSObjectResult objDef = objToken.getDescribe();
    Map<String, SObjectField> fields = objDef.fields.getMap(); 
    List<Selectoption> accountFields = new List<Selectoption>();
    Set<String> fieldSet = fields.keySet();
    for(String s:fieldSet)
    {
        SObjectField fieldToken = fields.get(s);
        DescribeFieldResult selectedField = fieldToken.getDescribe();
        accountFields.add(new Selectoption(selectedField.getName(),selectedField.getName()));
    }
    return accountFields;
 }
   
    public List<SelectOption> fetchLitleFields() {
 	 	List<SelectOption> options = new List<SelectOption>();
 	 	options.add(new SelectOption('Name','Name'));
 	 	options.add(new SelectOption('BillingState','BillingState'));
 	 	options.add(new SelectOption('BillingCity','BillingCity'));
 	 	return options;
  	}
  	
  	
  	public void addAnotherMapping(){
  		repeatList.add('foo bar');
  	}
   
}