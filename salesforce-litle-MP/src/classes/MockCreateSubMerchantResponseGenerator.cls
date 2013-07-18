@isTest
public class MockCreateSubMerchantResponseGenerator implements HttpCalloutMock{

	public static final String DEFAULT_STRING = 'Default String';
	
    public HttpResponse respond(HttpRequest request){
    	System.assertEquals(LitleConstants.CREATE_HTTP_REQUEST_METHOD, request.getMethod());
    	System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_ACCEPT_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
        
    	HttpResponse res = new HttpResponse();
    	res.setBody(DEFAULT_STRING);
    	res.setStatusCode(200);
    	res.setStatus(DEFAULT_STRING);
    	return res;
    }
}