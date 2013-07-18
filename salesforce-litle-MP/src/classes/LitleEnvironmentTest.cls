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
private class LitleEnvironmentTest {

    static testMethod void testStringValue() {
        System.assertEquals('Production',LitleEnvironment.stringValue('PRODUCTION'));
        System.assertEquals('Cert',LitleEnvironment.stringValue('CERT'));
        System.assertEquals('Pre-Cert',LitleEnvironment.stringValue('PRE_CERT'));
        System.assertEquals('Pre-Live',LitleEnvironment.stringValue('PRE_LIVE'));
        System.assertEquals('Sandbox',LitleEnvironment.stringValue('SANDBOX'));
        System.assertEquals('Invalid Litle Environment Enum Input',LitleEnvironment.stringValue('invalid'));
        System.assertEquals('Litle Environment is null/empty',LitleEnvironment.stringValue(''));
        System.assertEquals('Litle Environment is null/empty',LitleEnvironment.stringValue(null));
    }
    
    static testMethod void testGetEnvironmentUrl() {
        System.assertEquals(LitleConstants.LITLE_ENV_PROD,LitleEnvironment.getEnvironmentUrl('PRODUCTION'));
        System.assertEquals(LitleConstants.LITLE_ENV_CERT,LitleEnvironment.getEnvironmentUrl('CERT'));
        System.assertEquals(LitleConstants.LITLE_ENV_PRE_CERT,LitleEnvironment.getEnvironmentUrl('PRE_CERT'));
        System.assertEquals(LitleConstants.LITLE_ENV_PRE_LIVE,LitleEnvironment.getEnvironmentUrl('PRE_LIVE'));
        System.assertEquals(LitleConstants.LITLE_ENV_SANDBOX,LitleEnvironment.getEnvironmentUrl('SANDBOX'));
        System.assertEquals('',LitleEnvironment.getEnvironmentUrl('invalid'));
        System.assertEquals('',LitleEnvironment.getEnvironmentUrl(''));
        System.assertEquals('',LitleEnvironment.getEnvironmentUrl(null));
    }
}