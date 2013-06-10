public class LegalEntityType {
	
	public enum LegalEntityTypeEnum {
		INDIVIDUAL_SOLE_PROPRIETORSHIP,
		CORPORATION,
		LIMITED_LIABILITY_COMPANY,
		PARTNERSHIP,
		ASSOCIATION_ESTATE_TRUST,
		TAX_EXEMPT_ORGANIZATION,
		INTERNATIONAL_ORGANIZATION,
		GOVERNMENT_AGENCY
	}
	
	public static String stringValue(String name){
		if(String.isNotEmpty(name)){
			if(name.equals(LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name())){
				return 'Individual Sole Proprietorship';
			}else if(name.equals(LegalEntityTypeEnum.CORPORATION.name())){
				return 'Corporation';
			}else if(name.equals(LegalEntityTypeEnum.LIMITED_LIABILITY_COMPANY.name())){
				return 'Limited Liability Company';
			}else if(name.equals(LegalEntityTypeEnum.PARTNERSHIP.name())){
				return 'Partnership';
			}else if(name.equals(LegalEntityTypeEnum.ASSOCIATION_ESTATE_TRUST.name())){
				return 'Association Estate Trust';
			}else if(name.equals(LegalEntityTypeEnum.TAX_EXEMPT_ORGANIZATION.name())){
				return 'Tax Exempt Organization';
			}else if(name.equals(LegalEntityTypeEnum.INTERNATIONAL_ORGANIZATION.name())){
				return 'International Organization';
			}else if(name.equals(LegalEntityTypeEnum.GOVERNMENT_AGENCY.name())){
				return 'Government Agency';
			}else{
				return 'Invalid Legal Entity Type Enum Input';
			}
		}else{
				return 'Legal Entity Type is null/empty';
		}
	}

}