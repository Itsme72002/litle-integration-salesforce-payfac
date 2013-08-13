public class LegalEntityResponse {

	private String transactionId;
	private String legalEntityId;
	private Principal responsePrincipal;
	private String responseCode;
	private String responseDespcription;
	private VerificationResult businessVerificationResult;
	private VerificationResult principalVerificationResult;
	private DescriptionDetails businessToPrincipalAssociation;
	private String backgroundCheckDecisionNotes;
	private BankruptcyData responseBankruptcyData;
	private LienResult responseLienResult;
	
	public LegalEntityResponse(){
		responsePrincipal = new Principal();
		businessVerificationResult = new VerificationResult();
		principalVerificationResult = new VerificationResult();
		businessToPrincipalAssociation = new DescriptionDetails();
		responseBankruptcyData = new BankruptcyData();
		responseLienResult = new LienResult();
	}
	
	public String getTransactionId() {
        return transactionId;
    }
    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }
    public String getLegalEntityId() {
        return legalEntityId;
    }
    public void setLegalEntityId(String legalEntityId) {
        this.legalEntityId = legalEntityId;
    }
    public Principal getResponsePrincipal() {
        return responsePrincipal;
    }
    public void setResponsePrincipal(Principal responsePrincipal) {
        this.responsePrincipal = responsePrincipal;
    }
    public String getResponseCode() {
        return responseCode;
    }
    public void setResponseCode(String responseCode) {
        this.responseCode = responseCode;
    }
    public String getResponseDespcription() {
        return responseDespcription;
    }
    public void setResponseDespcription(String responseDespcription) {
        this.responseDespcription = responseDespcription;
    }
    public VerificationResult getBusinessVerificationResult() {
        return businessVerificationResult;
    }
    public void setBusinessVerificationResult(
            VerificationResult businessVerificationResult) {
        this.businessVerificationResult = businessVerificationResult;
    }
    public VerificationResult getPrincipalVerificationResult() {
        return principalVerificationResult;
    }
    public void setPrincipalVerificationResult(
            VerificationResult principalVerificationResult) {
        this.principalVerificationResult = principalVerificationResult;
    }
    public DescriptionDetails getBusinessToPrincipalAssociation() {
        return businessToPrincipalAssociation;
    }
    public void setBusinessToPrincipalAssociation(
            DescriptionDetails businessToPrincipalAssociation) {
        this.businessToPrincipalAssociation = businessToPrincipalAssociation;
    }
    public String getBackgroundCheckDecisionNotes() {
        return backgroundCheckDecisionNotes;
    }
    public void setBackgroundCheckDecisionNotes(String backgroundCheckDecisionNotes) {
        this.backgroundCheckDecisionNotes = backgroundCheckDecisionNotes;
    }
    public BankruptcyData getResponseBankruptcyData() {
        return responseBankruptcyData;
    }
    public void setResponseBankruptcyData(BankruptcyData responseBankruptcyData) {
        this.responseBankruptcyData = responseBankruptcyData;
    }
    public LienResult getResponseLienResult() {
        return responseLienResult;
    }
    public void setResponseLienResult(LienResult responseLienResult) {
        this.responseLienResult = responseLienResult;
    }
	
}