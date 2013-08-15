@isTest
private class LegalEntityTypeTest {

    static testMethod void testStringValue() {
        
        System.assertEquals(LegalEntityType.stringValue(LegalEntityType.LegalEntityTypeEnum.INDIVIDUAL_SOLE_PROPRIETORSHIP.name()), 'Individual Sole Proprietorship');
        System.assertEquals(LegalEntityType.stringValue(LegalEntityType.LegalEntityTypeEnum.CORPORATION.name()), 'Corporation');
        System.assertEquals(LegalEntityType.stringValue(LegalEntityType.LegalEntityTypeEnum.LIMITED_LIABILITY_COMPANY.name()), 'Limited Liability Company');
        System.assertEquals(LegalEntityType.stringValue(LegalEntityType.LegalEntityTypeEnum.PARTNERSHIP.name()), 'Partnership');
        System.assertEquals(LegalEntityType.stringValue(LegalEntityType.LegalEntityTypeEnum.ASSOCIATION_ESTATE_TRUST.name()), 'Association Estate Trust');
        System.assertEquals(LegalEntityType.stringValue(LegalEntityType.LegalEntityTypeEnum.TAX_EXEMPT_ORGANIZATION.name()), 'Tax Exempt Organization');
        System.assertEquals(LegalEntityType.stringValue(LegalEntityType.LegalEntityTypeEnum.INTERNATIONAL_ORGANIZATION.name()), 'International Organization');
        System.assertEquals(LegalEntityType.stringValue(LegalEntityType.LegalEntityTypeEnum.GOVERNMENT_AGENCY.name()), 'Government Agency');
        System.assertEquals(LegalEntityType.stringValue('abc'), 'Invalid Legal Entity Type Enum Input');
        System.assertEquals(LegalEntityType.stringValue(null), 'Legal Entity Type is null/empty');
    }
}