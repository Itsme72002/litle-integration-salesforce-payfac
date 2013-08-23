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
private class ResetControllerTest {

    static testMethod void resetAll() {
        ResetController controller = new ResetController();
        controller.resetAll();
        List<Opportunity> opportunities = [Select o.AccountId, o.PayFac_Portal_Link__c, o.Litle_MID__c,
    							o.Type, o.StageName, o.Probability, o.Name, 
    							o.LeadSource, o.LastModifiedDate,  
    							o.Description, o.CloseDate
								From Opportunity o];
    	System.assertEquals(1, opportunities.size());
    	System.assertEquals(null, opportunities.get(0).PayFac_Portal_Link__c);
    	System.assertEquals(null, opportunities.get(0).Litle_MID__c);
    	System.assertEquals('New Customer', opportunities.get(0).Type);
    	System.assertEquals('Prospecting', opportunities.get(0).StageName);
    	System.assertEquals(10, opportunities.get(0).Probability);
    	System.assertEquals('Pyramid Construction Lowell Branch', opportunities.get(0).Name);
    	System.assertEquals('Web', opportunities.get(0).LeadSource);
    	System.assertEquals('This is a demo Opportunity', opportunities.get(0).Description);
    	
    	List<Account> accounts = [Select a.PayFac_Portal_Link__c, 
    								a.Litle_MID__c, a.Website, a.Type, 
    								a.TickerSymbol, a.Sic, a.ShippingStreet, 
    								a.ShippingState, a.ShippingPostalCode, 
    								a.Ownership, a.Rating, 
    								a.ShippingCountry, a.ShippingCity, a.Description,  a.Phone,
    								a.Name, a.Industry, a.Id, a.Fax, 
    								a.BillingStreet, a.BillingState, a.BillingPostalCode, 
    								a.BillingCountry, a.BillingCity, a.AnnualRevenue 
								From Account a];
    	System.assertEquals(1, accounts.size());
    	System.assertEquals(null, accounts.get(0).PayFac_Portal_Link__c);
    	System.assertEquals(null, accounts.get(0).Litle_MID__c);
    	System.assertEquals('http://www.pyramid.com', accounts.get(0).Website);
    	System.assertEquals('Customer - Channel', accounts.get(0).Type);
    	System.assertEquals('PYR', accounts.get(0).TickerSymbol);
    	System.assertEquals('4253', accounts.get(0).Sic);
    	System.assertEquals('900 Chelmsford St', accounts.get(0).ShippingStreet);
    	System.assertEquals('MA', accounts.get(0).ShippingState);
    	System.assertEquals('Lowell', accounts.get(0).ShippingCity);
    	System.assertEquals('01851', accounts.get(0).ShippingPostalCode);
    	System.assertEquals('USA', accounts.get(0).ShippingCountry);
    	System.assertEquals('Private', accounts.get(0).Ownership);
    	System.assertEquals('Warm', accounts.get(0).Rating);
    	System.assertEquals('This is a demo Account', accounts.get(0).Description);
    	System.assertEquals('(014) 427-4427', accounts.get(0).Phone);
    	System.assertEquals('Pyramid Construction Inc', accounts.get(0).Name);
    	System.assertEquals('Construction', accounts.get(0).Industry);
    	System.assertEquals('(014) 427-4428', accounts.get(0).Fax);
    	System.assertEquals('900 Chelmsford St', accounts.get(0).BillingStreet);
    	System.assertEquals('MA', accounts.get(0).BillingState);
    	System.assertEquals('01851', accounts.get(0).BillingPostalCode);
    	System.assertEquals('USA', accounts.get(0).BillingCountry);
    	System.assertEquals('Lowell', accounts.get(0).BillingCity);
    	System.assertEquals(950000000, accounts.get(0).AnnualRevenue);   
    	
    	
    	List<SalesforceLitleMappingsObject__c> mapObjects = [select merchantUsername__c ,
																litleEnvironment__c ,
																subMerchantPspMerchantId__c ,
														        subMerchantPspMerchantIdX__c ,
																subMerchantMerchantName__c ,
														        subMerchantMerchantNameX__c ,
														        subMerchantMerchantCategoryCodeD__c ,
														        subMerchantMerchantCategoryCodeX__c ,
														        subMerchantHardCodeBillingDescriptor__c ,
														        subMerchantHardCodeBillingDescriptorX__c ,
																subMerchantCustomerServiceNumber__c ,
														        subMerchantCustomerServiceNumberX__c ,
																subMerchantMaxTransactionAmount__c ,
														        subMerchantMaxTransactionAmountX__c ,
																subMerchantStateProvince__c ,
														        subMerchantStateProvinceX__c ,
														        subMerchantStreetAddress1__c,
														        subMerchantStreetAddress1X__c ,
														        subMerchantCity__c,
														        subMerchantCityX__c ,
														        subMerchantCountryCode__c,
														        subMerchantCountryCodeX__c ,
														        subMerchantPostalCode__c,
														        subMerchantPostalCodeX__c ,
														        legalEntityStateProvince__c,
																legalEntityStateProvinceX__c ,
																legalEntityStreetAddress1__c,
																legalEntityStreetAddress1X__c ,
																legalEntityCity__c,
																legalEntityCityX__c ,
														        legalEntityPostalCode__c,
																legalEntityPostalCodeX__c ,
																legalEntityCountryCode__c,
																legalEntityCountryCodeX__c ,
																legalEntityPrincipalCity__c,
																legalEntityPrincipalCityX__c ,
																legalEntityPrincipalCountryCode__c,
																legalEntityPrincipalCountryCodeX__c ,
																legalEntityPrincipalPostalCode__c,
																legalEntityPrincipalPostalCodeX__c ,
														        legalEntityPrincipalStateProvince__c,
																legalEntityPrincipalStateProvinceX__c ,
																legalEntityPrincipalStreetAddress1__c,
																legalEntityPrincipalStreetAddress1X__c ,
																legalEntityContactPhone__c ,
																legalEntityContactPhoneX__c ,
																legalEntityName__c ,
																legalEntityNameX__c ,
																legalEntityTypeD__c ,
																legalEntityHasAcceptedCreditCardsD__c,
																legalEntityHasAcceptedCreditCardsX__c,
																legalEntityAnnualCreditCardSalesVolume__c ,
																legalEntityAnnualCreditCardSalesVolumeX__c ,
																legalEntityPrincipalContactPhone__c ,
																legalEntityPrincipalContactPhoneX__c ,
																legalEntityPrincipalFirstNameD__c ,
																legalEntityPrincipalFirstNameX__c ,
																legalEntityPrincipalLastNameD__c ,
																legalEntityPrincipalLastNameX__c ,
														        subMerchantFirstNameD__c ,
														        subMerchantFirstNameX__c ,
														        subMerchantLastNameD__c ,
														        subMerchantLastNameX__c ,
														        subMerchantPhone__c ,
														        subMerchantPhoneX__c,
														        subMerchantEmailAddressD__c,
														        subMerchantEmailAddressX__c 
														        from SalesforceLitleMappingsObject__c];
    	/////////////
    	//THE FOLLOWING ASSERTS HAVE ACTUAL AND EXPECTED FLIPPED 
    	System.assertEquals(mapObjects.get(0).merchantUsername__c , 'PSPXMLV8');
		System.assertEquals(mapObjects.get(0).litleEnvironment__c , 'CERT');
		//psp sub merchant id - mapped to sf field
		System.assertEquals(mapObjects.get(0).subMerchantPspMerchantId__c , 'Account.Industry');
        System.assertEquals(mapObjects.get(0).subMerchantPspMerchantIdX__c , true);
		//merchant name - mapped to account name
		System.assertEquals(mapObjects.get(0).subMerchantMerchantName__c , 'Account.Name');
        System.assertEquals(mapObjects.get(0).subMerchantMerchantNameX__c , true);
		//merchant category code mapped to default value
        System.assertEquals(mapObjects.get(0).subMerchantMerchantCategoryCodeD__c , '7997');
        System.assertEquals(mapObjects.get(0).subMerchantMerchantCategoryCodeX__c , false);
		//default billing descriptor mapped to default value
        System.assertEquals(mapObjects.get(0).subMerchantHardCodeBillingDescriptor__c , 'Account.Industry');
        System.assertEquals(mapObjects.get(0).subMerchantHardCodeBillingDescriptorX__c , true);
		//customer service number mapped to account phone number
		System.assertEquals(mapObjects.get(0).subMerchantCustomerServiceNumber__c , 'Account.Phone');
        System.assertEquals(mapObjects.get(0).subMerchantCustomerServiceNumberX__c , true);
		//Max transaction amount mapped to opportunity 
		System.assertEquals(mapObjects.get(0).subMerchantMaxTransactionAmount__c , 'Account.AnnualRevenue');
        System.assertEquals(mapObjects.get(0).subMerchantMaxTransactionAmountX__c , true);
		//addresses mapped to account address
		System.assertEquals(mapObjects.get(0).subMerchantStateProvince__c , 'Account.BillingState');
        System.assertEquals(mapObjects.get(0).subMerchantStateProvinceX__c , true);
        System.assertEquals(mapObjects.get(0).subMerchantStreetAddress1__c, 'Account.BillingStreet');
        System.assertEquals(mapObjects.get(0).subMerchantStreetAddress1X__c , true);
        System.assertEquals(mapObjects.get(0).subMerchantCity__c, 'Account.BillingCity');
        System.assertEquals(mapObjects.get(0).subMerchantCityX__c , true);
        System.assertEquals(mapObjects.get(0).subMerchantCountryCode__c, 'Account.BillingCountry');
        System.assertEquals(mapObjects.get(0).subMerchantCountryCodeX__c , true);
        System.assertEquals(mapObjects.get(0).subMerchantPostalCode__c, 'Account.BillingPostalCode');
        System.assertEquals(mapObjects.get(0).subMerchantPostalCodeX__c , true);
        
        System.assertEquals(mapObjects.get(0).legalEntityStateProvince__c, 'Account.BillingState');
		System.assertEquals(mapObjects.get(0).legalEntityStateProvinceX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityStreetAddress1__c, 'Account.BillingStreet');
		System.assertEquals(mapObjects.get(0).legalEntityStreetAddress1X__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityCity__c, 'Account.BillingCity');
		System.assertEquals(mapObjects.get(0).legalEntityCityX__c , true);
        System.assertEquals(mapObjects.get(0).legalEntityPostalCode__c, 'Account.BillingPostalCode');
		System.assertEquals(mapObjects.get(0).legalEntityPostalCodeX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityCountryCode__c, 'Account.BillingCountry');
		System.assertEquals(mapObjects.get(0).legalEntityCountryCodeX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityHasAcceptedCreditCardsD__c, 'false');
		System.assertEquals(mapObjects.get(0).legalEntityHasAcceptedCreditCardsX__c , false);
		
		
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalCity__c, 'Account.BillingCity');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalCityX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalCountryCode__c, 'Account.BillingCountry');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalCountryCodeX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalPostalCode__c, 'Account.BillingPostalCode');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalPostalCodeX__c , true);
        System.assertEquals(mapObjects.get(0).legalEntityPrincipalStateProvince__c, 'Account.BillingState');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalStateProvinceX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalStreetAddress1__c, 'Account.BillingStreet');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalStreetAddress1X__c , true);
		
		
		System.assertEquals(mapObjects.get(0).legalEntityContactPhone__c , 'Account.Phone');
		System.assertEquals(mapObjects.get(0).legalEntityContactPhoneX__c , true);
		//legal entity name mapped to opportunity name
		System.assertEquals(mapObjects.get(0).legalEntityName__c , 'Account.Name');
		System.assertEquals(mapObjects.get(0).legalEntityNameX__c , true);
		//type individual sole
		System.assertEquals(mapObjects.get(0).legalEntityTypeD__c , 'Individual Sole Proprietorship');
		//annual credit card sales volume mapped to AnnualRevenue
		System.assertEquals(mapObjects.get(0).legalEntityAnnualCreditCardSalesVolume__c , 'Account.AnnualRevenue');
		System.assertEquals(mapObjects.get(0).legalEntityAnnualCreditCardSalesVolumeX__c , true);
		//first name,last name, phone from account
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalContactPhone__c , 'Account.Phone');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalContactPhoneX__c , true);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalFirstNameD__c , 'John');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalFirstNameX__c , false);
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalLastNameD__c , 'Doe');
		System.assertEquals(mapObjects.get(0).legalEntityPrincipalLastNameX__c , false);
		
        System.assertEquals(mapObjects.get(0).subMerchantFirstNameD__c , 'John');
        System.assertEquals(mapObjects.get(0).subMerchantFirstNameX__c , false);
        System.assertEquals(mapObjects.get(0).subMerchantLastNameD__c , 'Doe');
        System.assertEquals(mapObjects.get(0).subMerchantLastNameX__c , false);
        System.assertEquals(mapObjects.get(0).subMerchantEmailAddressD__c , 'johnDoe@pyramid.com');
        System.assertEquals(mapObjects.get(0).subMerchantEmailAddressX__c , false);
        System.assertEquals(mapObjects.get(0).subMerchantPhone__c , 'Account.Phone');
        System.assertEquals(mapObjects.get(0).subMerchantPhoneX__c , true);
    }
}