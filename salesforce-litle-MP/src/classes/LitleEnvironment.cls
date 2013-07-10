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
				return 'Cert';
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