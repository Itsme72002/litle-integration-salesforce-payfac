public class LoggingUtil {
	
	public static void logSObjectDetails(String accid, String oppid, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null){
			if(String.isNotEmpty(oppid)){
				//get opportunity details
				try{
					Opportunity thisOpportunity = [select name from Opportunity where id=:oppid];
					fillSObjectLogObject('Opportunity', thisOpportunity.Name, oppid, litleRequestResponseLog);
				}catch (Queryexception e){
					System.debug('Error fetching opportunity details for logging'+ e);
				}
			}else if(String.isNotEmpty(accid)){
				//get account details
				try{
					Account thisAccount = [select name from Account where id=:accid];
					fillSObjectLogObject('Account', thisAccount.Name, accid, litleRequestResponseLog);
				}catch (Queryexception e){
					System.debug('Error fetching account details for logging'+ e);
				}
			} 
		}
	}
	
	public static void fillSObjectLogObject(String sObjectType, String sObjectName, String sObjectId, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null){
			litleRequestResponseLog.sObjectType__c = sObjectType;
			litleRequestResponseLog.sObjectName__c = sObjectName;
			if(String.isNotEmpty(sObjectType) && sObjectType.equals('Account')){
				litleRequestResponseLog.Account__c = sObjectId;
			}else if(String.isNotEmpty(sObjectType) && sObjectType.equals('Opportunity')){
				litleRequestResponseLog.Opportunity__c = sObjectId;
			}
		}
	}
	
	public static void logCreateLegalEntityRequest(HttpRequest request, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null && request != null){
			litleRequestResponseLog.createLegalEntityRequestDate__c = Datetime.now();
			litleRequestResponseLog.legalEntityEndpoint__c = request.getEndpoint();
			litleRequestResponseLog.legalEntityAcceptHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT);
			litleRequestResponseLog.legalEntityContentTypeHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE);
			litleRequestResponseLog.legalEntityAuthorizationHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION);
			litleRequestResponseLog.createLegalEntityRequestXml__c = request.getBody();
		}
	}
	
	public static void logCreateSubMerchantRequest(HttpRequest request, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null && request != null){
			litleRequestResponseLog.createSubMerchantRequestDate__c = Datetime.now();
			litleRequestResponseLog.subMerchantEndpoint__c = request.getEndpoint();
			litleRequestResponseLog.subMerchantAcceptHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT);
			litleRequestResponseLog.subMerchantContentTypeHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE);
			litleRequestResponseLog.subMerchantAuthorizationHeader__c = request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION);
			litleRequestResponseLog.createSubMerchantRequestXml__c = request.getBody();
		}
	}
	
	public static void logCreateLegalEntityResponse(HttpResponse response, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null && response != null){
			litleRequestResponseLog.createLegalEntityResponseDate__c = Datetime.now();
	    	litleRequestResponseLog.createLegalEntityResponseXml__c = getResponseParamsLog(response);
	    	litleRequestResponseLog.createLegalEntityResponseStatusCode__c = String.valueOf(response.getStatusCode());
	    	litleRequestResponseLog.createLegalEntityResponseStatusMessage__c = response.getStatus();
		}
	}
	
	public static void logCreateSubMerchantResponse(HttpResponse response, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null && response != null){
			litleRequestResponseLog.createSubMerchantResponseDate__c = Datetime.now();
	    	litleRequestResponseLog.createSubMerchantResponseXml__c = getResponseParamsLog(response);
	    	litleRequestResponseLog.createSubMerchantResponseStatusCode__c = String.valueOf(response.getStatusCode());
	    	litleRequestResponseLog.createSubMerchantResponseStatusMessage__c = response.getStatus();
		}
	}

	//returns the request headers and body from the given http request
	public static String getRequestParamsLog(HttpRequest request){
		if(request != null){
			return 'Authorization: '+ request.getHeader(LitleConstants.REQUEST_HEADER_AUTHORIZATION) + '\n'
							+ 'Content-Type: '+ request.getHeader(LitleConstants.REQUEST_HEADER_CONTENT_TYPE) + '\n'
							+ 'Accept: '+ request.getHeader(LitleConstants.REQUEST_HEADER_ACCEPT) + '\n'
							+ String.valueOf(request.getBody());
		}
		return null;
	}
	
	// returns the response headers and body from the given http response
	public static String getResponseParamsLog(HttpResponse response){
		//get the list of header names (keys)
		if(response != null){
			String[] headerkeys = response.getHeaderKeys();
			String responseParams = '';
			//iterate through they keys, and populate your map
			for(String header : headerkeys){
			   if(String.isNotEmpty(header)){
				   responseParams += header + ' :' + response.getHeader(header) + '\n';
			   }
			}
			responseParams += String.valueOf(response.getBody());
			return responseParams;
		}
		return null;		 
	}
}