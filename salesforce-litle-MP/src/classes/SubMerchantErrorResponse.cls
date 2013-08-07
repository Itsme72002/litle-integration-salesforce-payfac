public class SubMerchantErrorResponse implements TestResponse {

	public static final String STATUS_MESSAGE = 'Unauthorized';
    public static final Integer STATUS_CODE = 400;
	public static final String ERROR_MESSAGE = 'Error in request:Could not find requested object.';
	
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