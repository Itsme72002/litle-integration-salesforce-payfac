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
public class HttpUtil {
	
	// Returns the http request for MP with the given method, endpoint, authorization header, content type header
	// accept header and request body
	public static HttpRequest getLitleMPHttpRequest(String requestMethod, String requestEndpoint, String authorizationHeader,
														String contentTypeHeader, String acceptHeader, String requestBody){
		HttpRequest request = new HttpRequest();
		if(String.isNotEmpty(requestEndpoint) && String.isNotEmpty(requestMethod) &&
			requestBody != null && String.isNotEmpty(acceptHeader) &&
			String.isNotEmpty(contentTypeHeader) && String.isNotEmpty(authorizationHeader)){
			request.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, authorizationHeader);
			request.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, contentTypeHeader);
			request.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, acceptHeader);
			request.setHeader(LitleConstants.REQUEST_HEADER_PLATFORM, LitleConstants.REQUEST_HEADER_PLATFORM_VALUE);
			request.setEndpoint(requestEndpoint);
			request.setMethod(requestMethod);
			if(!requestMethod.equalsIgnoreCase('GET')){
				request.setBody(requestBody);
			}
		}
		return request;
	}
	
	public static HttpRequest setRequestHeaders(HttpRequest request, String endPoint, String method, String body
									, String username, String password){
		if(request != null &&
			String.isNotEmpty(endPoint) &&
			String.isNotEmpty(method) &&
			body != null &&
			String.isNotEmpty(username) &&
			String.isNotEmpty(password)){
			// create header
	        request.setHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION, getBasicAuthorizationHeader(username, password));
	        request.setHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE, LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE);
			request.setHeader(LitleConstants.REQUEST_HEADER_ACCEPT, LitleConstants.REQUEST_HEADER_ACCEPT_VALUE);
			request.setHeader(LitleConstants.REQUEST_HEADER_PLATFORM, LitleConstants.REQUEST_HEADER_PLATFORM_VALUE);
			request.setEndpoint(endPoint);
			request.setMethod(method);
			request.setBody(body);
		}
		return request;
	}

	public static String getBasicAuthorizationHeader(String username, String password){
		Blob headerValue = Blob.valueOf(username+':'+password); //Enter username and password
        String authorizationHeader = LitleConstants.REQUEST_AUTH_TYPE + Encodingutil.base64Encode(headerValue);
        return authorizationHeader;
	}
}