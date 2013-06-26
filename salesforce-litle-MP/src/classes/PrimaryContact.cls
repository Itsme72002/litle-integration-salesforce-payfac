public class PrimaryContact {
	
	private String firstName;
	private String LastName;
    private String emailAddress;
    private String phone;
    private Boolean isFirstNameFromOpportunity;
    private Boolean isLastNameFromOpportunity;
    private Boolean isEmailAddressFromOpportunity;
    private Boolean isPhoneFromOpportunity;
    
    public PrimaryContact(){
    	isFirstNameFromOpportunity = false;
	    isLastNameFromOpportunity = false;
	    isEmailAddressFromOpportunity = false;
	    isPhoneFromOpportunity = false;
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
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
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
    public Boolean getIsEmailAddressFromOpportunity() {
        return isEmailAddressFromOpportunity;
    }
    public void setIsEmailAddressFromOpportunity(
            Boolean isEmailAddressFromOpportunity) {
        this.isEmailAddressFromOpportunity = isEmailAddressFromOpportunity;
    }
    public Boolean getIsPhoneFromOpportunity() {
        return isPhoneFromOpportunity;
    }
    public void setIsPhoneFromOpportunity(Boolean isPhoneFromOpportunity) {
        this.isPhoneFromOpportunity = isPhoneFromOpportunity;
    }
}