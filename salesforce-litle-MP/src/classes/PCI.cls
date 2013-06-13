public class PCI {
	private String isExclusiveToPsp;
    private String isPciComplianceValidated;
    private String pciLevel;
    private String scanningVendor;
    private String qualifiedSecurityAssessor;
    private String mostRecentlyPassedScan;
    private String reportOnCompliance;
    
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
}