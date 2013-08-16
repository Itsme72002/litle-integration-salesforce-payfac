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
