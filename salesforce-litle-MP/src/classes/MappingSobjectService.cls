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
public class MappingSobjectService {
	
	public String accountId;
	public String opportunityId;
	
	public MappingSobjectService(String accountId, String opportunityId){
		this.accountId = accountId;
		this.opportunityId = opportunityId;
	}
	
	public String fetchMappedValue(String salesforceField, String defaultValue, Boolean isDefaultDisabled, String selectedOpportunityId){
		String mappedValue;
        if(!isDefaultDisabled){
            mappedValue = defaultValue;
        }else{
            String sObjectName, sObjectFieldName;
            //split saved mapping to get sobject type and its field name
            List<String> customObjectFieldParts = splitSObjectNameAndField(salesforceField);
            if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
                sObjectName = customObjectFieldParts.get(0);
                sObjectFieldName = customObjectFieldParts.get(1);
            }
            if(String.isNotEmpty(sObjectName) && String.isNotEmpty(sObjectFieldName)){
                if(sObjectName.equalsIgnoreCase('Account') && String.isNotEmpty(accountId)){
                    // we have account id, get the field value
                    mappedValue = QueryUtil.getAccountFieldValue(sObjectFieldName, accountId);   
                }else if(sObjectName.equalsIgnoreCase('Opportunity')){
                    if(String.isNotEmpty(opportunityId)){
                        //request from opportunity page, and we have the opportunity id
                        mappedValue = QueryUtil.getOpportunityFieldValue(sObjectFieldName, opportunityId);
                    }else if(String.isNotEmpty(accountId) && String.isNotEmpty(selectedOpportunityId)){
                        mappedValue = QueryUtil.getOpportunityFieldValue(sObjectFieldName, selectedOpportunityId);}
                    }
                }    
            }
        return mappedValue;
    }
    
    public Boolean isOpportunityMappedAndAccessedFromAccount(String salesforceField, Boolean isDefaultDisabled){
    	Boolean isOpportunityMapped = false;
    	if(isDefaultDisabled && String.isNotEmpty(accountId)){
            String sObjectName, sObjectFieldName;
            //split saved mapping to get sobject type and its field name
            List<String> customObjectFieldParts = splitSObjectNameAndField(salesforceField);
            if(customObjectFieldParts != null && customObjectFieldParts.size() == 2){
                sObjectName = customObjectFieldParts.get(0);
                if(String.isNotEmpty(sObjectName) && sObjectName.equalsIgnoreCase('Opportunity')){
	                    isOpportunityMapped = true;
                }    
            }
        }
    	return isOpportunityMapped;
    }
    
    private List<String> splitSObjectNameAndField(String concatenatedSring){
        List<String> customObjectFieldParts = new List<String>();
        if(String.isNotEmpty(concatenatedSring)){
            customObjectFieldParts = concatenatedSring.split('\\.', 2);
        }
        return customObjectFieldParts;
    }

}
