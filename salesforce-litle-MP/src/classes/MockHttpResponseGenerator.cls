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
public class MockHttpResponseGenerator implements HttpCalloutMock{
	public Integer calledCount = 0;
	public Httpresponse legalEntityResponse;
	public Httpresponse subMerchantResponse;

	public MockHttpResponseGenerator(TestResponse leResponse, TestResponse smResponse){
		if(leResponse != null){
			legalEntityResponse = new Httpresponse();
			legalEntityResponse.setBody(leResponse.getResponseBody());
	    	legalEntityResponse.setStatusCode(leResponse.getStatusCode());
	    	legalEntityResponse.setStatus(leResponse.getStatusMessage());
		}else{
			calledCount = 1;
		}
    	
    	if(smResponse != null){
	    	subMerchantResponse = new Httpresponse();
	    	subMerchantResponse.setBody(smResponse.getResponseBody());
	    	subMerchantResponse.setStatusCode(smResponse.getStatusCode());
	    	subMerchantResponse.setStatus(smResponse.getStatusMessage());
    	}
	}
	
	
    public HttpResponse respond(HttpRequest req){
    	if(calledCount == 0){
    		calledCount ++;
	    	return legalEntityResponse;
    	}else{
    		return subMerchantResponse;
    	}
    }
}
