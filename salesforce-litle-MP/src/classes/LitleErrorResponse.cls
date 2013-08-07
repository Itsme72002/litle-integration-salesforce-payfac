public class LitleErrorResponse implements TestResponse{
	
	public static final String STATUS_MESSAGE = 'Unauthorized';
    public static final Integer STATUS_CODE = 401;
	public static final String ERROR_MESSAGE = 'You are not authorized to access this resource. Please check your credentials.';
	
	public static final String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
											 + '<errorResponse>'
											 + '<errors>'
											 + '<error>'+ERROR_MESSAGE+'</error>'
											 + '</errors>'
											 + '</errorResponse>';
	
	public String getStatusMessage(){
		return STATUS_MESSAGE;
	}
	
	public Integer getStatusCode(){
		return STATUS_CODE;
	}
	
	public String getResponseBody(){
		return response;
	}											 

}