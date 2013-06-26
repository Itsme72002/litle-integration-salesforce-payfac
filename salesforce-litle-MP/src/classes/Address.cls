public class Address {
	private String streetAddress1;
	private String streetAddress2;
    private String city;
    private String stateProvince;
    private String postalCode;
    private String countryCode;
    private Boolean isStreetAddress1FromOpportunity;
    private Boolean isStreetAddress2FromOpportunity;
    private Boolean isCityFromOpportunity;
    private Boolean isStateProvinceFromOpportunity;
    private Boolean isPostalCodeFromOpportunity;
    private Boolean isCountryCodeFromOpportunity;
    
    public Address(){
	    isStreetAddress1FromOpportunity = false;
	    isStreetAddress2FromOpportunity = false;
	    isCityFromOpportunity = false;
	    isStateProvinceFromOpportunity = false;
	    isPostalCodeFromOpportunity = false;
	    isCountryCodeFromOpportunity = false;
    }
    
    public String getStreetAddress1() {
        return streetAddress1;
    }
    public void setStreetAddress1(String streetAddress1) {
        this.streetAddress1 = streetAddress1;
    }
    public String getStreetAddress2() {
        return streetAddress2;
    }
    public void setStreetAddress2(String streetAddress2) {
        this.streetAddress2 = streetAddress2;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getStateProvince() {
        return stateProvince;
    }
    public void setStateProvince(String stateProvince) {
        this.stateProvince = stateProvince;
    }
    public String getPostalCode() {
        return postalCode;
    }
    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
    public String getCountryCode() {
        return countryCode;
    }
    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }
    public Boolean getIsStreetAddress1FromOpportunity() {
        return isStreetAddress1FromOpportunity;
    }
    public void setIsStreetAddress1FromOpportunity(
            Boolean isStreetAddress1FromOpportunity) {
        this.isStreetAddress1FromOpportunity = isStreetAddress1FromOpportunity;
    }
    public Boolean getIsStreetAddress2FromOpportunity() {
        return isStreetAddress2FromOpportunity;
    }
    public void setIsStreetAddress2FromOpportunity(
            Boolean isStreetAddress2FromOpportunity) {
        this.isStreetAddress2FromOpportunity = isStreetAddress2FromOpportunity;
    }
    public Boolean getIsCityFromOpportunity() {
        return isCityFromOpportunity;
    }
    public void setIsCityFromOpportunity(Boolean isCityFromOpportunity) {
        this.isCityFromOpportunity = isCityFromOpportunity;
    }
    public Boolean getIsStateProvinceFromOpportunity() {
        return isStateProvinceFromOpportunity;
    }
    public void setIsStateProvinceFromOpportunity(
            Boolean isStateProvinceFromOpportunity) {
        this.isStateProvinceFromOpportunity = isStateProvinceFromOpportunity;
    }
    public Boolean getIsPostalCodeFromOpportunity() {
        return isPostalCodeFromOpportunity;
    }
    public void setIsPostalCodeFromOpportunity(Boolean isPostalCodeFromOpportunity) {
        this.isPostalCodeFromOpportunity = isPostalCodeFromOpportunity;
    }
    public Boolean getIsCountryCodeFromOpportunity() {
        return isCountryCodeFromOpportunity;
    }
    public void setIsCountryCodeFromOpportunity(Boolean isCountryCodeFromOpportunity) {
        this.isCountryCodeFromOpportunity = isCountryCodeFromOpportunity;
    }
}