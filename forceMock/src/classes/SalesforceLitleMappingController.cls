public class SalesforceLitleMappingController {
	private LegalEntityModel legalEntityModel;
    private SubMerchantModel subMerchantModel;
    private List<Selectoption> salesforceFields;
    
    public SalesforceLitleMappingController(){
    	legalEntityModel = new LegalEntityModel();
    	subMerchantModel = new SubMerchantModel();
    }
    
    public void setLegalEntityModel(LegalEntityModel legalEntityModel){
    	this.legalEntityModel = legalEntityModel;
    }
    
    public LegalEntityModel getLegalEntityModel(){
    	return legalEntityModel;
    }
    
    public void setSubMerchantModel(SubMerchantModel subMerchantModel){
    	this.subMerchantModel = subMerchantModel;
    }
    
    public SubMerchantModel getSubMerchantModel(){
    	return subMerchantModel;
    }
    
    public List<Selectoption> getSalesforceFields(){
    	if(salesforceFields == null || salesforceFields.size() == 0){
    		setSalesforceFields(fetchAllAccountFields());
    	}
    	return salesforceFields;
    }
    
    public void setSalesforceFields(List<Selectoption> salesforceFields){
    	this.salesforceFields = salesforceFields;
    }

    public List<Selectoption> fetchAllAccountFields(){
	    SObjectType objToken = Schema.getGlobalDescribe().get('Account');
	    DescribeSObjectResult objDef = objToken.getDescribe();
	    Map<String, SObjectField> fields = objDef.fields.getMap(); 
	    List<Selectoption> accountFields = new List<Selectoption>();
	    Set<String> fieldSet = fields.keySet();
	    accountFields.add(new Selectoption('','-- Select Option --'));
	    for(String s:fieldSet)
	    {
	        SObjectField fieldToken = fields.get(s);
	        DescribeFieldResult selectedField = fieldToken.getDescribe();
	        accountFields.add(new Selectoption(selectedField.getName(),selectedField.getName()));
	    }
	    return accountFields;
	 }
	 
	 //Legal Entity on change listeners	 
	 public Pagereference onSelectChangeLegalEntityName(){
	 	if(legalEntityModel.getLegalEntityName()== null){
	 		legalEntityModel.setIsLegalEntityNameDefaultDisabled(false);
	 	}else{
	 		legalEntityModel.setIsLegalEntityNameDefaultDisabled(true);
	 	}
	 	return null;
	 }
	 
	 public PageReference onSelectChangeLegalEntityType(){
	 	if(legalEntityModel.getLegalEntityType()== null){
	 		legalEntityModel.setIsLegalEntityTypeDefaultDisabled(false);
	 	}else{
	 		legalEntityModel.setIsLegalEntityTypeDefaultDisabled(true);
	 	}
		return null;
	}
	
	
	public PageReference onSelectChangeLegalEntityStreetAddress1(){
		if(legalEntityModel.getLegalEntityStreetAddress1()== null){
		 	legalEntityModel.setIsLegalEntityStreetAddress1DefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityStreetAddress1DefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityStreetAddress2(){
		if(legalEntityModel.getLegalEntityStreetAddress2()== null){
		 	legalEntityModel.setIsLegalEntityStreetAddress2DefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityStreetAddress2DefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityCity(){
		if(legalEntityModel.getLegalEntityCity()== null){
		 	legalEntityModel.setIsLegalEntityCityDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityCityDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityStateProvince(){
		if(legalEntityModel.getLegalEntityStateProvince()== null){
		 	legalEntityModel.setIsLegalEntityStateProvinceDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityStateProvinceDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityPostalCode(){
		if(legalEntityModel.getLegalEntityPostalCode()== null){
		 	legalEntityModel.setIsLegalEntityPostalCodeDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityPostalCodeDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityCountryCode(){
		if(legalEntityModel.getLegalEntityCountryCode()== null){
		 	legalEntityModel.setIsLegalEntityCountryCodeDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityCountryCodeDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityFirstName(){
		if(legalEntityModel.getLegalEntityFirstName()== null){
		 	legalEntityModel.setIsLegalEntityFirstNameDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityFirstNameDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityLastName(){
		if(legalEntityModel.getLegalEntityLastName()== null){
		 	legalEntityModel.setIsLegalEntityLastNameDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityLastNameDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityEmailAddress(){
		if(legalEntityModel.getLegalEntityEmailAddress()== null){
		 	legalEntityModel.setIsLegalEntityEmailAddressDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityEmailAddressDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityContactPhone(){
		if(legalEntityModel.getLegalEntityContactPhone()== null){
		 	legalEntityModel.setIsLegalEntityContactPhoneDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityContactPhoneDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityDateOfBirth(){
		if(legalEntityModel.getLegalEntityDateOfBirth()== null){
		 	legalEntityModel.setIsLegalEntityDateOfBirthDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityDateOfBirthDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityDriversLicense(){
		if(legalEntityModel.getLegalEntityDriversLicense()== null){
		 	legalEntityModel.setIsLegalEntityDriversLicenseDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityDriversLicenseDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityDriversLicenseState(){
		if(legalEntityModel.getLegalEntityDriversLicenseState()== null){
		 	legalEntityModel.setIsLegalEntityDriversLicenseStateDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityDriversLicenseStateDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntitySsn(){
		if(legalEntityModel.getLegalEntitySsn()== null){
		 	legalEntityModel.setIsLegalEntitySsnDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntitySsnDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityTaxId(){
		if(legalEntityModel.getLegalEntityTaxId()== null){
		 	legalEntityModel.setIsLegalEntityTaxIdDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityTaxIdDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityIsExclusiveToPsp(){
		if(legalEntityModel.getLegalEntityIsExclusiveToPsp()== null){
		 	legalEntityModel.setIsLegalEntityIsExclusiveToPspDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityIsExclusiveToPspDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityIsPciComplianceValidated(){
		if(legalEntityModel.getLegalEntityIsPciComplianceValidated()== null){
		 	legalEntityModel.setIsLegalEntityIsPciComplianceValidatedDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityIsPciComplianceValidatedDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityPciLevel(){
		if(legalEntityModel.getLegalEntityPciLevel()== null){
		 	legalEntityModel.setIsLegalEntityPciLevelDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityPciLevelDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityScanningVendor(){
		if(legalEntityModel.getLegalEntityScanningVendor()== null){
		 	legalEntityModel.setIsLegalEntityScanningVendorDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityScanningVendorDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityQualifiedSecurityAssessor(){
		if(legalEntityModel.getLegalEntityQualifiedSecurityAssessor()== null){
		 	legalEntityModel.setIsLegalEntityQualifiedSecurityAssessorDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityQualifiedSecurityAssessorDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityMostRecentlyPassedScan(){
		if(legalEntityModel.getLegalEntityMostRecentlyPassedScan()== null){
		 	legalEntityModel.setIsLegalEntityMostRecentlyPassedScanDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityMostRecentlyPassedScanDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityReportOnCompliance(){
		if(legalEntityModel.getLegalEntityReportOnCompliance()== null){
		 	legalEntityModel.setIsLegalEntityReportOnComplianceDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityReportOnComplianceDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityAnnualCreditCardSalesVolume(){
		if(legalEntityModel.getLegalEntityAnnualCreditCardSalesVolume()== null){
		 	legalEntityModel.setIsLegalEntityAnnualCreditCardSalesVolumeDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityAnnualCreditCardSalesVolumeDefaultDisabled(true);
		 }
		return null;
	}
	
	public PageReference onSelectChangeLegalEntityHasAcceptedCreditCards(){
		if(legalEntityModel.getLegalEntityHasAcceptedCreditCards()== null){
		 	legalEntityModel.setIsLegalEntityHasAcceptedCreditCardsDefaultDisabled(false);
		 }else{
		 	legalEntityModel.setIsLegalEntityHasAcceptedCreditCardsDefaultDisabled(true);
		 }
		return null;
	}
	
	
	//Sub merchant on change listeners
	public PageReference onSelectChangeSubMerchantStreetAddress1(){
		if(subMerchantModel.getSubMerchantStreetAddress1() == null){
			subMerchantModel.setIsSubMerchantStreetAddress1DefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantStreetAddress1DefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantStreetAddress2(){
		if(subMerchantModel.getSubMerchantStreetAddress2() == null){
			subMerchantModel.setIsSubMerchantStreetAddress2DefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantStreetAddress2DefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantCity(){
		if(subMerchantModel.getSubMerchantCity() == null){
			subMerchantModel.setIsSubMerchantCityDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantCityDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantStateProvince(){
		if(subMerchantModel.getSubMerchantStateProvince() == null){
			subMerchantModel.setIsSubMerchantStateProvinceDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantStateProvinceDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantPostalCode(){
		if(subMerchantModel.getSubMerchantPostalCode() == null){
			subMerchantModel.setIsSubMerchantPostalCodeDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantPostalCodeDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantCountryCode(){
		if(subMerchantModel.getSubMerchantCountryCode() == null){
			subMerchantModel.setIsSubMerchantCountryCodeDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantCountryCodeDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantAmexMid(){
		if(subMerchantModel.getSubMerchantAmexMid() == null){
			subMerchantModel.setIsSubMerchantAmexMidDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantAmexMidDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantBankAccountNumber(){
		if(subMerchantModel.getSubMerchantBankAccountNumber() == null){
			subMerchantModel.setIsSubMerchantBankAccountNumberDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantBankAccountNumberDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantBankRoutingNumber(){
		if(subMerchantModel.getSubMerchantBankRoutingNumber() == null){
			subMerchantModel.setIsSubMerchantBankRoutingNumberDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantBankRoutingNumberDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantCreateCredentials(){
		if(subMerchantModel.getSubMerchantCreateCredentials() == null){
			subMerchantModel.setIsSubMerchantCreateCredentialsDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantCreateCredentialsDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantCustomerServiceNumber(){
		if(subMerchantModel.getSubMerchantCustomerServiceNumber() == null){
			subMerchantModel.setIsSubMerchantCustomerServiceNumberDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantCustomerServiceNumberDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantDiscoverConveyMid(){
		if(subMerchantModel.getSubMerchantDiscoverConveyMid() == null){
			subMerchantModel.setIsSubMerchantDiscoverConveyMidDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantDiscoverConveyMidDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantHardCodeBillingDescriptor(){
		if(subMerchantModel.getSubMerchantHardCodeBillingDescriptor() == null){
			subMerchantModel.setIsSubMerchantHardCodeBillingDescriptorDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantHardCodeBillingDescriptorDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantMaxTransactionAmount(){
		if(subMerchantModel.getSubMerchantMaxTransactionAmount() == null){
			subMerchantModel.setIsSubMerchantMaxTransactionAmountDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantMaxTransactionAmountDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantMerchantCategoryCode(){
		if(subMerchantModel.getSubMerchantMerchantCategoryCode() == null){
			subMerchantModel.setIsSubMerchantMerchantCategoryCodeDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantMerchantCategoryCodeDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantMerchantName(){
		if(subMerchantModel.getSubMerchantMerchantName() == null){
			subMerchantModel.setIsSubMerchantMerchantNameDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantMerchantNameDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantFirstName(){
		if(subMerchantModel.getSubMerchantFirstName() == null){
			subMerchantModel.setIsSubMerchantFirstNameDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantFirstNameDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantLastName(){
		if(subMerchantModel.getSubMerchantLastName() == null){
			subMerchantModel.setIsSubMerchantLastNameDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantLastNameDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantEmailAddress(){
		if(subMerchantModel.getSubMerchantEmailAddress() == null){
			subMerchantModel.setIsSubMerchantEmailAddressDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantEmailAddressDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantPhone(){
		if(subMerchantModel.getSubMerchantPhone() == null){
			subMerchantModel.setIsSubMerchantPhoneDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantPhoneDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantPspMerchantId(){
		if(subMerchantModel.getSubMerchantPspMerchantId() == null){
			subMerchantModel.setIsSubMerchantPspMerchantIdDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantPspMerchantIdDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchantUrl(){
		if(subMerchantModel.getSubMerchantUrl() == null){
			subMerchantModel.setIsSubMerchantUrlDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchantUrlDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchanteCheckBillingDescriptor(){
		if(subMerchantModel.getSubMerchanteCheckBillingDescriptor() == null){
			subMerchantModel.setIsSubMerchanteCheckBillingDescriptorDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchanteCheckBillingDescriptorDefaultDisabled(true);
		}
		return null;
	}
	
	public PageReference onSelectChangeSubMerchanteCheckCompanyName(){
		if(subMerchantModel.getSubMerchanteCheckCompanyName() == null){
			subMerchantModel.setIsSubMerchanteCheckCompanyNameDefaultDisabled(false);
		}else{
			subMerchantModel.setIsSubMerchanteCheckCompanyNameDefaultDisabled(true);
		}
		return null;
	}
		
	public void saveMappings(){
		System.debug('In Save Method');
	}
		 
	 
	

}