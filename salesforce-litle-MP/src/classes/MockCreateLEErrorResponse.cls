@isTest
public class MockCreateLEErrorResponse implements HttpCalloutMock{

 	public static final String STATUS_MESSAGE = 'Unauthorized';
    public static final Integer STATUS_CODE = 401;
	public static final String ERROR_MESSAGE = 'You are not authorized to access this resource. Please check your credentials.';
	
    public HttpResponse respond(HttpRequest request){
    	System.assertEquals(LitleConstants.LEGAL_ENTITY_REQUEST_ENDPOINT, request.getEndpoint());
    	System.assertEquals(LitleConstants.CREATE_HTTP_REQUEST_METHOD, request.getMethod());
    	System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_ACCEPT_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
 	    
 	    HttpResponse res = new HttpResponse();
    	String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
						 + '<errorResponse>'
						 + '<errors>'
						 + '<error>'+ERROR_MESSAGE+'</error>'
						 + '</errors>'
						 + '</errorResponse>';
    	res.setBody(response);
    	res.setStatusCode(STATUS_CODE);
    	res.setStatus(STATUS_MESSAGE);
    	return res;
    }
}