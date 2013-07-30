package com.litle.salesforce.payfac;

import org.junit.Test;

public class TestMappings extends BaseSeleniumTestCase {
//	private static final String LEGAL_ENTITY_NAME_DEFAULT_TXT_BOX_ID = "legalEntityNameDefaultTxtBox";
//    private static final String LEGAL_ENTITY_NAME_LIST_ID = "legalEntityNameList";
//    static EventFiringWebDriver driver;
//	static WebDriverWait wait;
//	static final long DEFAULT_TIMEOUT = 600;
//	// Stores config details e.g.file paths
//	static Properties configProperties;
//	// Stores MP package details e.g package name, publisher
//	static Properties packageProperties;
//	static final String TEST_TEXT = "test";
//	static final String PACKAGE_NAME = "LitleSalesforceMP";
//    static final String PACKAGE_TYPE = "Unmanaged";
//    static final String PACKAGE_NAMESPACEPREFIX = "forceMock";
//    static final String PACKAGE_PUBLISHER = "Litle & Co.";
//    static final String APP_NAME = "LitleSalesforceMP";
//    static final String PACKAGE_TYPE_APEX = "Apex Class";
//    static final String PACKAGE_TYPE_BUTTON = "Button or Link";
//    static final String PACKAGE_TYPE_PAGE = "Visualforce Page";
//    static final String PACKAGE_TYPE_OBJECT = "Custom Object";
//    static final String PACKAGE_TYPE_FIELD = "Custom Field";
//    static final String PACKAGE_TYPE_APP = "App";
//    static final String PACKAGE_OBJECT_NAME = "SalesforceLitleMappingsObject";

	@Test
	public void mappingsAreSavedProperly() throws Exception {
		/*
		 * 1. Login to salesforce instance
		 * 2. Go to mappings page
		 * 3. Select some value from the drop down and save
		 * 4. Go to mappings page again
		 * 5. Check if the value has been saved and its default textbox is grayed out(disabled)
		 * 6. Reset the select option and enter some value in the default text box and save
		 * 7. Go to mappings page
		 * 8. Check if the changes are getting reflected after save
		 */
	    login(props.getProperty("login.test.username"), props.getProperty("login.test.password"));
//		goToMappings();
//		chooseSelectOptionSave();
//		goToMappings();
//		checkSavedSelectOption();
//		chooseTextboxSave();
//		goToMappings();
//		checkSavedTextbox();
	}


//	//Navigate to the mapping page and wait for it to load
//	private void goToMappings(){
//	    driver.get(packageProperties.getProperty("login.url") + "/apex/"+PACKAGE_NAMESPACEPREFIX+"__SalesforceLitleMapping");
//	    waitFor(By.className("apexp"));
//	}
//
//	/*
//	 * Select a value from the select option,
//	 * wait for the corresponding default text box to gray out(disable)
//	 * and then save
//	 */
//	private void chooseSelectOptionSave(){
//	    resetSelectOptionForId(LEGAL_ENTITY_NAME_LIST_ID);
//	    resetTextboxForId(LEGAL_ENTITY_NAME_DEFAULT_TXT_BOX_ID);
//	    new Select(driver.findElement(By.xpath("//select[contains(@id, 'legalEntityNameList')]"))).selectByVisibleText("Account.Phone");
//
//	    wait.until(ExpectedConditions.not(new ExpectedCondition<Boolean>() {
//
//            @Override
//            public Boolean apply(WebDriver arg0) {
//                // TODO Auto-generated method stub
//                return driver.findElement(By.xpath("//input[contains(@id, 'legalEntityNameDefaultTxtBox')]")).isEnabled();
//            }
//        }));
//        driver.findElement(By.xpath("//input[contains(@id, 'saveMappingsBtn')]")).click();
//	    waitFor(By.className("messageTable"));
//	    assertEquals("Mappings Saved.",driver.findElement(By.className("messageText")).getText());
//	}
//
//	//Check if the Select option is saved correctly
//	private void checkSavedSelectOption(){
//	    assertEquals("Account.Phone", new Select(driver.findElement(By.xpath("//select[contains(@id, 'legalEntityNameList')]"))).getFirstSelectedOption().getText());
//	}
//
//	/*
//	 * Enter some value in the default text box
//	 * save and check if it is saved correctly
//	 */
//	private void chooseTextboxSave(){
//	    resetSelectOptionForId(LEGAL_ENTITY_NAME_LIST_ID);
//	    wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//input[contains(@id, 'legalEntityNameDefaultTxtBox')]")));
//	    resetTextboxEnterTextForId(LEGAL_ENTITY_NAME_DEFAULT_TXT_BOX_ID, TEST_TEXT);
//        driver.findElement(By.xpath("//input[contains(@id, 'saveMappingsBtn')]")).click();
//        waitFor(By.className("messageTable"));
//        assertEquals("Mappings Saved.",driver.findElement(By.className("messageText")).getText());
//
//	}
//
//    //Reset the Select List of the given ID
//    public void resetSelectOptionForId(String id) {
//        new Select(driver.findElement(By.xpath("//select[contains(@id, '"+id+"')]"))).selectByVisibleText("-- Select Option --");
//    }
//
//    //Reset the Textbox of the given ID
//    public void resetTextboxForId(String id){
//        WebElement field = driver.findElement(By.xpath("//input[contains(@id, '"+id+"')]"));
//        field.clear();
//    }
//
//    //Enter value in Textbox of the given ID, after clearing it
//    public void resetTextboxEnterTextForId(String id, String value){
//        WebElement field = driver.findElement(By.xpath("//input[contains(@id, '"+id+"')]"));
//        field.clear();
//        field.sendKeys(value);
//    }
//
//    //Confirm if the textbox value is saved correctly
//	private void checkSavedTextbox(){
//	    WebElement field = driver.findElement(By.xpath("//input[contains(@id, 'legalEntityNameDefaultTxtBox')]"));
//	    assertEquals(TEST_TEXT, field.getAttribute("value"));
//        //assertEquals(TEST_TEXT, (driver.findElement(By.xpath("//input[contains(@id, 'legalEntityNameDefaultTxtBox')]"))).getText());
//	}
}