public class ValidationUtil {
		
	/**
	 * Validates given input String if its length is less than  
	 * the given maxLength
	 */
	public static Boolean validateString(String input, Integer maxLength){
		if(String.isNotEmpty(input)){
			return (input.length() <= maxLength);
		}else{
			return false;
		}
	}
	
	/**
	 * Validates given input Date for the pattern yyyy-mm-dd 
	 */
	public static Boolean validateDate(String input){
		//Check size of string input to be 10 (yyyy-mm-dd)
		if(String.isNotEmpty(input)){
			if(input.length() != 10){
				return false;
			}
			//Check for yyyy-mm-dd pattern
			Pattern datePattern = Pattern.compile('(((19|20)\\d\\d)[\\-](0[1-9]|1[012])[\\-](0[1-9]|[12][0-9]|3[01]))');
			Matcher dateMatcher = datePattern.matcher(input);
			if(!dateMatcher.matches()){
				return false;
			}
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * Validates given input String for a valid Boolean value (true/false)
	 */
	 public static Boolean validateBoolean(String input){
	 	if(String.isNotEmpty(input)){
		 	if(input.equalsIgnoreCase('true') || input.equalsIgnoreCase('false')){
		 		return true;
		 	}
	 		return false;
		}else{
			return false;
		}
	 }
			
	
	/**
	 * Validates given input string to check if it is an integer
	 */
	public static Boolean validateInteger(String input){
		if(String.isNotEmpty(input)){
			try{
				Integer myInt = integer.valueOf(input);
				return true;
			}catch(TypeException e){
				return false;
			}
		}else{
			return false;
		}
	}
	
	/**
	 * Validates given input string to check if it is an integer
	 * and also if it is in the given list
	 */
	public static Boolean validateIntegerValue(String input, List<Integer> values){
		if(String.isNotEmpty(input) && values!=null && !values.isEmpty()){
			Integer myInt = 0;
			try{
				myInt = integer.valueOf(input);
			}catch(TypeException e){
				return false;
			}
		
			for(Integer value: values){
				if(myInt == value){
					return true;
				}	
			}
			return false;
		}else{
			return false;
		}
	}

}