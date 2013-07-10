global class ManualReviewStatusScheduler implements Schedulable{
	
	
	
	//call the schedule method 
	global static String scheduleIt(){
		ManualReviewStatusScheduler m = new ManualReviewStatusScheduler();
		return System.schedule('ManualReviewStatusScheduler', LitleConstants.SCHEDULER_CRON_EXP, m);
	}
	
	//implement execute method
	global void execute(SchedulableContext sc){
		scheduleManualReviews();
	}
	
	@future(callout=true)
	public static void scheduleManualReviews(){
		//get all the response logs where manual review is the response code
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = 
		[select legalEntityId__c, 
				legalEntityResponseCode__c,
				subMerchantAcceptHeader__c, 
				subMerchantAuthorizationHeader__c, 
				subMerchantContentTypeHeader__c, 
				sObjectId__c, 
				sObjectType__c, 
				createSubMerchantRequestXml__c 
					from LitleRequestResponseLog__c 
			where legalEntityResponseCode__c= :LitleConstants.RESPONSE_MANUAL_REVIEW];
		if(litleRequestResponseLogs != null && litleRequestResponseLogs.size() > 0){
				for (litleRequestResponseLog__c litleRequestResponse: litleRequestResponseLogs){
					//check if all fields are present
					if(String.isNotEmpty(litleRequestResponse.legalEntityId__c) && 
						String.isNotEmpty(litleRequestResponse.legalEntityResponseCode__c) &&
						String.isNotEmpty(litleRequestResponse.subMerchantAcceptHeader__c) && 
						String.isNotEmpty(litleRequestResponse.subMerchantAuthorizationHeader__c) && 
						String.isNotEmpty(litleRequestResponse.subMerchantContentTypeHeader__c) && 
						String.isNotEmpty(litleRequestResponse.sObjectId__c) && 
						String.isNotEmpty(litleRequestResponse.sObjectType__c) && 
						String.isNotEmpty(litleRequestResponse.createSubMerchantRequestXml__c)){
					Http h = new Http();
					String endPoint = LitleConstants.LEGAL_ENTITY_REQUEST_ENDPOINT +'/' + litleRequestResponse.legalEntityId__c;
					HttpRequest legalEntityRequest = HttpUtil.getLitleMPHttpRequest(LitleConstants.RETRIEVE_HTTP_REQUEST_METHOD,
																		endPoint, 
																		litleRequestResponse.subMerchantAuthorizationHeader__c, 
																		litleRequestResponse.subMerchantContentTypeHeader__c, 
																		litleRequestResponse.subMerchantAcceptHeader__c, 
																		'');
					HttpResponse legalEntityResponse = new HttpResponse();
					// get the legal entity status from the GET method
					try{
						//legalEntityResponse = h.send(legalEntityRequest);
						legalEntityResponse = mockApprovedLegalEntity();
						///////////////////////////////////////////////////////
						// check http response code 
						if(legalEntityResponse != null && legalEntityResponse.getStatusCode() == LitleConstants.LEGAL_ENTITY_SUCCESS_RESPONSE_CODE){
							// response success, check its litle response code
							String legalEntityResponseCode = XmlUtil.extractXmlTagText(legalEntityResponse, 'responseCode');
							if(String.isNotEmpty(legalEntityResponseCode) && legalEntityResponseCode.equals(LitleConstants.RESPONSE_APPROVED)){
								// legal entity approved, make the sub merchant request
								h = new Http();
								endPoint = LitleConstants.LEGAL_ENTITY_REQUEST_ENDPOINT +'/' + litleRequestResponse.legalEntityId__c+ '/'+'submerchant';
								HttpRequest subMerchantRequest = HttpUtil.getLitleMPHttpRequest(LitleConstants.CREATE_HTTP_REQUEST_METHOD,
																		endPoint, 
																		litleRequestResponse.subMerchantAuthorizationHeader__c, 
																		litleRequestResponse.subMerchantContentTypeHeader__c, 
																		litleRequestResponse.subMerchantAcceptHeader__c, 
																		litleRequestResponse.createSubMerchantRequestXml__c);
								HttpResponse subMerchantResponse = new HttpResponse();
								try{
									//subMerchantResponse = h.send(subMerchantRequest);
									subMerchantResponse = mockApprovedSubMerchant();
									// check http response code 
									if(subMerchantResponse != null && subMerchantResponse.getStatusCode() == LitleConstants.SUB_MERCHANT_SUCCESS_RESPONSE_CODE){
										// response success, extract the sub merchant id
										String subMerchantId = XmlUtil.extractXmlTagText(subMerchantResponse, 'subMerchantId');
										if(String.isNotEmpty(subMerchantId)){
											// valid sub merchant id, update the sobject
											// update response in log, TODO add responses
											litleRequestResponse.legalEntityResponseCode__c = LitleConstants.RESPONSE_APPROVED;
											// store the litle mid
											if(litleRequestResponse.sObjectType__c.equalsIgnoreCase('Account')){
												//update litle mid on account page.
												try{
													Account account = [select litle_Mid__c from Account where Id = :litleRequestResponse.sObjectId__c];
													account.litle_Mid__c = subMerchantId;
													update account;
												}catch(Queryexception e){
													System.debug('Error in query to fetch litle mid from account id: '+ litleRequestResponse.sObjectId__c+ ', '+ e);
												}catch(DMLException e){
													System.debug('Error in updating litle mid for account id: '+ litleRequestResponse.sObjectId__c+ ', '+ e);
												}
											}else if(litleRequestResponse.sObjectType__c.equalsIgnoreCase('Opportunity')){
												//update litle mid on account page.
												try{
													Opportunity opportunity = [select litle_Mid__c from Opportunity where Id = :litleRequestResponse.sObjectId__c];
													opportunity.litle_Mid__c = subMerchantId;
													update opportunity;
												}catch(Queryexception e){
													System.debug('Error in query to fetch litle mid from opportunity id: '+ litleRequestResponse.sObjectId__c+ ', '+ e);
												}catch(DMLException e){
													System.debug('Error in updating litle mid for opportunity id: '+ litleRequestResponse.sObjectId__c+ ', '+ e);
												}
											} 
											
											//update log
											try{
												update litleRequestResponse;
											}catch(DMLException e){
												System.debug('Error updating log for id: '+ litleRequestResponse.sObjectId__c 
																	+' of type: ' + litleRequestResponse.sObjectType__c);
											}
										}
									}
								}catch(System.CalloutException e){
									System.debug('Sub-Merchant Request Callout error: '+ e);
						        	System.debug(subMerchantResponse.toString());
								}
							}
						}
					}catch(System.CalloutException e){
				       	System.debug('Legal Entity Request Callout error: '+ e);
					}
				}
			}
		}
	}
	
	/* For demo only*/
	public static Httpresponse mockApprovedLegalEntity(){
		String STATUS_MESSAGE = 'Success';
	    Integer STATUS_CODE = 201;
	    String RESPONSE_CODE = '10';
	    String RESPONSE_DESCRIPTION = 'Approved';
	    String TRANSACTION_ID = '82821536819527712';
	    String LEGAL_ENTITY_ID = '82821536565085998';
		HttpResponse res = new HttpResponse();
    	String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
						 + '<legalEntityCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard">'
						 + '<transactionId>'+TRANSACTION_ID+'</transactionId>'
						 + '<legalEntityId>'+LEGAL_ENTITY_ID+'</legalEntityId>'
						 + '<principals>'
						 + '<principal>'
						 + '<principalId>1</principalId>'
						 + '<firstName>p first</firstName>'
						 + '<lastName>p last</lastName>'
						 + '</principal>'
						 + '</principals>'
						 + '<responseCode>'+RESPONSE_CODE+'</responseCode>'
						 + '<responseDescription>'+RESPONSE_DESCRIPTION+'</responseDescription>'
						 + '<backgroundCheckResults>'
						 + '<business>'
						 + '<verificationResult>'
						 + '<overallScore>'
						 + '<score>50</score>'
						 + '<description>Business is verified on multiple sources with no contradictory findings</description>'
						 + '</overallScore>'
						 + '<nameAddressTaxIdAssociation/>'
						 + '<nameAddressPhoneAssociation/>'
						 + '<verificationIndicators>'
						 + '<nameVerified>false</nameVerified>'
						 + '<addressVerified>false</addressVerified>'
						 + '<cityVerified>false</cityVerified>'
						 + '<stateVerified>false</stateVerified>'
						 + '<zipVerified>false</zipVerified>'
						 + '<phoneVerified>false</phoneVerified>'
						 + '<taxIdVerified>false</taxIdVerified>'
						 + '</verificationIndicators>'
						 + '<riskIndicators>'
						 + '<riskIndicator>'
						 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
						 + '<description>The input zip code belongs to a post office box</description>'
						 + '</riskIndicator>'
						 + '</riskIndicators>'
						 + '</verificationResult>'
						 + '</business>'
						 + '<principal>'
						 + '<verificationResult>'
						 + '<overallScore>'
						 + '<score>50</score>'
						 + '<description>Full name, address, phone , SSN verified</description>'
						 + '</overallScore>'
						 + '<nameAddressSsnAssociation/>'
						 + '<nameAddressPhoneAssociation/>'
						 + '<verificationIndicators>'
						 + '<nameVerified>false</nameVerified>'
						 + '<addressVerified>false</addressVerified>'
						 + '<phoneVerified>false</phoneVerified>'
						 + '<ssnVerified>false</ssnVerified>'
						 + '<dobVerified>false</dobVerified>'
						 + '</verificationIndicators>'
						 + '<riskIndicators>'
						 + '<riskIndicator>'
						 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
						 + '<description>The input zip code belongs to a post office box</description>'
						 + '</riskIndicator>'
						 + '</riskIndicators>'
						 + '</verificationResult>'
						 + '</principal>'
						 + '<businessToPrincipalAssociation>'
						 + '<score>50</score>'
						 + '<description>Association found between the person and the company in the Company Contacts data</description>'
						 + '</businessToPrincipalAssociation>'
						 + '</backgroundCheckResults>'
						 + '</legalEntityCreateResponse>';
    	res.setBody(response);
    	res.setStatusCode(STATUS_CODE);
    	res.setStatus(STATUS_MESSAGE);
    	return res;
	} 
	
	
	
    public static HttpResponse mockApprovedSubMerchant(){
    	String STATUS_MESSAGE = 'Success';
	    Integer STATUS_CODE = 200;
		String SUB_MERCHANT_ID = '1100003';
    	
    	HttpResponse res = new HttpResponse();
    	String response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
						 + '<subMerchantCreateResponse xmlns="http://psp.litle.com/api/merchant/onboard" duplicate="true">'
						 + '<transactionId>82821240469914003</transactionId>'
						 + '<subMerchantId>'+SUB_MERCHANT_ID+'</subMerchantId>'
						 + '<merchantIdentString>01100003</merchantIdentString>'
						 + '</subMerchantCreateResponse>';
    	res.setBody(response);
    	res.setStatusCode(200);
    	res.setStatus(STATUS_MESSAGE);
    	return res;
    }
}