public class  Principal{
	private String principalId;
	private Address address;
    private String firstName;
    private String lastName;
    private String emailAddress;
    private String contactPhone;
    private String dateOfBirth;
    private String driversLicense;
    private String driversLicenseState;
    private String ssn;
    
    private Boolean isSsnFromOpportunity;
    private Boolean isDriversLicenseStateFromOpportunity;
    private Boolean isDriversLicenseFromOpportunity;
    private Boolean isDateOfBirthFromOpportunity;
    private Boolean isContactPhoneFromOpportunity;
    private Boolean isEmailAddressFromOpportunity;
    private Boolean isFirstNameFromOpportunity;
    private Boolean isLastNameFromOpportunity;
    
    public Principal(){
    	address = new Address();    	
    	isSsnFromOpportunity = false;
	    isDriversLicenseStateFromOpportunity = false;
	    isDriversLicenseFromOpportunity = false;
	    isDateOfBirthFromOpportunity = false;
	    isContactPhoneFromOpportunity = false;
	    isEmailAddressFromOpportunity = false;
	    isFirstNameFromOpportunity = false;
	    isLastNameFromOpportunity = false;
    }
    
    public String getPrincipalId() {
        return principalId;
    }
    public void setPrincipalId(String principalId) {
        this.principalId = principalId;
    }
    public Address getAddress() {
        return address;
    }
    public void setAddress(Address address) {
        this.address = address;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getEmailAddress() {
        return emailAddress;
    }
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    public String getContactPhone() {
        return contactPhone;
    }
    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }
    public String getDateOfBirth() {
        return dateOfBirth;
    }
    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    public String getDriversLicense() {
        return driversLicense;
    }
    public void setDriversLicense(String driversLicense) {
        this.driversLicense = driversLicense;
    }
    public String getDriversLicenseState() {
        return driversLicenseState;
    }
    public void setDriversLicenseState(String driversLicenseState) {
        this.driversLicenseState = driversLicenseState;
    }
    public String getSsn() {
        return ssn;
    }
    public void setSsn(String ssn) {
        this.ssn = ssn;
    }
    public Boolean getIsSsnFromOpportunity() {
        return isSsnFromOpportunity;
    }
    public void setIsSsnFromOpportunity(Boolean isSsnFromOpportunity) {
        this.isSsnFromOpportunity = isSsnFromOpportunity;
    }
    public Boolean getIsDriversLicenseStateFromOpportunity() {
        return isDriversLicenseStateFromOpportunity;
    }
    public void setIsDriversLicenseStateFromOpportunity(
            Boolean isDriversLicenseStateFromOpportunity) {
        this.isDriversLicenseStateFromOpportunity = isDriversLicenseStateFromOpportunity;
    }
    public Boolean getIsDriversLicenseFromOpportunity() {
        return isDriversLicenseFromOpportunity;
    }
    public void setIsDriversLicenseFromOpportunity(
            Boolean isDriversLicenseFromOpportunity) {
        this.isDriversLicenseFromOpportunity = isDriversLicenseFromOpportunity;
    }
    public Boolean getIsDateOfBirthFromOpportunity() {
        return isDateOfBirthFromOpportunity;
    }
    public void setIsDateOfBirthFromOpportunity(Boolean isDateOfBirthFromOpportunity) {
        this.isDateOfBirthFromOpportunity = isDateOfBirthFromOpportunity;
    }
    public Boolean getIsContactPhoneFromOpportunity() {
        return isContactPhoneFromOpportunity;
    }
    public void setIsContactPhoneFromOpportunity(
            Boolean isContactPhoneFromOpportunity) {
        this.isContactPhoneFromOpportunity = isContactPhoneFromOpportunity;
    }
    public Boolean getIsEmailAddressFromOpportunity() {
        return isEmailAddressFromOpportunity;
    }
    public void setIsEmailAddressFromOpportunity(
            Boolean isEmailAddressFromOpportunity) {
        this.isEmailAddressFromOpportunity = isEmailAddressFromOpportunity;
    }
    public Boolean getIsFirstNameFromOpportunity() {
        return isFirstNameFromOpportunity;
    }
    public void setIsFirstNameFromOpportunity(Boolean isFirstNameFromOpportunity) {
        this.isFirstNameFromOpportunity = isFirstNameFromOpportunity;
    }
    public Boolean getIsLastNameFromOpportunity() {
        return isLastNameFromOpportunity;
    }
    public void setIsLastNameFromOpportunity(Boolean isLastNameFromOpportunity) {
        this.isLastNameFromOpportunity = isLastNameFromOpportunity;
    }
}