/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
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