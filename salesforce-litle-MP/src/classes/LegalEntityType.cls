/*
Copyright (c) 2013 Litle & Co.
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/
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