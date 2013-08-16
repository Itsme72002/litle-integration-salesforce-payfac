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
