@isTest
public class MockCreateSubMerchantResponseGenerator implements HttpCalloutMock{

	public static final String DEFAULT_STRING = 'Default String';
	
    public HttpResponse respond(HttpRequest request){
    	System.assertEquals('POST', request.getMethod());
    	System.assertEquals(LitleMidFormController.CONTENT_TYPE, request.getHeader('Content-Type'));
 	    System.assertEquals(LitleMidFormController.ACCEPT, request.getHeader('Accept'));
        
    	HttpResponse res = new HttpResponse();
    	res.setBody(DEFAULT_STRING);
    	res.setStatusCode(200);
    	res.setStatus(DEFAULT_STRING);
    	return res;
    }
}