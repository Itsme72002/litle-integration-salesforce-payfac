public class PCI {
	private String isExclusiveToPsp;
	private String isPciComplianceValidated;
    private String pciLevel;
    private String scanningVendor;
    private String qualifiedSecurityAssessor;
    private String mostRecentlyPassedScan;
    private String reportOnCompliance;
    private Boolean isIsExclusiveToPspFromOpportunity;
    private Boolean isIsPciComplianceValidatedFromOpportunity;
    private Boolean isPciLevelFromOpportunity;
    private Boolean isScanningVendorFromOpportunity;
    private Boolean isQualifiedSecurityAssessorFromOpportunity;
    private Boolean isMostRecentlyPassedScanFromOpportunity;
    private Boolean isReportOnComplianceFromOpportunity;
    
    public PCI(){
	    isIsExclusiveToPspFromOpportunity = false;
	    isIsPciComplianceValidatedFromOpportunity = false;
	    isPciLevelFromOpportunity = false;
	    isScanningVendorFromOpportunity = false;
	    isQualifiedSecurityAssessorFromOpportunity = false;
	    isMostRecentlyPassedScanFromOpportunity = false;
	    isReportOnComplianceFromOpportunity = false;
    }
    public String getIsExclusiveToPsp() {
        return isExclusiveToPsp;
    }
    public void setIsExclusiveToPsp(String isExclusiveToPsp) {
        this.isExclusiveToPsp = isExclusiveToPsp;
    }
    public String getIsPciComplianceValidated() {
        return isPciComplianceValidated;
    }
    public void setIsPciComplianceValidated(String isPciComplianceValidated) {
        this.isPciComplianceValidated = isPciComplianceValidated;
    }
    public String getPciLevel() {
        return pciLevel;
    }
    public void setPciLevel(String pciLevel) {
        this.pciLevel = pciLevel;
    }
    public String getScanningVendor() {
        return scanningVendor;
    }
    public void setScanningVendor(String scanningVendor) {
        this.scanningVendor = scanningVendor;
    }
    public String getQualifiedSecurityAssessor() {
        return qualifiedSecurityAssessor;
    }
    public void setQualifiedSecurityAssessor(String qualifiedSecurityAssessor) {
        this.qualifiedSecurityAssessor = qualifiedSecurityAssessor;
    }
    public String getMostRecentlyPassedScan() {
        return mostRecentlyPassedScan;
    }
    public void setMostRecentlyPassedScan(String mostRecentlyPassedScan) {
        this.mostRecentlyPassedScan = mostRecentlyPassedScan;
    }
    public String getReportOnCompliance() {
        return reportOnCompliance;
    }
    public void setReportOnCompliance(String reportOnCompliance) {
        this.reportOnCompliance = reportOnCompliance;
    }
    public Boolean getIsIsExclusiveToPspFromOpportunity() {
        return isIsExclusiveToPspFromOpportunity;
    }
    public void setIsIsExclusiveToPspFromOpportunity(
            Boolean isIsExclusiveToPspFromOpportunity) {
        this.isIsExclusiveToPspFromOpportunity = isIsExclusiveToPspFromOpportunity;
    }
    public Boolean getIsIsPciComplianceValidatedFromOpportunity() {
        return isIsPciComplianceValidatedFromOpportunity;
    }
    public void setIsIsPciComplianceValidatedFromOpportunity(
            Boolean isIsPciComplianceValidatedFromOpportunity) {
        this.isIsPciComplianceValidatedFromOpportunity = isIsPciComplianceValidatedFromOpportunity;
    }
    public Boolean getIsPciLevelFromOpportunity() {
        return isPciLevelFromOpportunity;
    }
    public void setIsPciLevelFromOpportunity(Boolean isPciLevelFromOpportunity) {
        this.isPciLevelFromOpportunity = isPciLevelFromOpportunity;
    }
    public Boolean getIsScanningVendorFromOpportunity() {
        return isScanningVendorFromOpportunity;
    }
    public void setIsScanningVendorFromOpportunity(
            Boolean isScanningVendorFromOpportunity) {
        this.isScanningVendorFromOpportunity = isScanningVendorFromOpportunity;
    }
    public Boolean getIsQualifiedSecurityAssessorFromOpportunity() {
        return isQualifiedSecurityAssessorFromOpportunity;
    }
    public void setIsQualifiedSecurityAssessorFromOpportunity(
            Boolean isQualifiedSecurityAssessorFromOpportunity) {
        this.isQualifiedSecurityAssessorFromOpportunity = isQualifiedSecurityAssessorFromOpportunity;
    }
    public Boolean getIsMostRecentlyPassedScanFromOpportunity() {
        return isMostRecentlyPassedScanFromOpportunity;
    }
    public void setIsMostRecentlyPassedScanFromOpportunity(
            Boolean isMostRecentlyPassedScanFromOpportunity) {
        this.isMostRecentlyPassedScanFromOpportunity = isMostRecentlyPassedScanFromOpportunity;
    }
    public Boolean getIsReportOnComplianceFromOpportunity() {
        return isReportOnComplianceFromOpportunity;
    }
    public void setIsReportOnComplianceFromOpportunity(
            Boolean isReportOnComplianceFromOpportunity) {
        this.isReportOnComplianceFromOpportunity = isReportOnComplianceFromOpportunity;
    }
}