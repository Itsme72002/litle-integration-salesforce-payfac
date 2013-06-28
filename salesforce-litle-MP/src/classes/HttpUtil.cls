public class HttpUtil {
	
	// Returns the http request for MP with the given method, endpoint, authorization header, content type header
	// accept header and request body
	public static HttpRequest getLitleMPHttpRequest(String requestMethod, String requestEndpoint, String authorizationHeader,
														String contentTypeHeader, String acceptHeader, String requestBody){
		HttpRequest request = new HttpRequest();
		if(String.isNotEmpty(requestEndpoint) && String.isNotEmpty(requestMethod) &&
			requestBody != null && String.isNotEmpty(acceptHeader) &&
			String.isNotEmpty(contentTypeHeader) && String.isNotEmpty(authorizationHeader)){
			request.setHeader('Authorization', authorizationHeader);
			request.setHeader('Content-Type', contentTypeHeader);
			request.setHeader('Accept', acceptHeader);
			request.setEndpoint(requestEndpoint);
			request.setMethod(requestMethod);
			request.setBody(requestBody);
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
	        request.setHeader('Authorization', getBasicAuthorizationHeader(username, password));
	        request.setHeader('Content-Type', LitleConstants.REQUEST_HEADER_CONTENT_TYPE);
			request.setHeader('Accept', LitleConstants.REQUEST_HEADER_ACCEPT);
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