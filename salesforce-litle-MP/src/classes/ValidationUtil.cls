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
	 * Validates given input String if its length is within the given 
	 * minLength and maxLength
	 */
	public static Boolean validateStringWithinLimits(String input, Integer minLength, Integer maxLength){
		if(String.isNotEmpty(input)){
			return (input.length() >= minLength && input.length() <= maxLength);
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
			return Pattern.matches('\\A[0-9]+\\Z', input);
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