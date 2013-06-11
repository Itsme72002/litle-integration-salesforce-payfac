/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class LegalEntityTypeTest {

    static testMethod void testStringValue() {
        // TO DO: implement unit test
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