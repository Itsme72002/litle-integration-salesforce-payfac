public class ApexPageUtil {
	
	public static void addInfoMessage(String message){
		if(String.isNotEmpty(message)){
			ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.INFO,message));
		}
	}
	
	public static void addWarningMessage(String message){
		if(String.isNotEmpty(message)){
			ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.WARNING,message));
		}
	}
	
	public static void addFatalMessage(String message){
		if(String.isNotEmpty(message)){
			ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.FATAL,message));
		}
	}
	
	public static void addConfirmMessage(String message){
		if(String.isNotEmpty(message)){
			ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.CONFIRM,message));
		}
	}
	
	public static void addErrorMessage(String message){
		if(String.isNotEmpty(message)){
			ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.ERROR,message));
		}
	}

}