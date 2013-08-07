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