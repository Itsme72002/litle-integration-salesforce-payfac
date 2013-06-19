/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class ResponseCodeTest {

    static testMethod void testCodeValue() {
        // TO DO: implement unit test
        
        System.assertEquals('10', ResponseCode.codeValue(ResponseCode.ResponseCodeEnum.APPROVED.name()));
        System.assertEquals('20', ResponseCode.codeValue(ResponseCode.ResponseCodeEnum.MANUAL_REVIEW.name()));
        System.assertEquals('30', ResponseCode.codeValue(ResponseCode.ResponseCodeEnum.RETRY.name()));
        System.assertEquals('35', ResponseCode.codeValue(ResponseCode.ResponseCodeEnum.MANUAL_REVIEW_DUPLICATE.name()));
        System.assertEquals('36', ResponseCode.codeValue(ResponseCode.ResponseCodeEnum.DUPLICATE.name()));
        System.assertEquals('40', ResponseCode.codeValue(ResponseCode.ResponseCodeEnum.DECLINED.name()));
        System.assertEquals('99', ResponseCode.codeValue(ResponseCode.ResponseCodeEnum.MANUAL_REVIEW_BACKGROUND_CHECK_ERROR.name()));
        System.assertEquals('', ResponseCode.codeValue(''));
        System.assertEquals('', ResponseCode.codeValue('test'));
        
    }
}