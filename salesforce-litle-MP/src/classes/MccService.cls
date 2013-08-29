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
public class MccService {
	
	public List<String> getAllMccForUser(String username, String password, String endpoint){
		List<String> mccList;
		if(String.isNotEmpty(username) && String.isNotEmpty(password) && String.isNotEmpty(endpoint)){
			Http h = new Http();
			String authorizationHeader = HttpUtil.getBasicAuthorizationHeader(username, password);
			HttpRequest mccRequest = HttpUtil.getLitleMPHttpRequest(LitleConstants.MCC_HTTP_REQUEST_METHOD,
																	endpoint + LitleConstants.URL_SEPARATOR + LitleConstants.MCC_URI,
																	authorizationHeader, 
																	LitleConstants.REQUEST_HEADER_CONTENT_TYPE_VALUE, 
																	LitleConstants.REQUEST_HEADER_ACCEPT_VALUE, '');
			try{
				Httpresponse mccResponse = h.send(mccRequest);	
				if(mccResponse !=null && mccResponse.getStatusCode() == LitleConstants.MCC_SUCCESS_RESPONSE_CODE){
					mccList = XmlUtil.extractListOfTagText(mccResponse, 'approvedMccs', 'approvedMcc');
				}
			}catch(CalloutException e){
	            System.debug('Mcc Request Callout error: '+ e +', '+ e.getMessage());
	            System.debug('Mcc Request: '+mccRequest.toString());
			}
        }														
		return mccList;
	}
	
	public List<Selectoption> getMccSelectOptionsForUser(String username, String password, String endpoint){
		List<Selectoption> mccSelectOptions = new List<Selectoption>();
		List<String> mccList = getAllMccForUser(username, password, endpoint);
		if(mccList != null && !mccList.isEmpty()){
			for(String mcc: mccList){
				mccSelectOptions.add(new Selectoption(mcc, mcc));
			}
		}
		return mccSelectOptions;
	}

}