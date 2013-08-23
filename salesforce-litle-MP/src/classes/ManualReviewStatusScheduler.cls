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
global class ManualReviewStatusScheduler implements Schedulable{
	
	global static String scheduleIt(String cron){
		ManualReviewStatusScheduler m = new ManualReviewStatusScheduler();
		return System.schedule('ManualReviewStatusScheduler', cron, m);
	}
	
	//implement execute method
	global void execute(SchedulableContext sc){
		scheduleManualReviews();
	}
	
	@future(callout=true)
	public static void scheduleManualReviews(){
		//get all the response logs where manual review is the response code
		List<LitleRequestResponseLog__c> litleRequestResponseLogs = 
		[select name,
				legalEntityId__c, 
				legalEntityEndpoint__c,
				legalEntityResponseCode__c,
				subMerchantAcceptHeader__c, 
				subMerchantAuthorizationHeader__c, 
				subMerchantContentTypeHeader__c, 
				Account__c, 
				Opportunity__c,
				sObjectType__c, 
				createSubMerchantRequestXml__c 
					from LitleRequestResponseLog__c 
			where legalEntityResponseCode__c= :LitleConstants.RESPONSE_MANUAL_REVIEW
			and Log_Source__c =:LitleConstants.LOG_SOURCE_GET_LITLE_MID];
		if(litleRequestResponseLogs != null && litleRequestResponseLogs.size() > 0){
				for (litleRequestResponseLog__c litleRequestResponse: litleRequestResponseLogs){
					//check if all fields are present
					if(areAllRequiredFieldsPresentInLogObject(litleRequestResponse)){
					litleRequestResponseLog__c schedulerLog = new litleRequestResponseLog__c();
					schedulerLog.Log_Source__c = LitleConstants.LOG_SOURCE_SCHEDULER;
					String litleMid;
					String submerchantId;
					String payfacUrl;
					Http h = new Http();
					String endPoint = litleRequestResponse.legalEntityEndpoint__c + LitleConstants.URL_SEPARATOR + litleRequestResponse.legalEntityId__c;
					HttpRequest legalEntityRequest = HttpUtil.getLitleMPHttpRequest(LitleConstants.RETRIEVE_HTTP_REQUEST_METHOD,
																		endPoint, 
																		litleRequestResponse.subMerchantAuthorizationHeader__c, 
																		litleRequestResponse.subMerchantContentTypeHeader__c, 
																		litleRequestResponse.subMerchantAcceptHeader__c, 
																		'');									
					LoggingUtil.logCreateLegalEntityRequest(legalEntityRequest, schedulerLog); 
					HttpResponse leHttpResponse = new HttpResponse();
					try{
						leHttpResponse = h.send(legalEntityRequest);
						LoggingUtil.logCreateLegalEntityResponse(leHttpResponse, schedulerLog);
						if(leHttpResponse != null && leHttpResponse.getStatusCode() == LitleConstants.RETRIEVE_LEGAL_ENTITY_SUCCESS_RESPONSE_CODE){
							LegalEntityResponse leResponse = new LegalEntityResponse();
							LegalEntityResponseService leService = new LegalEntityResponseService();
							leResponse = leService.populateLegalEntityResponse(leResponse, leHttpResponse.getBody(), false);
							// response success, check its litle response code
							String legalEntityResponseCode = leResponse.getResponseCode();
							String legalEntityResponseDescription = leResponse.getResponseDespcription();
							litleMid = legalEntityResponseCode + ' : ' + legalEntityResponseDescription;
							//update the value of response code in the log object
							schedulerLog.legalEntityResponseCode__c = legalEntityResponseCode;
							schedulerLog.legalEntityId__c = leResponse.getLegalEntityId();
							litleRequestResponse.legalEntityResponseCode__c = legalEntityResponseCode;
							if(String.isNotEmpty(legalEntityResponseCode) && legalEntityResponseCode.equals(LitleConstants.RESPONSE_APPROVED)){
								// legal entity approved, make the sub merchant request
								h = new Http();
								endPoint = litleRequestResponse.legalEntityEndpoint__c +
										   LitleConstants.URL_SEPARATOR + litleRequestResponse.legalEntityId__c + 
										   LitleConstants.URL_SEPARATOR + LitleConstants.SUBMERCHANT_URI;
								HttpRequest subMerchantRequest = HttpUtil.getLitleMPHttpRequest(LitleConstants.CREATE_HTTP_REQUEST_METHOD,
																		endPoint, 
																		litleRequestResponse.subMerchantAuthorizationHeader__c, 
																		litleRequestResponse.subMerchantContentTypeHeader__c, 
																		litleRequestResponse.subMerchantAcceptHeader__c, 
																		litleRequestResponse.createSubMerchantRequestXml__c);
								LoggingUtil.logCreateSubMerchantRequest(subMerchantRequest, schedulerLog);
								HttpResponse subMerchantResponse = new HttpResponse();
								try{
									subMerchantResponse = h.send(subMerchantRequest);
									// log new response
									LoggingUtil.logCreateSubMerchantResponse(subMerchantResponse, schedulerLog);
									LoggingUtil.logCreateSubMerchantResponse(subMerchantResponse, litleRequestResponse);
									if(subMerchantResponse != null && subMerchantResponse.getStatusCode() == LitleConstants.SUB_MERCHANT_SUCCESS_RESPONSE_CODE){
										// response success, extract the sub merchant id
										litleMid = XmlUtil.extractXmlTagText(subMerchantResponse, LitleConstants.XML_TAG_MERCHANT_IDENT_STRING);
										submerchantId = XmlUtil.extractXmlTagText(subMerchantResponse, LitleConstants.XML_TAG_SUBMERCHANT_ID);
						        		payfacUrl = litleRequestResponse.legalEntityEndpoint__c.removeEnd(LitleConstants.URL_SEPARATOR + LitleConstants.LEGAL_ENTITY_URI) + LitleConstants.URL_SEPARATOR 
						        			+ LitleConstants.PAY_FAC_PORTAL_URI + LitleConstants.URL_SEPARATOR + LitleConstants.LEGAL_ENTITY_META_UI_URI + LitleConstants.URL_SEPARATOR 
						        			+ litleRequestResponse.legalEntityId__c + LitleConstants.URL_SEPARATOR + LitleConstants.SUBMERCHANT_META_UI_URI
						        			+ LitleConstants.URL_SEPARATOR + submerchantId;
									}
								}catch(System.CalloutException e){
									System.debug('Sub-Merchant Request Callout error: '+ e);
						        	System.debug(subMerchantResponse.toString());
								}
							}
							
							//save kyc info
							LitleKYCService kycService = new LitleKYCService();
							kycService.saveOrUpdateAllKYCObjects(litleRequestResponse.Opportunity__c, litleRequestResponse.Account__c, leResponse);
							//update the respective sobject with the new values
							if(litleRequestResponse.sObjectType__c.equalsIgnoreCase('Account')){
								//update litle mid on account page.
								try{
									Account account = [select litle_Mid__c from Account where Id = :litleRequestResponse.Account__c];
									account.litle_Mid__c = litleMid;
									account.PayFac_Portal_Link__c = payfacUrl;
									update account;
								}catch(Queryexception e){
									System.debug('Error in query to fetch litle mid from account id: '+ litleRequestResponse.Account__c+ ', '+ e);
								}catch(DMLException e){
									System.debug('Error in updating litle mid for account id: '+ litleRequestResponse.Account__c+ ', '+ e);
								}
							}else if(litleRequestResponse.sObjectType__c.equalsIgnoreCase('Opportunity')){
								//update litle mid on opportunity page.
								try{
									Opportunity opportunity = [select litle_Mid__c from Opportunity where Id = :litleRequestResponse.Opportunity__c];
									opportunity.litle_Mid__c = litleMid;
									opportunity.PayFac_Portal_Link__c = payfacUrl;
									update opportunity;
								}catch(Queryexception e){
									System.debug('Error in query to fetch litle mid from opportunity id: '+ litleRequestResponse.Opportunity__c+ ', '+ e);
								}catch(DMLException e){
									System.debug('Error in updating litle mid for opportunity id: '+ litleRequestResponse.Opportunity__c+ ', '+ e);
								}
							}
						}
					}catch(System.CalloutException e){
				       	System.debug('Legal Entity Request Callout error: '+ e);
					}
					LoggingUtil.logSObjectDetails(litleRequestResponse.Account__c, litleRequestResponse.Opportunity__c, schedulerLog);
					try{
						insert schedulerLog;					
					}catch(DMLException e){
						System.debug('Error inserting scheduler log for response log id: '+ litleRequestResponse.name);
					}
				}
				//update log
				try{
					update litleRequestResponse;					
				}catch(DMLException e){
					System.debug('Error updating log for id: '+ litleRequestResponse.name);
				}				
			}
		}
	}
	
	public static Boolean areAllRequiredFieldsPresentInLogObject(litleRequestResponseLog__c litleRequestResponse){
		return String.isNotEmpty(litleRequestResponse.legalEntityId__c) && 
				String.isNotEmpty(litleRequestResponse.legalEntityEndpoint__c) &&
				String.isNotEmpty(litleRequestResponse.legalEntityResponseCode__c) &&
				String.isNotEmpty(litleRequestResponse.subMerchantAcceptHeader__c) && 
				String.isNotEmpty(litleRequestResponse.subMerchantAuthorizationHeader__c) && 
				String.isNotEmpty(litleRequestResponse.subMerchantContentTypeHeader__c) && 
				(String.isNotEmpty(litleRequestResponse.Account__c) || String.isNotEmpty(litleRequestResponse.Opportunity__c)) && 
				String.isNotEmpty(litleRequestResponse.sObjectType__c) && 
				String.isNotEmpty(litleRequestResponse.createSubMerchantRequestXml__c);
	}
}