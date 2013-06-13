public class LegalEntityModel {
    
    // TODO Delete, class not used

    //Select options values
    private String legalEntityName;
    private String legalEntityType;
    private String legalEntityDoingBusinessAs;
    /*private String legalEntityStreetAddress1;
    private String legalEntityStreetAddress2;
    private String legalEntityCity;
    private String legalEntityStateProvince;
    private String legalEntityPostalCode;
    private String legalEntityCountryCode;*/
    private String legalEntityContactPhone;
    private Address legalEntityAddress;
    private Principal legalEntityPrincipal;
    /*private String legalEntityFirstName;
    private String legalEntityLastName;
    private String legalEntityEmailAddress;
    private String legalEntityContactPhone;
    private String legalEntityDateOfBirth;
    private String legalEntityDriversLicense;
    private String legalEntityDriversLicenseState;
    private String legalEntitySsn;*/
    private String legalEntityTaxId;
    private PCI legalEntityPci;
    /*private String legalEntityIsExclusiveToPsp;
    private String legalEntityIsPciComplianceValidated;
    private String legalEntityPciLevel;
    private String legalEntityScanningVendor;
    private String legalEntityQualifiedSecurityAssessor;
    private String legalEntityMostRecentlyPassedScan;
    private String legalEntityReportOnCompliance;*/
    private String legalEntityAnnualCreditCardSalesVolume;
    private String legalEntityHasAcceptedCreditCards;
    private String legalEntityId;
    
    public LegalEntityModel(){
    	legalEntityAddress = new Address();
    	legalEntityPrincipal = new Principal();
    	legalEntityPci = new PCI();
    }
    
    public String getLegalEntityId() {
        return legalEntityId;
    }

    public void setLegalEntityId(String legalEntityId) {
        this.legalEntityId = legalEntityId;
    }
    
    public String getLegalEntityName() {
        return legalEntityName;
    }

    public void setLegalEntityName(String legalEntityName) {
        this.legalEntityName = legalEntityName;
    }

    public String getLegalEntityType() {
        return legalEntityType;
    }

    public void setLegalEntityType(String legalEntityType) {
        this.legalEntityType = legalEntityType;
    }

    public String getLegalEntityDoingBusinessAs() {
        return legalEntityDoingBusinessAs;
    }

    public void setLegalEntityDoingBusinessAs(String legalEntityDoingBusinessAs) {
        this.legalEntityDoingBusinessAs = legalEntityDoingBusinessAs;
    }
    
    public Address getLegalEntityAddress() {
        return legalEntityAddress;
    }

    public void setLegalEntityAddress(Address address) {
        this.legalEntityAddress = address;
    }

	public Principal getLegalEntityPrincipal() {
        return legalEntityPrincipal;
    }

    public void setLegalEntityPrincipal(Principal principal) {
        this.legalEntityPrincipal = principal;
    }
    
    public String getLegalEntityContactPhone() {
        return legalEntityContactPhone;
    }

    public void setLegalEntityContactPhone(String legalEntityContactPhone) {
        this.legalEntityContactPhone = legalEntityContactPhone;
    }
    /*
    
    public String getLegalEntityFirstName() {
        return legalEntityFirstName;
    }

    public void setLegalEntityFirstName(String legalEntityFirstName) {
        this.legalEntityFirstName = legalEntityFirstName;
    }

    public String getLegalEntityLastName() {
        return legalEntityLastName;
    }

    public void setLegalEntityLastName(String legalEntityLastName) {
        this.legalEntityLastName = legalEntityLastName;
    }

    public String getLegalEntityEmailAddress() {
        return legalEntityEmailAddress;
    }

    public void setLegalEntityEmailAddress(String legalEntityEmailAddress) {
        this.legalEntityEmailAddress = legalEntityEmailAddress;
    }

    public String getLegalEntityContactPhone() {
        return legalEntityContactPhone;
    }

    public void setLegalEntityContactPhone(String legalEntityContactPhone) {
        this.legalEntityContactPhone = legalEntityContactPhone;
    }

    public String getLegalEntityDateOfBirth() {
        return legalEntityDateOfBirth;
    }

    public void setLegalEntityDateOfBirth(String legalEntityDateOfBirth) {
        this.legalEntityDateOfBirth = legalEntityDateOfBirth;
    }

    public String getLegalEntityDriversLicense() {
        return legalEntityDriversLicense;
    }

    public void setLegalEntityDriversLicense(String legalEntityDriversLicense) {
        this.legalEntityDriversLicense = legalEntityDriversLicense;
    }

    public String getLegalEntityDriversLicenseState() {
        return legalEntityDriversLicenseState;
    }

    public void setLegalEntityDriversLicenseState(
            String legalEntityDriversLicenseState) {
        this.legalEntityDriversLicenseState = legalEntityDriversLicenseState;
    }

    public String getLegalEntitySsn() {
        return legalEntitySsn;
    }

    public void setLegalEntitySsn(String legalEntitySsn) {
        this.legalEntitySsn = legalEntitySsn;
    }*/

    public String getLegalEntityTaxId() {
        return legalEntityTaxId;
    }

    public void setLegalEntityTaxId(String legalEntityTaxId) {
        this.legalEntityTaxId = legalEntityTaxId;
    }
    
    public PCI getLegalEntityPci() {
        return legalEntityPci;
    }

    public void setLegalEntityPci(PCI legalEntityPci) {
        this.legalEntityPci = legalEntityPci;
    }

    /*public String getLegalEntityIsExclusiveToPsp() {
        return legalEntityIsExclusiveToPsp;
    }

    public void setLegalEntityIsExclusiveToPsp(
            String legalEntityIsExclusiveToPsp) {
        this.legalEntityIsExclusiveToPsp = legalEntityIsExclusiveToPsp;
    }

    public String getLegalEntityIsPciComplianceValidated() {
        return legalEntityIsPciComplianceValidated;
    }

    public void setLegalEntityIsPciComplianceValidated(
            String legalEntityIsPciComplianceValidated) {
        this.legalEntityIsPciComplianceValidated = legalEntityIsPciComplianceValidated;
    }

    public String getLegalEntityPciLevel() {
        return legalEntityPciLevel;
    }

    public void setLegalEntityPciLevel(String legalEntityPciLevel) {
        this.legalEntityPciLevel = legalEntityPciLevel;
    }

    public String getLegalEntityScanningVendor() {
        return legalEntityScanningVendor;
    }

    public void setLegalEntityScanningVendor(String legalEntityScanningVendor) {
        this.legalEntityScanningVendor = legalEntityScanningVendor;
    }

    public String getLegalEntityQualifiedSecurityAssessor() {
        return legalEntityQualifiedSecurityAssessor;
    }

    public void setLegalEntityQualifiedSecurityAssessor(
            String legalEntityQualifiedSecurityAssessor) {
        this.legalEntityQualifiedSecurityAssessor = legalEntityQualifiedSecurityAssessor;
    }

    public String getLegalEntityMostRecentlyPassedScan() {
        return legalEntityMostRecentlyPassedScan;
    }

    public void setLegalEntityMostRecentlyPassedScan(
            String legalEntityMostRecentlyPassedScan) {
        this.legalEntityMostRecentlyPassedScan = legalEntityMostRecentlyPassedScan;
    }

    public String getLegalEntityReportOnCompliance() {
        return legalEntityReportOnCompliance;
    }

    public void setLegalEntityReportOnCompliance(
            String legalEntityReportOnCompliance) {
        this.legalEntityReportOnCompliance = legalEntityReportOnCompliance;
    }*/

    public String getLegalEntityAnnualCreditCardSalesVolume() {
        return legalEntityAnnualCreditCardSalesVolume;
    }

    public void setLegalEntityAnnualCreditCardSalesVolume(
            String legalEntityAnnualCreditCardSalesVolume) {
        this.legalEntityAnnualCreditCardSalesVolume = legalEntityAnnualCreditCardSalesVolume;
    }

    public String getLegalEntityHasAcceptedCreditCards() {
        return legalEntityHasAcceptedCreditCards;
    }

    public void setLegalEntityHasAcceptedCreditCards(
            String legalEntityHasAcceptedCreditCards) {
        this.legalEntityHasAcceptedCreditCards = legalEntityHasAcceptedCreditCards;
    }
    }