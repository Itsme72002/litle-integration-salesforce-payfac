public class LoginControl {

    public LoginControl(){
        
    }
    public LoginControl(ApexPages.StandardController controller) {
        this.account = (Account)controller.getRecord();
        this.accountName = [select name from account where id= :account.Id].name;
       this.billingCity = [select BillingCity from account where id= :account.Id].billingCity;
        this.billingState = [select BillingState from account where id= :account.Id].billingState;
    }

    private Account account;
    private String accountName;
    private String billingCity;
    private String billingState;
    
    
    private String status;
    //private MapResult result;
    
    public void setAccountName(String accountName){
        this.accountName = accountName;
    }
    
    public String getAccountName(){
        return accountName;
    }
    
    public String getBillingCity(){
        return billingCity;
    }
    
    public void setBillingCity(String billingCity){
        this.billingCity = billingCity;
    }
    
    public String getBillingState(){
        return billingState;
    }
    
    public void setBillingState(String billingState){
        this.billingState = billingState;
    }
    
    public void setStatus(String status){
        this.status = status;
    }
    
    public String getStatus(){
        return status;
    }
    
    public void setAccount(Account account){
        this.account = account;
    }
    
    public Account getAccount(){
        return account;
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