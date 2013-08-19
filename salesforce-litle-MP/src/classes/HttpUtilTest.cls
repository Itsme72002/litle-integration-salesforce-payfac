/*
Copyright (c) 2013 Litle & Co.
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/
@isTest
private class HttpUtilTest {
	public static final String TEST_STRING = 'test';

    static testMethod void testGetLitleMPHttpRequest() {
        // test with null parameters
        Httprequest request = HttpUtil.getLitleMPHttpRequest(null, null, null, null, null, null);
        System.assertEquals(null, request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION));
 	    System.assertEquals(null, request.getEndpoint());
    	System.assertEquals(null, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(null, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
 		System.assertEquals(null, request.getMethod());
 		System.assertEquals('', request.getBody());
 		
 		//test with some parameters
 		request = HttpUtil.getLitleMPHttpRequest(TEST_STRING,TEST_STRING,TEST_STRING,TEST_STRING,TEST_STRING,TEST_STRING);
 		System.assertEquals(TEST_STRING, request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION));
 	    System.assertEquals(TEST_STRING, request.getEndpoint());
    	System.assertEquals(TEST_STRING, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(TEST_STRING, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_PLATFORM_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_PLATFORM));
 		System.assertEquals(TEST_STRING, request.getMethod());
 		System.assertEquals(TEST_STRING, request.getBody());
    }
    
    static testMethod void testSetRequestHeaders() {
        //try with null request
    	Httprequest request = null;
    	HttpUtil.setRequestHeaders(request, TEST_STRING, TEST_STRING, TEST_STRING,TEST_STRING,TEST_STRING);
    	System.assertEquals(null, request);
 		
 		request = new Httprequest();
 		HttpUtil.setRequestHeaders(request, null, null, null,null,null);
 		Blob headerValue = Blob.valueOf(null+':'+null); 
 	    String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
 	    System.assertEquals(null, request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION));
 	    System.assertEquals(null, request.getEndpoint());
    	System.assertEquals(null, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(null, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
 	    System.assertEquals(null, request.getHeader(LitleConstants.REQUEST_HEADER_PLATFORM));
 		System.assertEquals(null, request.getMethod());
 		System.assertEquals('', request.getBody());
 		
    	request = new Httprequest();
    	HttpUtil.setRequestHeaders(request, TEST_STRING, TEST_STRING, TEST_STRING,TEST_STRING,TEST_STRING);
    	headerValue = Blob.valueOf(TEST_STRING+':'+TEST_STRING); 
 	    authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
 	    System.assertEquals(authorizationHeader, request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION));
 	    System.assertEquals(TEST_STRING, request.getEndpoint());
    	System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE));
 	    System.assertEquals(LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT));
 		System.assertEquals(LitleConstants.REQUEST_HEADER_PLATFORM_VALUE, request.getHeader(LitleConstants.REQUEST_HEADER_PLATFORM));
 		System.assertEquals(TEST_STRING, request.getMethod());
 		System.assertEquals(TEST_STRING, request.getBody());
    }
    
    static testMethod void testGetBasicAuthorizationHeader() {
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
