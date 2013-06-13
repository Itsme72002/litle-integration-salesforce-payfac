public class SubMerchantModel {
	//Select options values
	/*private String subMerchantStreetAddress1;
    private String subMerchantStreetAddress2;
    private String subMerchantCity;
    private String subMerchantStateProvince;
    private String subMerchantPostalCode;
    private String subMerchantCountryCode;*/
    private Address subMerchantAddress;
    private String subMerchantAmexMid;
    private String subMerchantBankAccountNumber;
    private String subMerchantBankRoutingNumber;
    private String subMerchantCreateCredentials;
    private String subMerchantCustomerServiceNumber;
    private String subMerchantDiscoverConveyMid;
    private String subMerchantHardCodeBillingDescriptor;
    private String subMerchantMaxTransactionAmount;
    private String subMerchantMerchantCategoryCode;
    private String subMerchantMerchantName;
    /*private String subMerchantFirstName;
    private String subMerchantLastName;
    private String subMerchantEmailAddress;
    private String subMerchantPhone;*/
    private PrimaryContact subMerchantPrimaryContact;
    private String subMerchantPspMerchantId;
    private String subMerchantUrl;
    private String subMerchanteCheckBillingDescriptor;
    private String subMerchanteCheckCompanyName;
    
    public SubMerchantModel(){
    	subMerchantAddress = new Address();
    	subMerchantPrimaryContact = new PrimaryContact();
    }
    
    /*public String getSubMerchantStreetAddress1(){
        return subMerchantStreetAddress1;
    }
    public void setSubMerchantStreetAddress1(String subMerchantStreetAddress1){
        this.subMerchantStreetAddress1 = subMerchantStreetAddress1;
    }
    public String getSubMerchantStreetAddress2(){
        return subMerchantStreetAddress2;
    }
    public void setSubMerchantStreetAddress2(String subMerchantStreetAddress2){
        this.subMerchantStreetAddress2 = subMerchantStreetAddress2;
    }
    public String getSubMerchantCity(){
        return subMerchantCity;
    }
    public void setSubMerchantCity(String subMerchantCity){
        this.subMerchantCity = subMerchantCity;
    }
    public String getSubMerchantStateProvince(){
        return subMerchantStateProvince;
    }
    public void setSubMerchantStateProvince(String subMerchantStateProvince){
        this.subMerchantStateProvince = subMerchantStateProvince;
    }
    public String getSubMerchantPostalCode(){
        return subMerchantPostalCode;
    }
    public void setSubMerchantPostalCode(String subMerchantPostalCode){
        this.subMerchantPostalCode = subMerchantPostalCode;
    }
    public String getSubMerchantCountryCode(){
        return subMerchantCountryCode;
    }
    public void setSubMerchantCountryCode(String subMerchantCountryCode){
        this.subMerchantCountryCode = subMerchantCountryCode;
    }*/
    
    public Address getSubMerchantAddress() {
        return subMerchantAddress;
    }

    public void setSubMerchantAddress(Address address) {
        this.subMerchantAddress = address;
    }
    
    public String getSubMerchantAmexMid(){
        return subMerchantAmexMid;
    }
    public void setSubMerchantAmexMid(String subMerchantAmexMid){
        this.subMerchantAmexMid = subMerchantAmexMid;
    }
    public String getSubMerchantBankAccountNumber(){
        return subMerchantBankAccountNumber;
    }
    public void setSubMerchantBankAccountNumber(String subMerchantBankAccountNumber){
        this.subMerchantBankAccountNumber = subMerchantBankAccountNumber;
    }
    public String getSubMerchantBankRoutingNumber(){
        return subMerchantBankRoutingNumber;
    }
    public void setSubMerchantBankRoutingNumber(String subMerchantBankRoutingNumber){
        this.subMerchantBankRoutingNumber = subMerchantBankRoutingNumber;
    }
    public String getSubMerchantCreateCredentials(){
        return subMerchantCreateCredentials;
    }
    public void setSubMerchantCreateCredentials(String subMerchantCreateCredentials){
        this.subMerchantCreateCredentials = subMerchantCreateCredentials;
    }
    public String getSubMerchantCustomerServiceNumber(){
        return subMerchantCustomerServiceNumber;
    }
    public void setSubMerchantCustomerServiceNumber(String subMerchantCustomerServiceNumber){
        this.subMerchantCustomerServiceNumber = subMerchantCustomerServiceNumber;
    }
    public String getSubMerchantDiscoverConveyMid(){
        return subMerchantDiscoverConveyMid;
    }
    public void setSubMerchantDiscoverConveyMid(String subMerchantDiscoverConveyMid){
        this.subMerchantDiscoverConveyMid = subMerchantDiscoverConveyMid;
    }
    public String getSubMerchantHardCodeBillingDescriptor(){
        return subMerchantHardCodeBillingDescriptor;
    }
    public void setSubMerchantHardCodeBillingDescriptor(String subMerchantHardCodeBillingDescriptor){
        this.subMerchantHardCodeBillingDescriptor = subMerchantHardCodeBillingDescriptor;
    }
    public String getSubMerchantMaxTransactionAmount(){
        return subMerchantMaxTransactionAmount;
    }
    public void setSubMerchantMaxTransactionAmount(String subMerchantMaxTransactionAmount){
        this.subMerchantMaxTransactionAmount = subMerchantMaxTransactionAmount;
    }
    public String getSubMerchantMerchantCategoryCode(){
        return subMerchantMerchantCategoryCode;
    }
    public void setSubMerchantMerchantCategoryCode(String subMerchantMerchantCategoryCode){
        this.subMerchantMerchantCategoryCode = subMerchantMerchantCategoryCode;
    }
    public String getSubMerchantMerchantName(){
        return subMerchantMerchantName;
    }
    public void setSubMerchantMerchantName(String subMerchantMerchantName){
        this.subMerchantMerchantName = subMerchantMerchantName;
    }
    
    public PrimaryContact getSubMerchantPrimaryContact() {
        return subMerchantPrimaryContact;
    }

    public void setSubMerchantPrimaryContact(PrimaryContact primaryContact) {
        this.subMerchantPrimaryContact = primaryContact;
    }
    /*public String getSubMerchantFirstName(){
        return subMerchantFirstName;
    }
    public void setSubMerchantFirstName(String subMerchantFirstName){
        this.subMerchantFirstName = subMerchantFirstName;
    }
    public String getSubMerchantLastName(){
        return subMerchantLastName;
    }
    public void setSubMerchantLastName(String subMerchantLastName){
        this.subMerchantLastName = subMerchantLastName;
    }
    public String getSubMerchantEmailAddress(){
        return subMerchantEmailAddress;
    }
    public void setSubMerchantEmailAddress(String subMerchantEmailAddress){
        this.subMerchantEmailAddress = subMerchantEmailAddress;
    }
    public String getSubMerchantPhone(){
        return subMerchantPhone;
    }
    public void setSubMerchantPhone(String subMerchantPhone){
        this.subMerchantPhone = subMerchantPhone;
    }*/
    public String getSubMerchantPspMerchantId(){
        return subMerchantPspMerchantId;
    }
    public void setSubMerchantPspMerchantId(String subMerchantPspMerchantId){
        this.subMerchantPspMerchantId = subMerchantPspMerchantId;
    }
    public String getSubMerchantUrl(){
        return subMerchantUrl;
    }
    public void setSubMerchantUrl(String subMerchantUrl){
        this.subMerchantUrl = subMerchantUrl;
    }
    public String getSubMerchanteCheckBillingDescriptor(){
        return subMerchanteCheckBillingDescriptor;
    }
    public void setSubMerchanteCheckBillingDescriptor(String subMerchanteCheckBillingDescriptor){
        this.subMerchanteCheckBillingDescriptor = subMerchanteCheckBillingDescriptor;
    }
    public String getSubMerchanteCheckCompanyName(){
        return subMerchanteCheckCompanyName;
    }
    public void setSubMerchanteCheckCompanyName(String subMerchanteCheckCompanyName){
        this.subMerchanteCheckCompanyName = subMerchanteCheckCompanyName;
    }    
}