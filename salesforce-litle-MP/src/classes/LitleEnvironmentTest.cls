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