public class LegalEntityResponseService {

	public LegalEntityResponse populateLegalEntityResponse(LegalEntityResponse leResponse, String xml, boolean isOriginalLegalEntityPresent){
        if(leResponse != null && String.isNotEmpty(xml) && isOriginalLegalEntityPresent != null){
            leResponse.setTransactionId(XmlUtil.getTagTextFromXml(xml, LitleConstants.XML_TAG_TRANSACTION_ID));
            //Get principal details
            String principalDetailXml = XmlUtil.getXmlOfNode(xml, 'principal');
            leResponse.setResponsePrincipal(getPrincipalFromXml(principalDetailXml));
            if(isOriginalLegalEntityPresent){
                // extract from original legal entity
                String orignalEntityXml = XmlUtil.getXmlOfNode(xml, 'originalLegalEntity');
                if(String.isNotEmpty(orignalEntityXml)){
                    leResponse.setResponseCode(XmlUtil.getTagTextFromXml(orignalEntityXml, LitleConstants.XML_TAG_RESPONSE_CODE));
                    leResponse.setResponseDespcription(XmlUtil.getTagTextFromXml(orignalEntityXml, LitleConstants.XML_TAG_RESPONSE_DESCRIPTION));
                    leResponse.setLegalEntityId(XmlUtil.getTagTextFromXml(orignalEntityXml, LitleConstants.XML_TAG_LEGALENTITY_ID));
                    String backgroundResultsXml = XmlUtil.getXmlOfNode(orignalEntityXml, 'backgroundCheckResults');
                    String businessXml = XmlUtil.getXmlOfNode(backgroundResultsXml, 'business');
                    leResponse.setBusinessVerificationResult(getVerificationResultFromXml(businessXml));
                    String principalXml = XmlUtil.getXmlOfNode(backgroundResultsXml, 'principal');
                    leResponse.setPrincipalVerificationResult(getVerificationResultFromXml(principalXml));
                }
            }else{
                leResponse.setResponseCode(XmlUtil.getTagTextFromXml(xml, LitleConstants.XML_TAG_RESPONSE_CODE));
                leResponse.setResponseDespcription(XmlUtil.getTagTextFromXml(xml, LitleConstants.XML_TAG_RESPONSE_DESCRIPTION));
                leResponse.setLegalEntityId(XmlUtil.getTagTextFromXml(xml, LitleConstants.XML_TAG_LEGALENTITY_ID));
                String backgroundResultsXml = XmlUtil.getXmlOfNode(xml, 'backgroundCheckResults');
                String businessXml = XmlUtil.getXmlOfNode(backgroundResultsXml, 'business');
                leResponse.setBusinessVerificationResult(getVerificationResultFromXml(businessXml));
                String principalXml = XmlUtil.getXmlOfNode(backgroundResultsXml, 'principal');
                leResponse.setPrincipalVerificationResult(getVerificationResultFromXml(principalXml));
            }
        }
        return leResponse;
    }
    
    public Principal getPrincipalFromXml(String xml){
        Principal principal = new Principal();
        if(String.isNotEmpty(xml)){
            principal.setFirstName(XmlUtil.getTagTextFromXml(xml,'firstName'));
            principal.setLastName(XmlUtil.getTagTextFromXml(xml,'lastName'));
            principal.setPrincipalId(XmlUtil.getTagTextFromXml(xml,'principalId'));
        }
        return principal;
    }
    
    public VerificationResult getVerificationResultFromXml(String xml){
        VerificationResult vResult = new VerificationResult();
        if(String.isNotEmpty(xml)){
            String overallScoreXml = XmlUtil.getXmlOfNode(xml, 'overallScore');
            vResult.setOverallScore(getDescriptionDetailFromXml(overallScoreXml,'score'));
            String taxAssnXml = XmlUtil.getXmlOfNode(xml, 'nameAddressTaxIdAssociation');
            vResult.setNameAddressTaxOrSsnIdAssociation(getDescriptionDetailFromXml(taxAssnXml,'code'));
            String phoneAssnXml = XmlUtil.getXmlOfNode(xml, 'nameAddressPhoneAssociation');
            vResult.setNameAddressPhoneAssociation(getDescriptionDetailFromXml(phoneAssnXml,'code'));
            String vIndicatorXml = XmlUtil.getXmlOfNode(xml, 'verificationIndicators');
            vResult.setVerificationIndicator(getVerificationIndicatorFromXml(vIndicatorXml));
            String riskIndicatorsXml = XmlUtil.getXmlOfNode(xml, 'riskIndicators');
            vResult.setRiskIndicators(getRiskIndicators(riskIndicatorsXml));
        }
        return vResult;
    }
    
    public List<DescriptionDetails> getRiskIndicators(String xml){
        List<DescriptionDetails> riskIndicators = new List<DescriptionDetails>();
        if(String.isNotEmpty(xml)){
            List<String> riskIndicatorXmls = XmlUtil.getListOfChildrenOfNode(xml, 'riskIndicator');
            for(String riskIndicatorXml : riskIndicatorXmls){
                riskIndicators.add(getDescriptionDetailFromXml(riskIndicatorXml, 'code'));
            }
        }
        return riskIndicators;
    }
    
    public DescriptionDetails getDescriptionDetailFromXml(String xml, String codeOrScoreTagName){
        DescriptionDetails descDetails = new DescriptionDetails();
        if(String.isNotEmpty(xml) && String.isNotEmpty(codeOrScoreTagName)){
            descDetails.setCodeOrScore(XmlUtil.getTagTextFromXml(xml,codeOrScoreTagName));
            descDetails.setDescription(XmlUtil.getTagTextFromXml(xml,'description'));
        }
        return descDetails;
    }
    
    public VerificationIndicators getVerificationIndicatorFromXml(String xml){
        VerificationIndicators vIndicators = new VerificationIndicators();
        if(String.isNotEmpty(xml)){
            vIndicators.setNameVerified(XmlUtil.getTagTextFromXml(xml,'nameVerified'));
            vIndicators.setAddressVerified(XmlUtil.getTagTextFromXml(xml,'addressVerified'));
            vIndicators.setCityVerified(XmlUtil.getTagTextFromXml(xml,'cityVerified'));
            vIndicators.setZipVerified(XmlUtil.getTagTextFromXml(xml,'zipVerified'));
            vIndicators.setPhoneVerified(XmlUtil.getTagTextFromXml(xml,'phoneVerified'));
            vIndicators.setTaxIdVerified(XmlUtil.getTagTextFromXml(xml,'taxIdVerified'));
            vIndicators.setDobVerified(XmlUtil.getTagTextFromXml(xml,'dobVerified'));
            vIndicators.setSsnVerified(XmlUtil.getTagTextFromXml(xml,'ssnVerified'));
        }
        return vIndicators;
    }
}