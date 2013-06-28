@isTest
private class HttpUtilTest {
	public static final String TEST_STRING = 'test';

    static testMethod void testGetLitleMPHttpRequest() {
        // TO DO: implement unit test
        // test with null parameters
        Httprequest request = HttpUtil.getLitleMPHttpRequest(null, null, null, null, null, null);
        System.assertEquals(null, request.getHeader('Authorization'));
 	    System.assertEquals(null, request.getEndpoint());
    	System.assertEquals(null, request.getHeader('Content-Type'));
 	    System.assertEquals(null, request.getHeader('Accept'));
 		System.assertEquals(null, request.getMethod());
 		System.assertEquals('', request.getBody());
 		
 		//test with some parameters
 		request = HttpUtil.getLitleMPHttpRequest(TEST_STRING,TEST_STRING,TEST_STRING,TEST_STRING,TEST_STRING,TEST_STRING);
 		System.assertEquals(TEST_STRING, request.getHeader('Authorization'));
 	    System.assertEquals(TEST_STRING, request.getEndpoint());
    	System.assertEquals(TEST_STRING, request.getHeader('Content-Type'));
 	    System.assertEquals(TEST_STRING, request.getHeader('Accept'));
 		System.assertEquals(TEST_STRING, request.getMethod());
 		System.assertEquals(TEST_STRING, request.getBody());
    }
    
    static testMethod void testSetRequestHeaders() {
        // TO DO: implement unit test
    	//try with null request
    	Httprequest request = null;
    	HttpUtil.setRequestHeaders(request, TEST_STRING, TEST_STRING, TEST_STRING,TEST_STRING,TEST_STRING);
    	System.assertEquals(null, request);
 		
 		request = new Httprequest();
 		HttpUtil.setRequestHeaders(request, null, null, null,null,null);
 		Blob headerValue = Blob.valueOf(null+':'+null); 
 	    String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
 	    System.assertEquals(null, request.getHeader('Authorization'));
 	    System.assertEquals(null, request.getEndpoint());
    	System.assertEquals(null, request.getHeader('Content-Type'));
 	    System.assertEquals(null, request.getHeader('Accept'));
 		System.assertEquals(null, request.getMethod());
 		System.assertEquals('', request.getBody());
 		
    	request = new Httprequest();
    	HttpUtil.setRequestHeaders(request, TEST_STRING, TEST_STRING, TEST_STRING,TEST_STRING,TEST_STRING);
    	headerValue = Blob.valueOf(TEST_STRING+':'+TEST_STRING); 
 	    authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
 	    System.assertEquals(authorizationHeader, request.getHeader('Authorization'));
 	    System.assertEquals(TEST_STRING, request.getEndpoint());
    	System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, request.getHeader('Content-Type'));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, request.getHeader('Accept'));
 		System.assertEquals(TEST_STRING, request.getMethod());
 		System.assertEquals(TEST_STRING, request.getBody());
    }
    
    static testMethod void testGetBasicAuthorizationHeader() {
        // TO DO: implement unit test
        String authValue = HttpUtil.getBasicAuthorizationHeader(null, null);
        Blob headerValue = Blob.valueOf(null+':'+null); 
 	    String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
 	    System.assertEquals(authorizationHeader, authValue);
 	    
 	     authValue = HttpUtil.getBasicAuthorizationHeader(TEST_STRING, TEST_STRING);
         headerValue = Blob.valueOf(TEST_STRING+':'+TEST_STRING); 
 	     authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
 	    System.assertEquals(authorizationHeader, authValue);
    }
}