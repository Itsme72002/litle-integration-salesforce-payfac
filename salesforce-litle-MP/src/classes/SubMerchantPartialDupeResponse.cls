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
public class SubMerchantPartialDupeResponse implements TestResponse {

	public static final String STATUS_MESSAGE = 'Success';
	public static final Integer STATUS_CODE = 201;
	
	public static final String response = 
					'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
					'<subMerchantCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard" duplicate="true">'+
					    '<transactionId>82822768704144779</transactionId>'+
					    '<subMerchantId>1011</subMerchantId>'+
					    '<merchantIdentString>01100012</merchantIdentString>'+
					'</subMerchantCreateResponse>';
						 
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
