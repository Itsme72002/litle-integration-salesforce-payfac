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
        for(int i = 0; i < 45; i++) {
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
        //System.out.println("Login page loaded");
        //System.out.println("Done sleeping");
        //Login
        //waitFor(By.id("infobarcontent"));
        //waitFor(By.id("username"));
        //waitFor(By.id("Login"));
        //WebElement field = driver.findElement(By.id("username"));
        WebElement field = driver.findElement(By.cssSelector("html body#loginpage div#pagewrap div#contentwrap div#content.content div#login_form_box form#login div.inputs div.inputbox span input#username.txtbox"));
        field.clear();
        field.sendKeys(username);
        field = driver.findElement(By.id("password"));
        field.clear();
        field.sendKeys(password);
        driver.findElement(By.id("Login")).click();
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

    protected void uninstallPackageIfInstalledAlready() throws Exception {
        driver.findElement(By.id("ImportedPackage_font")).click(); //Installed Packages
        waitFor(By.className("pbBody"));
    
        if(driver.findElement(By.className("pbBody")).getText().contains("No packages installed")) {
            return; //Already installed
        }
    
        driver.findElement(By.linkText("Uninstall")).click();
        waitFor(By.id("p5"));
        driver.findElement(By.id("p5")).click(); //Yes, I want to uninstall
        driver.findElement(By.name("save")).click(); //Uninstall
    
    }

}
