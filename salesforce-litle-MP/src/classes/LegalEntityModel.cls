public class LegalEntityModel {
    
    // TODO Delete, class not used

    private String legalEntityName;
    private String legalEntityType;
    private String legalEntityDoingBusinessAs;
    private String legalEntityContactPhone;
    private Address legalEntityAddress;
    private Principal legalEntityPrincipal;
    private String legalEntityTaxId;
    private PCI legalEntityPci;
    private String legalEntityAnnualCreditCardSalesVolume;
    private String legalEntityHasAcceptedCreditCards;
    private String legalEntityId;
    
    private Boolean isNameFromOpportunity;
    private Boolean isDoingBusinessAsFromOpportunity;
    private Boolean isContactPhoneFromOpportunity;
    private Boolean isTaxIdFromOpportunity;
    private Boolean isAnnualCreditCardSalesVolumeFromOpportunity;
    private Boolean isHasAcceptedCreditCardsFromOpportunity;
    
    
    public LegalEntityModel(){
    	legalEntityAddress = new Address();
    	legalEntityPrincipal = new Principal();
    	legalEntityPci = new PCI();
	    isNameFromOpportunity = false;
	    isDoingBusinessAsFromOpportunity = false;
	    isContactPhoneFromOpportunity = false;
	    isTaxIdFromOpportunity = false;
	    isAnnualCreditCardSalesVolumeFromOpportunity = false;
	    isHasAcceptedCreditCardsFromOpportunity = false;
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
    public String getLegalEntityContactPhone() {
        return legalEntityContactPhone;
    }
    public void setLegalEntityContactPhone(String legalEntityContactPhone) {
        this.legalEntityContactPhone = legalEntityContactPhone;
    }
    public Address getLegalEntityAddress() {
        return legalEntityAddress;
    }
    public void setLegalEntityAddress(Address legalEntityAddress) {
        this.legalEntityAddress = legalEntityAddress;
    }
    public Principal getLegalEntityPrincipal() {
        return legalEntityPrincipal;
    }
    public void setLegalEntityPrincipal(Principal legalEntityPrincipal) {
        this.legalEntityPrincipal = legalEntityPrincipal;
    }
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
    public String getLegalEntityId() {
        return legalEntityId;
    }
    public void setLegalEntityId(String legalEntityId) {
        this.legalEntityId = legalEntityId;
    }
    public Boolean getIsNameFromOpportunity() {
        return isNameFromOpportunity;
    }
    public void setIsNameFromOpportunity(Boolean isNameFromOpportunity) {
        this.isNameFromOpportunity = isNameFromOpportunity;
    }
    public Boolean getIsDoingBusinessAsFromOpportunity() {
        return isDoingBusinessAsFromOpportunity;
    }
    public void setIsDoingBusinessAsFromOpportunity(
            Boolean isDoingBusinessAsFromOpportunity) {
        this.isDoingBusinessAsFromOpportunity = isDoingBusinessAsFromOpportunity;
    }
    public Boolean getIsContactPhoneFromOpportunity() {
        return isContactPhoneFromOpportunity;
    }
    public void setIsContactPhoneFromOpportunity(
            Boolean isContactPhoneFromOpportunity) {
        this.isContactPhoneFromOpportunity = isContactPhoneFromOpportunity;
    }
    public Boolean getIsTaxIdFromOpportunity() {
        return isTaxIdFromOpportunity;
    }
    public void setIsTaxIdFromOpportunity(Boolean isTaxIdFromOpportunity) {
        this.isTaxIdFromOpportunity = isTaxIdFromOpportunity;
    }
    public Boolean getIsAnnualCreditCardSalesVolumeFromOpportunity() {
        return isAnnualCreditCardSalesVolumeFromOpportunity;
    }
    public void setIsAnnualCreditCardSalesVolumeFromOpportunity(
            Boolean isAnnualCreditCardSalesVolumeFromOpportunity) {
        this.isAnnualCreditCardSalesVolumeFromOpportunity = isAnnualCreditCardSalesVolumeFromOpportunity;
    }
    public Boolean getIsHasAcceptedCreditCardsFromOpportunity() {
        return isHasAcceptedCreditCardsFromOpportunity;
    }
    public void setIsHasAcceptedCreditCardsFromOpportunity(
            Boolean isHasAcceptedCreditCardsFromOpportunity) {
        this.isHasAcceptedCreditCardsFromOpportunity = isHasAcceptedCreditCardsFromOpportunity;
    }
}