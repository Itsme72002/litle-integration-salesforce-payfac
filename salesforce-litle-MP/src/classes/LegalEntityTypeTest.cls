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
