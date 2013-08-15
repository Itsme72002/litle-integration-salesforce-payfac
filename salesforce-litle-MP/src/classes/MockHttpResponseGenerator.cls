@isTest
public class MockHttpResponseGenerator implements HttpCalloutMock{
	public Integer calledCount = 0;
	public Httpresponse legalEntityResponse;
	public Httpresponse subMerchantResponse;

	public MockHttpResponseGenerator(TestResponse leResponse, TestResponse smResponse){
		if(leResponse != null){
			legalEntityResponse = new Httpresponse();
			legalEntityResponse.setBody(leResponse.getResponseBody());
	    	legalEntityResponse.setStatusCode(leResponse.getStatusCode());
	    	legalEntityResponse.setStatus(leResponse.getStatusMessage());
		}else{
			calledCount = 1;
		}
    	
    	if(smResponse != null){
	    	subMerchantResponse = new Httpresponse();
	    	subMerchantResponse.setBody(smResponse.getResponseBody());
	    	subMerchantResponse.setStatusCode(smResponse.getStatusCode());
	    	subMerchantResponse.setStatus(smResponse.getStatusMessage());
    	}
	}
	
	
    public HttpResponse respond(HttpRequest req){
    	if(calledCount == 0){
    		calledCount ++;
	    	return legalEntityResponse;
    	}else{
    		return subMerchantResponse;
    	}
    }
}