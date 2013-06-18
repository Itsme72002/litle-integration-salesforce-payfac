public class SubMerchantResponse {
	
	private String transactionId;
	private String subMerchantId;
	private String merchantIdentString;
	private Credential userCredential;
	private Credential payPageCredential;
	private Address originalSubMerchantAddress;
	private String amexMid;
	private String bankAccountNumber;
	private String bankRoutingNumber;
	private String customerServiceNumber;
	private String discoverConveyMid;
	private String hardCodedBillingDescriptor;
	private String maxTransactionAmount;
	private String merchantCategoryCode;
	private String merchantName;
	private String url;
	private String disabled;
	
    public String getTransactionId() {
        return transactionId;
    }
    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }
    public String getSubMerchantId() {
        return subMerchantId;
    }
    public void setSubMerchantId(String subMerchantId) {
        this.subMerchantId = subMerchantId;
    }
    public String getMerchantIdentString() {
        return merchantIdentString;
    }
    public void setMerchantIdentString(String merchantIdentString) {
        this.merchantIdentString = merchantIdentString;
    }
    public Credential getUserCredential() {
        return userCredential;
    }
    public void setUserCredential(Credential userCredential) {
        this.userCredential = userCredential;
    }
    public Credential getPayPageCredential() {
        return payPageCredential;
    }
    public void setPayPageCredential(Credential payPageCredential) {
        this.payPageCredential = payPageCredential;
    }
    public Address getOriginalSubMerchantAddress() {
        return originalSubMerchantAddress;
    }
    public void setOriginalSubMerchantAddress(Address originalSubMerchantAddress) {
        this.originalSubMerchantAddress = originalSubMerchantAddress;
    }
    public String getAmexMid() {
        return amexMid;
    }
    public void setAmexMid(String amexMid) {
        this.amexMid = amexMid;
    }
    public String getBankAccountNumber() {
        return bankAccountNumber;
    }
    public void setBankAccountNumber(String bankAccountNumber) {
        this.bankAccountNumber = bankAccountNumber;
    }
    public String getBankRoutingNumber() {
        return bankRoutingNumber;
    }
    public void setBankRoutingNumber(String bankRoutingNumber) {
        this.bankRoutingNumber = bankRoutingNumber;
    }
    public String getCustomerServiceNumber() {
        return customerServiceNumber;
    }
    public void setCustomerServiceNumber(String customerServiceNumber) {
        this.customerServiceNumber = customerServiceNumber;
    }
    public String getDiscoverConveyMid() {
        return discoverConveyMid;
    }
    public void setDiscoverConveyMid(String discoverConveyMid) {
        this.discoverConveyMid = discoverConveyMid;
    }
    public String getHardCodedBillingDescriptor() {
        return hardCodedBillingDescriptor;
    }
    public void setHardCodedBillingDescriptor(String hardCodedBillingDescriptor) {
        this.hardCodedBillingDescriptor = hardCodedBillingDescriptor;
    }
    public String getMaxTransactionAmount() {
        return maxTransactionAmount;
    }
    public void setMaxTransactionAmount(String maxTransactionAmount) {
        this.maxTransactionAmount = maxTransactionAmount;
    }
    public String getMerchantCategoryCode() {
        return merchantCategoryCode;
    }
    public void setMerchantCategoryCode(String merchantCategoryCode) {
        this.merchantCategoryCode = merchantCategoryCode;
    }
    public String getMerchantName() {
        return merchantName;
    }
    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getDisabled() {
        return disabled;
    }
    public void setDisabled(String disabled) {
        this.disabled = disabled;
    }

}