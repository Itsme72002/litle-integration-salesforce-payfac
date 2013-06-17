public class LoggingUtil {
	
	public static void logSObjectDetails(String accid, String oppid, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null){
			if(String.isNotEmpty(accid)){
				//insert account details
				Account thisAccount = [select id, name from Account where id=:accid];
				fillSObjectLogObject('Account', thisAccount.Name, thisAccount.Id, litleRequestResponseLog);
			}else if(String.isNotEmpty(oppid)){
				//insert opportunity details
				Opportunity thisOpportunity = [select id, name from Opportunity where id=:oppid];
				fillSObjectLogObject('Opportunity', thisOpportunity.Name, thisOpportunity.Id, litleRequestResponseLog);
			}
		}
	}
	
	public static void fillSObjectLogObject(String sObjectType, String sObjectName, String sObjectId, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null){
			litleRequestResponseLog.sObjectType__c = sObjectType;
			litleRequestResponseLog.sObjectName__c = sObjectName;
			litleRequestResponseLog.sObjectId__c = sObjectId;
		}
	}
	
	public static void logCreateLegalEntityRequest(HttpRequest request, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null){
			litleRequestResponseLog.createLegalEntityRequestDate__c = Datetime.now();
			litleRequestResponseLog.createLegalEntityRequestXml__c = getRequestParamsLog(request);
		}
	}
	
	public static void logCreateSubMerchantRequest(HttpRequest request, LitleRequestResponseLog__c litleRequestResponseLog){
		if(litleRequestResponseLog != null){
			litleRequestResponseLog.createSubMerchantRequestDate__c = Datetime.now();
			litleRequestResponseLog.createSubMerchantRequestXml__c = getRequestParamsLog(request);
		}
	}
	
	public static void logCreateLegalEntityResponse(HttpResponse response, LitleRequestResponseLog__c litleRequestResponseLog){
		system.debug('!!response:'+response);
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
			return 'Authorization: '+ request.getHeader('Authorization') + '\n'
							+ 'Content-Type: '+ request.getHeader('Content-Type') + '\n'
							+ 'Accept: '+ request.getHeader('Accept') + '\n'
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
			   //headers.put(s,res.getHeader(s));
			   if(String.isNotEmpty(header)){
				   System.debug('header: ' + header + ' value: ' + response.getHeader(header));
				   responseParams += header + ' :' + response.getHeader(header) + '\n';
			   }
			}
			responseParams += String.valueOf(response.getBody());
			return responseParams;
		}
		return null;		 
	}
}