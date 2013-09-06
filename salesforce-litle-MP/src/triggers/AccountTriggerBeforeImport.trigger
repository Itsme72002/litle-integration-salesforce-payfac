trigger AccountTriggerBeforeImport on Account (before insert, before update) {
    for(Account triggeredAccount : Trigger.new){
        if(String.isEmpty(triggeredAccount.PayFac_Portal_Link__c)
           && String.isNotEmpty(triggeredAccount.LitleLegalEntityId__c)
           && String.isNotEmpty(triggeredAccount.LitleSubMerchantId__c)
           && String.isNotEmpty(triggeredAccount.PayFacSubMerchantId__c)){
          SalesforceLitleMappingsObject__c mappingObject = MappingObjectUtil.getCurrentMappings();
          if(mappingObject != null){ 
              triggeredAccount.PayFac_Portal_Link__c = LitleEnvironment.getEnvironmentUrl(mappingObject.litleEnvironment__c)
									                  + LitleConstants.URL_SEPARATOR 
									                  + LitleConstants.PAY_FAC_PORTAL_URI 
									                  + LitleConstants.URL_SEPARATOR 
									                  + LitleConstants.LEGAL_ENTITY_META_UI_URI 
									                  + LitleConstants.URL_SEPARATOR
									                  + triggeredAccount.LitleLegalEntityId__c
									                  + LitleConstants.URL_SEPARATOR 
									                  + LitleConstants.SUBMERCHANT_META_UI_URI 
									                  + LitleConstants.URL_SEPARATOR
									                  + triggeredAccount.LitleSubMerchantId__c
									                  + LitleConstants.PAY_FAC_PORTAL_QUERY_STRING
									                  + triggeredAccount.PayFacSubMerchantId__c;
              triggeredAccount.LitleSubMerchantId__c = '';
              triggeredAccount.PayFacSubMerchantId__c='';
            }
        }
    }
}