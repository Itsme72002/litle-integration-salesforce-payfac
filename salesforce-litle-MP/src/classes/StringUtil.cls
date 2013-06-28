public class StringUtil {
	
	public static String getMaskCharacters(String information){
		String maskedString = '';
		if(String.isNotEmpty(information)){
			Integer size = information.length();
			while(size > 0){
				maskedString += LitleConstants.MASK_CHARACTER;
				size --;
			}
		}
		return maskedString;
	}
}