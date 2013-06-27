public class HttpUtil {
	
	// Returns the http request for MP with the given method, enfpoint, authorization header, content type header
	// accept header and request body
	public static HttpRequest getLitleMPHttpRequest(String requestMethod, String requestEndpoint, String authorizationHeader,
														String contentTypeHeader, String acceptHeader, String requestBody){
		HttpRequest request = new HttpRequest();
		request.setHeader('Authorization', authorizationHeader);
		request.setHeader('Content-Type', contentTypeHeader);
		request.setHeader('Accept', acceptHeader);
		request.setEndpoint(requestEndpoint);
		request.setMethod(requestMethod);
		request.setBody(requestBody);
		return request;
	}

	public static String getBasicAuthorizationHeader(String username, String password){
		Blob headerValue = Blob.valueOf(username+':'+password); //Enter username and password
        String authorizationHeader = 'Basic ' + Encodingutil.base64Encode(headerValue);
        return authorizationHeader;
	}
}