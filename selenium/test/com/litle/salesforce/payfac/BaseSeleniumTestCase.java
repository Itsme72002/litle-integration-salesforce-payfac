package com.litle.salesforce.payfac;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.events.EventFiringWebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class BaseSeleniumTestCase {
    public static final String PACKAGE_NAME = "LitleSalesforceMP";
    public static EventFiringWebDriver driver;
    public static WebDriverWait wait;
    public static final long DEFAULT_TIMEOUT = 15;
    public static Properties props;

    @BeforeClass
    public static void oneTimeSeleniumSetup() {
        props = new Properties();
        try {
            //load a properties file
            props.load(new FileInputStream("build.properties"));
            props.load(new FileInputStream("custom_build.properties"));
        } catch (IOException ex) {
            ex.printStackTrace();
            fail("Failed to load property file(s)");
        }
        //Setup firefox properties in config.properties
        System.setProperty("webdriver.firefox.bin", props.getProperty("firefox.location"));
        FirefoxProfile profile = new FirefoxProfile(new File(props.getProperty("firefox.profile.path")));
        profile.setEnableNativeEvents(true);
        driver = new EventFiringWebDriver(new FirefoxDriver(profile));
        wait = new WebDriverWait(driver, DEFAULT_TIMEOUT);
    }

    @AfterClass
    public static void oneTimeSeleniumTearDown() {
        //driver.quit();
    }

    protected void logout() {
        List<WebElement> findElements;
        waitFor(By.id("userNavButton"));
        driver.findElement(By.id("userNavButton")).click();
        WebElement logoutLink = null;
        findElements = driver.findElement(By.id("userNav-menuItems")).findElements(By.tagName("a"));
        for(WebElement e : findElements) {
            if(e.getText().contains("Logout")) {
                logoutLink = e;
            }
        }
        assertNotNull("Couldn't find logout link", logoutLink);
        logoutLink.click();
    }

    protected String waitForMessage(String startPrintMessage, String waitForMessage) throws InterruptedException {
        waitFor(By.className("messageCell"));
        System.out.println(startPrintMessage);
        String messageText = null;
        for(int i = 0; i < 600; i++) {
            try {
                messageText = driver.findElement(By.className("messageCell")).getText();
            } catch(Exception e) {}
            if(messageText != null && messageText.contains(waitForMessage)) {
                break;
            }
            System.out.print(".");
            Thread.sleep(1000L);
        }
        return messageText;
    }

    protected void login(String username, String password) throws Exception {
        driver.get(props.getProperty("login.url"));

        int tries = 0;
        while(driver.executeScript("return document.getElementById('tabContainer')") == null) {
            if(tries % 2 == 0) {
                System.out.println("Trying with selenium");
                WebElement field = driver.findElement(By.id("username"));
                field.clear();
                field.sendKeys(username);
                field = driver.findElement(By.id("password"));
                field.clear();
                field.sendKeys(password);
            } else {
                System.out.println("Trying with javascript");
                driver.executeScript("document.getElementById('username').value = '" + username + "'");
                driver.executeScript("document.getElementById('password').value = '" + password + "'");
            }
            driver.findElement(By.id("Login")).click();
            Thread.sleep(1000L);
            tries++;
        }

//        int tries = 0;
//        while(driver.executeScript(return , args))
//        waitFor(By.id("username"));
//
//
//
//        int tries = 0;
//        while(driver.executeScript("return document.getElementById('errorDiv_ep')") != null) {
//            if(tries % 2 == 0) {
//                System.out.println("The save had errors - try again with selenium");
//                driver.findElement(By.id("errorDiv_ep"));
//                driver.findElement(By.id("Name")).clear();
//                driver.findElement(By.id("Name")).sendKeys(PACKAGE_NAME);
//            } else {
//                System.out.println("The save had errors - try again with javascript");
//                driver.executeScript("document.getElementsByName('Name')[0].value = '"+PACKAGE_NAME+"'");
//            }
//            driver.findElement(By.name("save")).click();
//            tries++;
//        }


        waitFor(By.id("tabContainer"));
    }

    protected void waitFor(By locator) {
        wait.until(ExpectedConditions.visibilityOfElementLocated(locator));
    }

    protected void iSelectFromSelect(String optionText, String selectId) {
        WebElement select = driver.findElement(By.id(selectId));
        List<WebElement> options = select.findElements(By.tagName("option"));
        for(WebElement option : options){
            if(option.getText().equals(optionText)) {
                option.click();
                break;
            }
        }
    }

    protected void getToEditAccountLinkScreen() {
        driver.findElement(By.id("Customize_font")).click(); //Customize
        waitFor(By.id("Account_font"));
        driver.findElement(By.id("Account_font")).click(); //Accounts
        waitFor(By.id("AccountLayouts_font"));
        driver.findElement(By.id("AccountLayouts_font")).click(); //Page Layouts
        waitFor(By.id("LayoutList_body"));
        WebElement editLink = null;
        for(WebElement link : driver.findElement(By.id("LayoutList_body")).findElements(By.tagName("a"))) {
            String title = link.getAttribute("title");
            if(title != null && title.contains("Edit") && title.contains("Account Layout")) {
                editLink = link;
            }
        }
        assertNotNull("Couldn't find edit Account Layout link", editLink);
        editLink.click();
        waitFor(By.id("troughRightPane"));
    }

    protected void getTooEditOpportunityLinkScreen() {
        //Remove Litle buttons from Opportunities
        driver.findElement(By.id("Customize_font")).click(); //Customize
        waitFor(By.id("Opportunity_font"));
        driver.findElement(By.id("Opportunity_font")).click(); //Accounts
        waitFor(By.id("OpportunityLayouts_font"));
        driver.findElement(By.id("OpportunityLayouts_font")).click(); //Page Layouts
        waitFor(By.id("LayoutList_body"));
        WebElement editLink = null;
        for(WebElement link : driver.findElement(By.id("LayoutList_body")).findElements(By.tagName("a"))) {
            String title = link.getAttribute("title");
            if(title != null && title.contains("Edit") && title.contains("Opportunity Layout")) {
                editLink = link;
            }
        }
        assertNotNull("Couldn't find edit Opportunity Layout link", editLink);
        editLink.click();

        //Drag buttons
        waitFor(By.id("troughRightPane"));

    }

    protected void uninstallPackageIfInstalledAlready() throws Exception {
        driver.findElement(By.id("ImportedPackage_font")).click(); //Installed Packages
        waitFor(By.className("pbBody"));

        if(driver.findElement(By.className("pbBody")).getText().contains("No packages installed")) {
            return; //Already installed
        }

        getToEditAccountLinkScreen();
        removeButtonsFromLayout();

        getTooEditOpportunityLinkScreen();
        removeButtonsFromLayout();

        driver.findElement(By.id("ImportedPackage_font")).click(); //Installed Packages
        waitFor(By.className("pbBody"));
        driver.findElement(By.linkText("Uninstall")).click();
        waitFor(By.id("p5"));
        driver.findElement(By.id("p5")).click(); //Yes, I want to uninstall
        driver.findElement(By.name("save")).click(); //Uninstall

    }

    private void removeButtonsFromLayout() {
        //Drag buttons
        WebElement trough = driver.findElement(By.id("troughRightPane"));
        for(WebElement button : driver.findElements(By.className("customButton"))) {
            Actions builder = new Actions(driver);

            Action dragAndDrop = builder.clickAndHold(button).moveToElement(trough).release(trough).build();
            dragAndDrop.perform();
        }
        //Save layout
        WebElement saveButton = null;
        for(WebElement button : driver.findElement(By.id("saveBtn")).findElements(By.tagName("button"))) {
            System.out.println("Found button with text: " + button.getText());
            if(button.getText().equals("Save")) {
                saveButton = button;
            }
        }
        assertNotNull("Couldn't find save button", saveButton);
        saveButton.click();
        waitFor(By.id("LayoutList_body"));
    }

}
