public class ResponseCode {

	public enum ResponseCodeEnum {
		APPROVED,
		MANUAL_REVIEW,
		RETRY,
		MANUAL_REVIEW_DUPLICATE,
		DUPLICATE,
		DECLINED,
		MANUAL_REVIEW_BACKGROUND_CHECK_ERROR
	}
	
	public static String codeValue(String code){
		if(String.isNotEmpty(code)){
			if(code.equals(ResponseCodeEnum.APPROVED.name())){
				return '10';
			}else if(code.equals(ResponseCodeEnum.MANUAL_REVIEW.name())){
				return '20';
			}else if(code.equals(ResponseCodeEnum.RETRY.name())){
				return '30';
			}else if(code.equals(ResponseCodeEnum.MANUAL_REVIEW_DUPLICATE.name())){
				return '35';
			}else if(code.equals(ResponseCodeEnum.DUPLICATE.name())){
				return '36';
			}else if(code.equals(ResponseCodeEnum.DECLINED.name())){
				return '40';
			}else if(code.equals(ResponseCodeEnum.MANUAL_REVIEW_BACKGROUND_CHECK_ERROR.name())){
				return '99';
			}else{
				return '';
			}
		}else{
				return '';
		}
	}
}