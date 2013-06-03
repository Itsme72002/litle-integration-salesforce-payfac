package com.litle.salesforce.payfac;

import static org.junit.Assert.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.support.events.EventFiringWebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;

public class TestInstallation {
	static EventFiringWebDriver driver;
	static WebDriverWait wait;
	static final long DEFAULT_TIMEOUT = 60;
	// Stores config details e.g.file paths 
	static Properties configProperties;
	// Stores MP package details e.g package name, publisher
	static Properties packageProperties;
	
	@Before
	public void before() {
		
		configProperties = new Properties();
		packageProperties = new Properties();
		try {
            //load a properties file
    		configProperties.load(new FileInputStream("config.properties"));
    		packageProperties.load(new FileInputStream("package.properties"));
      	} catch (IOException ex) {
    		ex.printStackTrace();
    		fail("Failed to load property file(s)");
        }
    	//Setup firefox properties in config.properties
		System.setProperty("webdriver.firefox.bin", configProperties.getProperty("firefox.location"));
		FirefoxProfile profile = new FirefoxProfile(new File(configProperties.getProperty("firefox.profile.path"))); //TODO Make me different
		profile.setEnableNativeEvents(true);
		driver = new EventFiringWebDriver(new FirefoxDriver(profile));
		wait = new WebDriverWait(driver, DEFAULT_TIMEOUT);
	}

	@After
	public void after() {
		driver.quit();
	}

	void waitFor(By locator) {
		wait.until(ExpectedConditions.visibilityOfElementLocated(locator));
	}

	@Test
	public void initialLogin() {
		// Get to login screen
		login();
		//Get list of installed packages
		checkInstalledPackage();
		checkPackageDetails();
		checkPackageComponents();
	}

	private void login() {
		driver.get(packageProperties.getProperty("login.url"));
		/*Properties userProperties = new Properties();
		try {
            //load user properties file
    		userProperties.load(new FileInputStream("/usr/local/litle-home/shande/user.properties"));
      	} catch (IOException ex) {
      		ex.printStackTrace();
      		fail("Unable to load the properties file");
        }*/
		//Login
		WebElement field = driver.findElement(By.id("username"));
		field.clear();
		field.sendKeys(packageProperties.getProperty("login.username")); //This is the dev test suite
		field = driver.findElement(By.id("password"));
		field.clear();
		field.sendKeys(packageProperties.getProperty("login.password")); //DO NOT PROMOTE ME YET
		driver.findElement(By.id("Login")).click();
		waitFor(By.id("tabContainer"));
	}
	
	private void checkPackageDetails() {
		driver.findElement(By.linkText(packageProperties.getProperty("package.name"))).click();
		// Let the package details part load
		waitFor(By.id("ep"));
		//Validate the package details
		List<WebElement> packageDetails = driver.findElement(By.className("detailList")).findElements(By.tagName("td"));
		//Check package name
		assertTrue(packageDetails.get(0).getText().equals("Package Name"));
		assertTrue(packageDetails.get(1).getText().equals(packageProperties.getProperty("package.name")));
		//Check package type
		assertTrue(packageDetails.get(6).getText().equals("Package Type"));
		assertTrue(packageDetails.get(7).getText().equals(packageProperties.getProperty("package.type")));
		//Check namespace prefix
		assertTrue(packageDetails.get(12).getText().equals("Namespace Prefix"));
		assertTrue(packageDetails.get(13).getText().equals(packageProperties.getProperty("package.namespacePrefix")));
		//Check publisher
		assertTrue(packageDetails.get(16).getText().equals("Publisher"));
		assertTrue(packageDetails.get(17).getText().equals(packageProperties.getProperty("package.publisher")));
	}

	private void checkInstalledPackage() {
		driver.findElement(By.id("ImportedPackage_font")).click(); //Text is "Installed Packages"
		waitFor(By.className("content"));
		// Check if the page is correct "Installed Packages"
		assertTrue(driver.findElement(By.className("content")).findElement(By.tagName("h1")).getText().equals("Installed Packages"));
		// Check if the package is installed 
		assertTrue(driver.findElement(By.linkText(packageProperties.getProperty("package.name"))).getText().equals(packageProperties.getProperty("package.name")));
	}
	
	private void checkPackageComponents(){
		driver.findElement(By.id("topButtonRow")).findElement(By.name("viewComponents")).click();
		// wait for the package components div to load
		waitFor(By.className("bRelatedList"));
		// get all the rows that hold the component values
		List<WebElement> packageComponents = driver.findElements(By.className("dataCell"));
		// Number of elements should be three times the number of components
		assertEquals(18, packageComponents.size());
		// Check all the components name with their parent object(if any) and type.
		
		// Check if a "Litle" button is created with parent object as "Account" and
		// of type "Button or link"
		assertTrue(packageComponents.get(0).getText().equals("Litle"));
		assertTrue(packageComponents.get(1).getText().equals("Account"));
		assertTrue(packageComponents.get(2).getText().equals("Button or Link"));
		
		// Check if a "LoginControl" class is created of type "Apex Class"
		assertTrue(packageComponents.get(3).getText().equals("LoginControl"));
		assertTrue(packageComponents.get(5).getText().equals("Apex Class"));

		// Check if a "LoginControlTest" class is created of type "Apex Class"
		assertTrue(packageComponents.get(6).getText().equals("LoginControlTest"));
		assertTrue(packageComponents.get(8).getText().equals("Apex Class"));
		
		// Check if a "MockHttpResponseGenerator" class is created of type "Apex Class"
		assertTrue(packageComponents.get(9).getText().equals("MockHttpResponseGenerator"));
		assertTrue(packageComponents.get(11).getText().equals("Apex Class"));
		
		// Check if a "forceMock" app is created of type "App"
		assertTrue(packageComponents.get(12).getText().equals(packageProperties.getProperty("app.name")));
		assertTrue(packageComponents.get(14).getText().equals("App"));
		
		// Check if a "test" page is created of type "Visualforce Page"
		assertTrue(packageComponents.get(15).getText().equals("test"));
		assertTrue(packageComponents.get(17).getText().equals("Visualforce Page"));				
	}

	
}