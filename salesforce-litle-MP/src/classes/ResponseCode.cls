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
	
	public static String codeValue(String responseCode){
		if(String.isNotEmpty(responseCode)){
			if(responseCode.equals(ResponseCodeEnum.APPROVED.name())){
				return '10';
			}else if(responseCode.equals(ResponseCodeEnum.MANUAL_REVIEW.name())){
				return '20';
			}else if(responseCode.equals(ResponseCodeEnum.RETRY.name())){
				return '30';
			}else if(responseCode.equals(ResponseCodeEnum.MANUAL_REVIEW_DUPLICATE.name())){
				return '35';
			}else if(responseCode.equals(ResponseCodeEnum.DUPLICATE.name())){
				return '36';
			}else if(responseCode.equals(ResponseCodeEnum.DECLINED.name())){
				return '40';
			}else if(responseCode.equals(ResponseCodeEnum.MANUAL_REVIEW_BACKGROUND_CHECK_ERROR.name())){
				return '99';
			}else{
				return '';
			}
		}else{
				return '';
		}
	}
}