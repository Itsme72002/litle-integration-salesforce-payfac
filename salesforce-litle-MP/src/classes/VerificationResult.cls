public class VerificationResult {
	private DescriptionDetails overallScore;
	private DescriptionDetails nameAddressTaxOrSsnIdAssociation;
	private DescriptionDetails nameAddressPhoneAssociation;
	private VerificationIndicators verificationIndicator;
	private List<DescriptionDetails> riskIndicators;
	
	public VerificationResult(){
		overallScore = new DescriptionDetails();
		nameAddressPhoneAssociation = new DescriptionDetails();
		nameAddressTaxOrSsnIdAssociation = new DescriptionDetails();
		verificationIndicator = new VerificationIndicators();
		riskIndicators = new List<DescriptionDetails>();
	}
	
	
    public DescriptionDetails getOverallScore() {
        return overallScore;
    }
    public void setOverallScore(DescriptionDetails overallScore) {
        this.overallScore = overallScore;
    }
    public DescriptionDetails getNameAddressTaxOrSsnIdAssociation() {
        return nameAddressTaxOrSsnIdAssociation;
    }
    public void setNameAddressTaxOrSsnIdAssociation(
            DescriptionDetails nameAddressTaxOrSsnIdAssociation) {
        this.nameAddressTaxOrSsnIdAssociation = nameAddressTaxOrSsnIdAssociation;
    }
    public DescriptionDetails getNameAddressPhoneAssociation() {
        return nameAddressPhoneAssociation;
    }
    public void setNameAddressPhoneAssociation(
            DescriptionDetails nameAddressPhoneAssociation) {
        this.nameAddressPhoneAssociation = nameAddressPhoneAssociation;
    }
    public VerificationIndicators getVerificationIndicator() {
        return verificationIndicator;
    }
    public void setVerificationIndicator(
            VerificationIndicators verificationIndicator) {
        this.verificationIndicator = verificationIndicator;
    }
    public List<DescriptionDetails> getRiskIndicators() {
        return riskIndicators;
    }
    public void setRiskIndicators(List<DescriptionDetails> riskIndicators) {
        this.riskIndicators = riskIndicators;
    }

}