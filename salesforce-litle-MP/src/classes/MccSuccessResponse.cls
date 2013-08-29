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
public class MccSuccessResponse implements TestResponse{
	public static final String STATUS_MESSAGE = 'Success';
    public static Integer STATUS_CODE = 200;
    public static final String MCC1 = '5960';
    public static final String MCC2 = '5964';
    public static final String MCC3 = '5965';
    public static final String MCC4 = '8220';
    public static final String TRANSACTION_ID = '82823030098822067';
    
    public static final String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' +
											'<approvedMccResponse xmlns="http://psp.litle.com/api/merchant/onboard">' +
											   '<transactionId>'+TRANSACTION_ID+'</transactionId>' +
											    '<approvedMccs>' +
											        '<approvedMcc>'+MCC1+'</approvedMcc>' +
											        '<approvedMcc>'+MCC2+'</approvedMcc>' +
											        '<approvedMcc>'+MCC3+'</approvedMcc>' +
											        '<approvedMcc>'+MCC4+'</approvedMcc>' +
											    '</approvedMccs>' +
											'</approvedMccResponse>';
								 
						 
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