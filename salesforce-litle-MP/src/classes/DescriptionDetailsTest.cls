@isTest
private class DescriptionDetailsTest {
	
	public static final String testString = 'test';

    static testMethod void testCodeOrScore(){
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
        // Check if the CodeOrScore is null initially
        System.assertEquals(descriptionDetails.getCodeOrScore(), null);
        descriptionDetails.setCodeOrScore(testString);
        // First check if the value is set
        System.assertNotEquals(descriptionDetails.getCodeOrScore(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(descriptionDetails.getCodeOrScore(), testString);
    }
    
    static testMethod void testDescription(){
    	DescriptionDetails descriptionDetails = new DescriptionDetails();
        // Check if the Description is null initially
        System.assertEquals(descriptionDetails.getDescription(), null);
        descriptionDetails.setDescription(testString);
        // First check if the value is set
        System.assertNotEquals(descriptionDetails.getDescription(), null);
        // and then confirm if the value is set correctly
        System.assertEquals(descriptionDetails.getDescription(), testString);
    }
}