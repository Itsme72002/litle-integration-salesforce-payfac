public class LoginControl {

	public LoginControl(){
		
	}
    public LoginControl(ApexPages.StandardController controller) {
    	this.acct = (Account)controller.getRecord();
    	//this.username = acct.Name;
    	 
    }

	private Account acct;
	private String username;
	private String password;
	private String status;
	//private MapResult result;
	
	public void setUsername(String uname){
		this.username = uname;
	}
	
	public void setPassword(String pswd){
		this.password = pswd;
	}
	
	public String getPassword(){
		return password;
	}
	
	public String getUsername(){
		return acct.BillingCity;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	
	public String getStatus(){
		return status;
	}
	
	public void setAcct(Account account){
		this.acct = account;
	}
	
	public Account getAcct(){
		return acct;
	}
	
	public void submit(){
		Httpresponse res = getApiResponse();
		this.status = res.getStatus();
		/*Pagereference pr = Page.result;
		pr.setRedirect(false);
		return pr;*/
	}
	
	public HttpResponse getApiResponse(){
		Http h = new Http();
		Httprequest req = new Httprequest();
		req.setEndpoint('http://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&sensor=false');
		req.setMethod('GET');
		Httpresponse res = h.send(req);
		return res;
	}

}