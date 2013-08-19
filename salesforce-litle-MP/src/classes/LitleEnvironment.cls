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
public class LitleEnvironment {
	
	public enum LitleEnvironmentEnum {
		PRODUCTION,
		CERT,
		PRE_CERT,
		PRE_LIVE,
		SANDBOX
	}
	
	public static String stringValue(String name){
		if(String.isNotEmpty(name)){
			if(name.equals(LitleEnvironmentEnum.PRODUCTION.name())){
				return 'Production';
			}else if(name.equals(LitleEnvironmentEnum.CERT.name())){
				return 'Test';
			}else if(name.equals(LitleEnvironmentEnum.PRE_CERT.name())){
				return 'Pre-Cert';
			}else if(name.equals(LitleEnvironmentEnum.PRE_LIVE.name())){
				return 'Pre-Live';
			}else if(name.equals(LitleEnvironmentEnum.SANDBOX.name())){
				return 'Sandbox';
			}else{
				return 'Invalid Litle Environment Enum Input';
			}
		}else{
				return 'Litle Environment is null/empty';
		}
	}
	
	public static String getEnvironmentUrl(String name){
		if(String.isNotEmpty(name)){
			if(name.equals(LitleEnvironmentEnum.PRODUCTION.name())){
				return LitleConstants.LITLE_ENV_PROD;
			}else if(name.equals(LitleEnvironmentEnum.CERT.name())){
				return LitleConstants.LITLE_ENV_CERT;
			}else if(name.equals(LitleEnvironmentEnum.PRE_CERT.name())){
				return LitleConstants.LITLE_ENV_PRE_CERT;
			}else if(name.equals(LitleEnvironmentEnum.PRE_LIVE.name())){
				return LitleConstants.LITLE_ENV_PRE_LIVE;
			}else if(name.equals(LitleEnvironmentEnum.SANDBOX.name())){
				return LitleConstants.LITLE_ENV_SANDBOX;
			}else{
				return '';
			}
		}else{
				return '';
		}
	}

}