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
