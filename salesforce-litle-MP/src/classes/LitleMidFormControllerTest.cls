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
private class LitleMidFormControllerTest {

  	static testMethod void populateLegalEntityResponseOriginalEntity_ApprovedResponse(){
  		LitleMidFormController controller = new LitleMidFormController();
		LegalEntityResponse leResponse = new LegalEntityResponse();
		leResponse = controller.populateLegalEntityResponse(leResponse, LegalEntityApprovedResponse.approvedResponse, false);
		
		System.assertEquals('1', leResponse.getResponsePrincipal().getPrincipalId());
		System.assertEquals('p first', leResponse.getResponsePrincipal().getFirstName());
		System.assertEquals('p last', leResponse.getResponsePrincipal().getLastName());
		System.assertEquals('82821536565084223',leResponse.getLegalEntityId());
		System.assertEquals('82821536564756680',leResponse.getTransactionId());
		System.assertEquals('10',leResponse.getResponseCode());
		System.assertEquals('Approved',leResponse.getResponseDespcription());
		System.assertEquals('40',leResponse.getBusinessVerificationResult().getOverallScore().getCodeOrScore());
		System.assertEquals('Business identity is confirmed at the input address',leResponse.getBusinessVerificationResult().getOverallScore().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getDescription());System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getAddressVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getCityVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getNameVerfied());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getPhoneVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getTaxIdVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getZipVerified());
	}
	
	
	static testMethod void populateLegalEntityResponseOriginalEntity_DeclinedResponse(){
		LegalEntityResponse leResponse = new LegalEntityResponse();
		LitleMidFormController controller = new LitleMidFormController();
		leResponse = controller.populateLegalEntityResponse(leResponse, LegalEntityDeclinedResponse.response, false);
		
		System.assertEquals('1', leResponse.getResponsePrincipal().getPrincipalId());
		System.assertEquals('p first', leResponse.getResponsePrincipal().getFirstName());
		System.assertEquals('p last', leResponse.getResponsePrincipal().getLastName());
		System.assertEquals('82821189481022859',leResponse.getLegalEntityId());
		System.assertEquals('82821190479136420',leResponse.getTransactionId());
		System.assertEquals('40',leResponse.getResponseCode());
		System.assertEquals('Declined',leResponse.getResponseDespcription());
		System.assertEquals('50',leResponse.getBusinessVerificationResult().getOverallScore().getCodeOrScore());
		System.assertEquals('Business is verified on multiple sources with no contradictory findings',leResponse.getBusinessVerificationResult().getOverallScore().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getDescription());System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getAddressVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getCityVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getNameVerfied());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getPhoneVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getTaxIdVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getZipVerified());
	}
	
	static testMethod void populateLegalEntityResponseOriginalEntity_DuplicateResponse(){
		LegalEntityResponse leResponse = new LegalEntityResponse();
		LitleMidFormController controller = new LitleMidFormController();
		leResponse = controller.populateLegalEntityResponse(leResponse, LegalEntityDuplicateResponse.response, true);
		
		System.assertEquals(null, leResponse.getResponsePrincipal().getPrincipalId());
		System.assertEquals('John', leResponse.getResponsePrincipal().getFirstName());
		System.assertEquals('Doe', leResponse.getResponsePrincipal().getLastName());
		System.assertEquals('82821203948912667',leResponse.getLegalEntityId());
		System.assertEquals('82821203948749101',leResponse.getTransactionId());
		System.assertEquals('10',leResponse.getResponseCode());
		System.assertEquals('Approved',leResponse.getResponseDespcription());
		System.assertEquals('50',leResponse.getBusinessVerificationResult().getOverallScore().getCodeOrScore());
		System.assertEquals('Business is verified on multiple sources with nocontradictory findings',leResponse.getBusinessVerificationResult().getOverallScore().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getDescription());System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getAddressVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getCityVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getNameVerfied());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getPhoneVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getTaxIdVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getZipVerified());
	}
	
	static testMethod void populateLegalEntityResponseOriginalEntity_FullDupeResponse(){
		LegalEntityResponse leResponse = new LegalEntityResponse();
		LitleMidFormController controller = new LitleMidFormController();
		leResponse = controller.populateLegalEntityResponse(leResponse, LegalEntityFullDupeResponse.response, false);
		
		System.assertEquals('1', leResponse.getResponsePrincipal().getPrincipalId());
		System.assertEquals('p first', leResponse.getResponsePrincipal().getFirstName());
		System.assertEquals('p last', leResponse.getResponsePrincipal().getLastName());
		System.assertEquals('82821536565084611',leResponse.getLegalEntityId());
		System.assertEquals('82821536674283575',leResponse.getTransactionId());
		System.assertEquals('10',leResponse.getResponseCode());
		System.assertEquals('Approved',leResponse.getResponseDespcription());
		System.assertEquals('50',leResponse.getBusinessVerificationResult().getOverallScore().getCodeOrScore());
		System.assertEquals('Business is verified on multiple sources with no contradictory findings',leResponse.getBusinessVerificationResult().getOverallScore().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getDescription());System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getAddressVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getCityVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getNameVerfied());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getPhoneVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getTaxIdVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getZipVerified());
	}
	
	static testMethod void populateLegalEntityResponseOriginalEntity_ManualReviewResponse(){
		LegalEntityResponse leResponse = new LegalEntityResponse();
		LitleMidFormController controller = new LitleMidFormController();
		leResponse = controller.populateLegalEntityResponse(leResponse, LegalEntityManualReviewResponse.response, false);
		
		System.assertEquals('1', leResponse.getResponsePrincipal().getPrincipalId());
		System.assertEquals('p first', leResponse.getResponsePrincipal().getFirstName());
		System.assertEquals('p last', leResponse.getResponsePrincipal().getLastName());
		System.assertEquals('82821536565085998',leResponse.getLegalEntityId());
		System.assertEquals('82821536819527712',leResponse.getTransactionId());
		System.assertEquals('20',leResponse.getResponseCode());
		System.assertEquals('Manual Review',leResponse.getResponseDespcription());
		System.assertEquals('50',leResponse.getBusinessVerificationResult().getOverallScore().getCodeOrScore());
		System.assertEquals('Business is verified on multiple sources with no contradictory findings',leResponse.getBusinessVerificationResult().getOverallScore().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals(null,leResponse.getBusinessVerificationResult().getNameAddressPhoneAssociation().getDescription());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getAddressVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getCityVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getNameVerfied());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getPhoneVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getTaxIdVerified());
		System.assertEquals('false',leResponse.getBusinessVerificationResult().getVerificationIndicator().getZipVerified());
	}
	
	static testMethod void populateLegalEntityResponseOriginalEntity_UglyCases(){
		LegalEntityResponse leResponse = new LegalEntityResponse();
		LitleMidFormController controller = new LitleMidFormController();
		leResponse = controller.populateLegalEntityResponse(leResponse, LegalEntityManualReviewResponse.response, null);
		System.assertNotEquals(null, leResponse);
				
		leResponse = controller.populateLegalEntityResponse(null, LegalEntityManualReviewResponse.response, false);
		System.assertEquals(null, leResponse);
		
		leResponse = new LegalEntityResponse();
		leResponse = controller.populateLegalEntityResponse(leResponse, null, true);
		System.assertNotEquals(null, leResponse);
		System.assertEquals(null,leResponse.getTransactionId());
	}
	
	static testMethod void getVerificationResultFromXml_Business(){
		String businessBody = '<business>'
								 + '<verificationResult>'
								 + '<overallScore>'
								 + '<score>40</score>'
								 + '<description>Business identity is confirmed at the input address</description>'
								 + '</overallScore>'
								 + '<nameAddressTaxIdAssociation>'
								 + '<code>40</code>'
								 + '<description>Business identity is confirmed at the input address</description>'
								 + '</nameAddressTaxIdAssociation>'
								 + '<nameAddressPhoneAssociation>'
								 + '<code>30</code>'
								 + '<description>Business confirmed at the input address</description>'
								 + '</nameAddressPhoneAssociation>'
								 + '<verificationIndicators>'
								 + '<nameVerified>false</nameVerified>'
								 + '<addressVerified>false</addressVerified>'
								 + '<cityVerified>false</cityVerified>'
								 + '<stateVerified>false</stateVerified>'
								 + '<zipVerified>false</zipVerified>'
								 + '<phoneVerified>false</phoneVerified>'
								 + '<taxIdVerified>false</taxIdVerified>'
								 + '</verificationIndicators>'
								 + '<riskIndicators>'
								 + '<riskIndicator>'
								 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
								 + '<description>The input zip code belongs to a post office box</description>'
								 + '</riskIndicator>'
								 + '</riskIndicators>'
								 + '</verificationResult>'
								 + '</business>';
		LitleMidFormController controller = new LitleMidFormController();
		VerificationResult vResult = controller.getVerificationResultFromXml(businessBody);
		System.assertEquals('40',vResult.getOverallScore().getCodeOrScore());
		System.assertEquals('Business identity is confirmed at the input address',vResult.getOverallScore().getDescription());
		System.assertEquals('40',vResult.getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals('Business identity is confirmed at the input address',vResult.getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals('30',vResult.getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals('Business confirmed at the input address',vResult.getNameAddressPhoneAssociation().getDescription());
		System.assertEquals('false',vResult.getVerificationIndicator().getAddressVerified());
		System.assertEquals('false',vResult.getVerificationIndicator().getCityVerified());
		System.assertEquals('false',vResult.getVerificationIndicator().getNameVerfied());
		System.assertEquals('false',vResult.getVerificationIndicator().getPhoneVerified());
		System.assertEquals('false',vResult.getVerificationIndicator().getTaxIdVerified());
		System.assertEquals('false',vResult.getVerificationIndicator().getZipVerified());
	}
	
	static testMethod void getVerificationResultFromXml_Good(){
		String principalBody = '<principal>'
								 + '<verificationResult>'
								 + '<overallScore>'
								 + '<score>40</score>'
								 + '<description>Last name, address &amp; SSN or phone verified; first name, phone or SSN verification failures</description>'
								 + '</overallScore>'
								 + '<nameAddressSsnAssociation/>'
								 + '<nameAddressPhoneAssociation/>'
								 + '<verificationIndicators>'
								 + '<nameVerified>false</nameVerified>'
								 + '<addressVerified>false</addressVerified>'
								 + '<phoneVerified>false</phoneVerified>'
								 + '<ssnVerified>false</ssnVerified>'
								 + '<dobVerified>false</dobVerified>'
								 + '</verificationIndicators>'
								 + '<riskIndicators>'
								 + '<riskIndicator>'
								 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
								 + '<description>The input zip code belongs to a post office box</description>'
								 + '</riskIndicator>'
								 + '</riskIndicators>'
								 + '</verificationResult>'
								 + '</principal>';
								 
		LitleMidFormController controller = new LitleMidFormController();
		VerificationResult vResult  = controller.getVerificationResultFromXml(principalBody);
		System.assertEquals('40',vResult.getOverallScore().getCodeOrScore());
		System.assertEquals('Last name, address & SSN or phone verified; first name, phone or SSN verification failures',vResult.getOverallScore().getDescription());
		System.assertEquals(null,vResult.getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals(null,vResult.getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals(null,vResult.getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals(null,vResult.getNameAddressPhoneAssociation().getDescription());
		System.assertEquals('false',vResult.getVerificationIndicator().getAddressVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getCityVerified());
		System.assertEquals('false',vResult.getVerificationIndicator().getNameVerfied());
		System.assertEquals('false',vResult.getVerificationIndicator().getPhoneVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getTaxIdVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getZipVerified());
		
	}
	static testMethod void getVerificationResultFromXml_Bad(){
		String principalBody = '<principal>'
								 + '<verificationResult>'
								 + '<overallScore>'
								 + '<score/>'
								 + '<description/>'
								 + '</overallScore>'
								 + '<nameAddressSsnAssociation/>'
								 + '<nameAddressPhoneAssociation/>'
								 + '<verificationIndicators/>'
								 + '<riskIndicators>'
								 + '<riskIndicator>'
								 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
								 + '<description>The input zip code belongs to a post office box</description>'
								 + '</riskIndicator>'
								 + '</riskIndicators>'
								 + '</verificationResult>'
								 + '</principal>';
								 
		LitleMidFormController controller = new LitleMidFormController();
		VerificationResult vResult  = controller.getVerificationResultFromXml(principalBody);
		System.assertEquals(null,vResult.getOverallScore().getCodeOrScore());
		System.assertEquals(null,vResult.getOverallScore().getDescription());
		System.assertEquals(null,vResult.getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals(null,vResult.getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals(null,vResult.getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals(null,vResult.getNameAddressPhoneAssociation().getDescription());
		System.assertEquals(null,vResult.getVerificationIndicator().getAddressVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getCityVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getNameVerfied());
		System.assertEquals(null,vResult.getVerificationIndicator().getPhoneVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getTaxIdVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getZipVerified());
	}
	
	static testMethod void getVerificationResultFromXml_Ugly(){
		LitleMidFormController controller = new LitleMidFormController();
		VerificationResult vResult  = controller.getVerificationResultFromXml('');
		System.assertEquals(null,vResult.getOverallScore().getCodeOrScore());
		System.assertEquals(null,vResult.getOverallScore().getDescription());
		System.assertEquals(null,vResult.getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals(null,vResult.getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals(null,vResult.getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals(null,vResult.getNameAddressPhoneAssociation().getDescription());
		System.assertEquals(null,vResult.getVerificationIndicator().getAddressVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getCityVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getNameVerfied());
		System.assertEquals(null,vResult.getVerificationIndicator().getPhoneVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getTaxIdVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getZipVerified());
		
		vResult  = controller.getVerificationResultFromXml(null);
		System.assertEquals(null,vResult.getOverallScore().getCodeOrScore());
		System.assertEquals(null,vResult.getOverallScore().getDescription());
		System.assertEquals(null,vResult.getNameAddressTaxOrSsnIdAssociation().getCodeOrScore());
		System.assertEquals(null,vResult.getNameAddressTaxOrSsnIdAssociation().getDescription());
		System.assertEquals(null,vResult.getNameAddressPhoneAssociation().getCodeOrScore());
		System.assertEquals(null,vResult.getNameAddressPhoneAssociation().getDescription());
		System.assertEquals(null,vResult.getVerificationIndicator().getAddressVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getCityVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getNameVerfied());
		System.assertEquals(null,vResult.getVerificationIndicator().getPhoneVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getTaxIdVerified());
		System.assertEquals(null,vResult.getVerificationIndicator().getZipVerified());
		
	}	
	
	static testMethod void getPrincipalFromXml_Good(){
		String principalBody = '<principal>'+
								'<principalId>1</principalId>'+
								'<firstName>p first</firstName>'+
								'<lastName>p last</lastName>'+
								'</principal>';
								
		LitleMidFormController controller = new LitleMidFormController();
		Principal principal = controller.getPrincipalFromXml(principalBody);
		System.assertEquals('1', principal.getPrincipalId());
		System.assertEquals('p first', principal.getFirstName());
		System.assertEquals('p last', principal.getLastName());
	}
	
	static testMethod void getPrincipalFromXml_Ugly(){
		LitleMidFormController controller = new LitleMidFormController();
		Principal principal = controller.getPrincipalFromXml('');
		System.assertEquals(null, principal.getPrincipalId());
		System.assertEquals(null, principal.getFirstName());
		System.assertEquals(null, principal.getLastName());
		
		principal = controller.getPrincipalFromXml(null);
		System.assertEquals(null, principal.getPrincipalId());
		System.assertEquals(null, principal.getFirstName());
		System.assertEquals(null, principal.getLastName());
	}
	
	static testMethod void getPrincipalFromXml_Bad(){
		String principalBody = '<principal>'
								 + '<verificationResult>'
								 + '<overallScore>'
								 + '<score>40</score>'
								 + '<description>Last name, address &amp; SSN or phone verified; first name, phone or SSN verification failures</description>'
								 + '</overallScore>'
								 + '<nameAddressSsnAssociation/>'
								 + '<nameAddressPhoneAssociation/>'
								 + '<verificationIndicators>'
								 + '<nameVerified>false</nameVerified>'
								 + '<addressVerified>false</addressVerified>'
								 + '<phoneVerified>false</phoneVerified>'
								 + '<ssnVerified>false</ssnVerified>'
								 + '<dobVerified>false</dobVerified>'
								 + '</verificationIndicators>'
								 + '<riskIndicators>'
								 + '<riskIndicator>'
								 + '<code>ZIP_BELONGS_POST_OFFICE</code>'
								 + '<description>The input zip code belongs to a post office box</description>'
								 + '</riskIndicator>'
								 + '</riskIndicators>'
								 + '</verificationResult>'
								 + '</principal>';
								 
		LitleMidFormController controller = new LitleMidFormController();
		Principal principal = controller.getPrincipalFromXml(principalBody);
		System.assertEquals(null, principal.getPrincipalId());
		System.assertEquals(null, principal.getFirstName());
		System.assertEquals(null, principal.getLastName());
	}
	
	
	
	static testMethod void getDescriptionDetailsFromXml_Good(){
		String overallBody =  '<overallScore>'
								 + '<score>40</score>'
								 + '<description>Last name, address &amp; SSN or phone verified; first name, phone or SSN verification failures</description>'
								 + '</overallScore>';
								 
		LitleMidFormController controller = new LitleMidFormController();
		DescriptionDetails descDetails = controller.getDescriptionDetailFromXml(overallBody, 'score');
		System.assertEquals('40',descDetails.getCodeOrScore());
		System.assertEquals('Last name, address & SSN or phone verified; first name, phone or SSN verification failures',descDetails.getDescription());
		
		overallBody =  '<overallScore>'
								 + '<code>40</code>'
								 + '<description>Last name, address &amp; SSN or phone verified; first name, phone or SSN verification failures</description>'
								 + '</overallScore>';
								 
		descDetails = controller.getDescriptionDetailFromXml(overallBody, 'code');
		System.assertEquals('40',descDetails.getCodeOrScore());
		System.assertEquals('Last name, address & SSN or phone verified; first name, phone or SSN verification failures',descDetails.getDescription());
	}
	static testMethod void getDescriptionDetailsFromXml_Bad(){
		String overallBody =  '<overallScore/>';
								 
		LitleMidFormController controller = new LitleMidFormController();
		DescriptionDetails descDetails = controller.getDescriptionDetailFromXml(overallBody, 'code');
		System.assertEquals(null,descDetails.getCodeOrScore());
		System.assertEquals(null,descDetails.getDescription());
	}
	static testMethod void getDescriptionDetailsFromXml_Ugly(){
		String overallBody =  '<overallScore>'
								 + '<code>40</code>'
								 + '<description>Last name, address &amp; SSN or phone verified; first name, phone or SSN verification failures</description>'
								 + '</overallScore>';
		LitleMidFormController controller = new LitleMidFormController();
		DescriptionDetails descDetails = controller.getDescriptionDetailFromXml(overallBody, '');
		System.assertEquals(null,descDetails.getCodeOrScore());
		System.assertEquals(null,descDetails.getDescription());
		
		descDetails = controller.getDescriptionDetailFromXml(overallBody, null);
		System.assertEquals(null,descDetails.getCodeOrScore());
		System.assertEquals(null,descDetails.getDescription());
		
		descDetails = controller.getDescriptionDetailFromXml('', 'code');
		System.assertEquals(null,descDetails.getCodeOrScore());
		System.assertEquals(null,descDetails.getDescription());
		
		descDetails = controller.getDescriptionDetailFromXml(null, 'code');
		System.assertEquals(null,descDetails.getCodeOrScore());
		System.assertEquals(null,descDetails.getDescription());
	}
		
		// TODO Handle risk indicators
	
		
}