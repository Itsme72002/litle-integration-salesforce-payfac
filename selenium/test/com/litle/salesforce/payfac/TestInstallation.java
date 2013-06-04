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
		//driver.quit();
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
		//assertTrue(packageDetails.get(12).getText().equals("Namespace Prefix"));
		//assertTrue(packageDetails.get(13).getText().equals(packageProperties.getProperty("package.namespacePrefix")));
		//Check publisher
		assertTrue(packageDetails.get(12).getText().equals("Publisher"));
		assertTrue(packageDetails.get(13).getText().equals(packageProperties.getProperty("package.publisher")));
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
		assertEquals(504, packageComponents.size());
		// Check all the components name with their parent object(if any) and type.
		
		// Check if a "Litle" button is created with parent object as "Account" and
		// of type packageProperties.getProperty("package.type.button")
		assertTrue(packageComponents.get(3).getText().equals("LegalEntityModel"));
		assertTrue(packageComponents.get(5).getText().equals(packageProperties.getProperty("package.type.apex")));
		assertTrue(packageComponents.get(6).getText().equals("LegalEntityModelTest"));
		assertTrue(packageComponents.get(8).getText().equals(packageProperties.getProperty("package.type.apex")));
		assertTrue(packageComponents.get(9).getText().equals("Litle"));
		assertTrue(packageComponents.get(10).getText().equals("Account"));
		assertTrue(packageComponents.get(11).getText().equals(packageProperties.getProperty("package.type.button")));
		assertTrue(packageComponents.get(12).getText().equals("LitleSalesforceMP"));
		assertTrue(packageComponents.get(14).getText().equals(packageProperties.getProperty("package.type.app")));
		assertTrue(packageComponents.get(15).getText().equals("Litle_Fields_Mapping"));
		assertTrue(packageComponents.get(16).getText().equals("Account"));
		assertTrue(packageComponents.get(17).getText().equals(packageProperties.getProperty("package.type.button")));
		assertTrue(packageComponents.get(18).getText().equals("LoginControl"));
		assertTrue(packageComponents.get(20).getText().equals(packageProperties.getProperty("package.type.apex")));
		assertTrue(packageComponents.get(21).getText().equals("LoginControlTest"));
		assertTrue(packageComponents.get(23).getText().equals(packageProperties.getProperty("package.type.apex")));
		assertTrue(packageComponents.get(24).getText().equals("MockHttpResponseGenerator"));
		assertTrue(packageComponents.get(26).getText().equals(packageProperties.getProperty("package.type.apex")));
		assertTrue(packageComponents.get(27).getText().equals("SalesforceLitleMapping"));
		assertTrue(packageComponents.get(29).getText().equals(packageProperties.getProperty("package.type.page")));
		assertTrue(packageComponents.get(30).getText().equals("SalesforceLitleMappingController"));
		assertTrue(packageComponents.get(32).getText().equals(packageProperties.getProperty("package.type.apex")));
		assertTrue(packageComponents.get(33).getText().equals("SalesforceLitleMappingControllerTest"));
		assertTrue(packageComponents.get(35).getText().equals(packageProperties.getProperty("package.type.apex")));
		assertTrue(packageComponents.get(36).getText().equals(packageProperties.getProperty("package.object.name")));
		assertTrue(packageComponents.get(38).getText().equals(packageProperties.getProperty("package.type.object")));
		assertTrue(packageComponents.get(39).getText().equals(packageProperties.getProperty("package.object.name")));
		assertTrue(packageComponents.get(41).getText().equals("Tab"));
		assertTrue(packageComponents.get(42).getText().equals("SubMerchantModel"));
		assertTrue(packageComponents.get(44).getText().equals(packageProperties.getProperty("package.type.apex")));
		assertTrue(packageComponents.get(45).getText().equals("SubMerchantModelTest"));
		assertTrue(packageComponents.get(47).getText().equals(packageProperties.getProperty("package.type.apex")));

        assertTrue(packageComponents.get(48).getText().equals("legalEntityAnnualCreditCardSalesVolume"));
        assertTrue(packageComponents.get(49).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(50).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(51).getText().equals("legalEntityAnnualCreditCardSalesVolumeD"));
        assertTrue(packageComponents.get(52).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(53).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(54).getText().equals("legalEntityAnnualCreditCardSalesVolumeX"));
        assertTrue(packageComponents.get(55).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(56).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(57).getText().equals("legalEntityCity"));
        assertTrue(packageComponents.get(58).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(59).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(60).getText().equals("legalEntityCityD"));
        assertTrue(packageComponents.get(61).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(62).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(63).getText().equals("legalEntityCityX"));
        assertTrue(packageComponents.get(64).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(65).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(66).getText().equals("legalEntityContactPhone"));
        assertTrue(packageComponents.get(67).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(68).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(69).getText().equals("legalEntityContactPhoneD"));
        assertTrue(packageComponents.get(70).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(71).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(72).getText().equals("legalEntityContactPhoneX"));
        assertTrue(packageComponents.get(73).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(74).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(75).getText().equals("legalEntityCountryCode"));
        assertTrue(packageComponents.get(76).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(77).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(78).getText().equals("legalEntityCountryCodeD"));
        assertTrue(packageComponents.get(79).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(80).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(81).getText().equals("legalEntityCountryCodeX"));
        assertTrue(packageComponents.get(82).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(83).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(84).getText().equals("legalEntityDateOfBirth"));
        assertTrue(packageComponents.get(85).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(86).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(87).getText().equals("legalEntityDateOfBirthD"));
        assertTrue(packageComponents.get(88).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(89).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(90).getText().equals("legalEntityDateOfBirthX"));
        assertTrue(packageComponents.get(91).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(92).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(93).getText().equals("legalEntityDriversLicense"));
        assertTrue(packageComponents.get(94).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(95).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(96).getText().equals("legalEntityDriversLicenseD"));
        assertTrue(packageComponents.get(97).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(98).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(99).getText().equals("legalEntityDriversLicenseState"));
        assertTrue(packageComponents.get(100).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(101).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(102).getText().equals("legalEntityDriversLicenseStateD"));
        assertTrue(packageComponents.get(103).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(104).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(105).getText().equals("legalEntityDriversLicenseStateX"));
        assertTrue(packageComponents.get(106).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(107).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(108).getText().equals("legalEntityDriversLicenseX"));
        assertTrue(packageComponents.get(109).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(110).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(111).getText().equals("legalEntityEmailAddress"));
        assertTrue(packageComponents.get(112).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(113).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(114).getText().equals("legalEntityEmailAddressD"));
        assertTrue(packageComponents.get(115).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(116).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(117).getText().equals("legalEntityEmailAddressX"));
        assertTrue(packageComponents.get(118).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(119).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(120).getText().equals("legalEntityFirstName"));
        assertTrue(packageComponents.get(121).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(122).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(123).getText().equals("legalEntityFirstNameD"));
        assertTrue(packageComponents.get(124).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(125).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(126).getText().equals("legalEntityFirstNameX"));
        assertTrue(packageComponents.get(127).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(128).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(129).getText().equals("legalEntityHasAcceptedCreditCards"));
        assertTrue(packageComponents.get(130).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(131).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(132).getText().equals("legalEntityHasAcceptedCreditCardsDefault"));
        assertTrue(packageComponents.get(133).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(134).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(135).getText().equals("legalEntityHasAcceptedCreditCardsX"));
        assertTrue(packageComponents.get(136).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(137).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(138).getText().equals("legalEntityIsExclusiveToPsp"));
        assertTrue(packageComponents.get(139).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(140).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(141).getText().equals("legalEntityIsExclusiveToPspD"));
        assertTrue(packageComponents.get(142).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(143).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(144).getText().equals("legalEntityIsExclusiveToPspX"));
        assertTrue(packageComponents.get(145).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(146).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(147).getText().equals("legalEntityIsPciComplianceValidated"));
        assertTrue(packageComponents.get(148).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(149).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(150).getText().equals("legalEntityIsPciComplianceValidatedD"));
        assertTrue(packageComponents.get(151).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(152).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(153).getText().equals("legalEntityIsPciComplianceValidatedX"));
        assertTrue(packageComponents.get(154).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(155).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(156).getText().equals("legalEntityLastName"));
        assertTrue(packageComponents.get(157).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(158).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(159).getText().equals("legalEntityLastNameD"));
        assertTrue(packageComponents.get(160).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(161).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(162).getText().equals("legalEntityLastNameX"));
        assertTrue(packageComponents.get(163).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(164).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(165).getText().equals("legalEntityMostRecentlyPassedScan"));
        assertTrue(packageComponents.get(166).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(167).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(168).getText().equals("legalEntityMostRecentlyPassedScanD"));
        assertTrue(packageComponents.get(169).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(170).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(171).getText().equals("legalEntityMostRecentlyPassedScanX"));
        assertTrue(packageComponents.get(172).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(173).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(174).getText().equals("legalEntityName"));
        assertTrue(packageComponents.get(175).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(176).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(177).getText().equals("legalEntityNameD"));
        assertTrue(packageComponents.get(178).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(179).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(180).getText().equals("legalEntityNameX"));
        assertTrue(packageComponents.get(181).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(182).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(183).getText().equals("legalEntityObject Layout"));
        assertTrue(packageComponents.get(184).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(185).getText().equals("Page Layout"));
        assertTrue(packageComponents.get(186).getText().equals("legalEntityPciLevel"));
        assertTrue(packageComponents.get(187).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(188).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(189).getText().equals("legalEntityPciLevelD"));
        assertTrue(packageComponents.get(190).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(191).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(192).getText().equals("legalEntityPciLevelX"));
        assertTrue(packageComponents.get(193).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(194).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(195).getText().equals("legalEntityPostalCode"));
        assertTrue(packageComponents.get(196).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(197).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(198).getText().equals("legalEntityPostalCodeD"));
        assertTrue(packageComponents.get(199).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(200).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(201).getText().equals("legalEntityPostalCodeX"));
        assertTrue(packageComponents.get(202).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(203).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(204).getText().equals("legalEntityQualifiedSecurityAssessor"));
        assertTrue(packageComponents.get(205).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(206).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(207).getText().equals("legalEntityQualifiedSecurityAssessorD"));
        assertTrue(packageComponents.get(208).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(209).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(210).getText().equals("legalEntityQualifiedSecurityAssessorX"));
        assertTrue(packageComponents.get(211).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(212).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(213).getText().equals("legalEntityReportOnCompliance"));
        assertTrue(packageComponents.get(214).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(215).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(216).getText().equals("legalEntityReportOnComplianceD"));
        assertTrue(packageComponents.get(217).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(218).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(219).getText().equals("legalEntityReportOnComplianceX"));
        assertTrue(packageComponents.get(220).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(221).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(222).getText().equals("legalEntityScanningVendor"));
        assertTrue(packageComponents.get(223).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(224).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(225).getText().equals("legalEntityScanningVendorD"));
        assertTrue(packageComponents.get(226).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(227).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(228).getText().equals("legalEntityScanningVendorX"));
        assertTrue(packageComponents.get(229).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(230).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(231).getText().equals("legalEntitySsn"));
        assertTrue(packageComponents.get(232).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(233).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(234).getText().equals("legalEntitySsnD"));
        assertTrue(packageComponents.get(235).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(236).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(237).getText().equals("legalEntitySsnX"));
        assertTrue(packageComponents.get(238).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(239).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(240).getText().equals("legalEntityStateProvince"));
        assertTrue(packageComponents.get(241).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(242).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(243).getText().equals("legalEntityStateProvinceD"));
        assertTrue(packageComponents.get(244).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(245).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(246).getText().equals("legalEntityStateProvinceX"));
        assertTrue(packageComponents.get(247).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(248).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(249).getText().equals("legalEntityStreetAddress1"));
        assertTrue(packageComponents.get(250).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(251).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(252).getText().equals("legalEntityStreetAddress1D"));
        assertTrue(packageComponents.get(253).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(254).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(255).getText().equals("legalEntityStreetAddress1X"));
        assertTrue(packageComponents.get(256).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(257).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(258).getText().equals("legalEntityStreetAddress2"));
        assertTrue(packageComponents.get(259).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(260).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(261).getText().equals("legalEntityStreetAddress2D"));
        assertTrue(packageComponents.get(262).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(263).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(264).getText().equals("legalEntityStreetAddress2X"));
        assertTrue(packageComponents.get(265).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(266).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(267).getText().equals("legalEntityTaxId"));
        assertTrue(packageComponents.get(268).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(269).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(270).getText().equals("legalEntityTaxIdD"));
        assertTrue(packageComponents.get(271).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(272).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(273).getText().equals("legalEntityTaxIdX"));
        assertTrue(packageComponents.get(274).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(275).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(276).getText().equals("legalEntityType"));
        assertTrue(packageComponents.get(277).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(278).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(279).getText().equals("legalEntityTypeD"));
        assertTrue(packageComponents.get(280).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(281).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(282).getText().equals("legalEntityTypeX"));
        assertTrue(packageComponents.get(283).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(284).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(285).getText().equals("subMerchantAmexMid"));
        assertTrue(packageComponents.get(286).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(287).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(288).getText().equals("subMerchantAmexMidDefault"));
        assertTrue(packageComponents.get(289).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(290).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(291).getText().equals("subMerchantAmexMidX"));
        assertTrue(packageComponents.get(292).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(293).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(294).getText().equals("subMerchantBankAccountNumber"));
        assertTrue(packageComponents.get(295).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(296).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(297).getText().equals("subMerchantBankAccountNumberDefault"));
        assertTrue(packageComponents.get(298).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(299).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(300).getText().equals("subMerchantBankAccountNumberX"));
        assertTrue(packageComponents.get(301).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(302).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(303).getText().equals("subMerchantBankRoutingNumber"));
        assertTrue(packageComponents.get(304).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(305).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(306).getText().equals("subMerchantBankRoutingNumberDefault"));
        assertTrue(packageComponents.get(307).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(308).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(309).getText().equals("subMerchantBankRoutingNumberX"));
        assertTrue(packageComponents.get(310).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(311).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(312).getText().equals("subMerchantCity"));
        assertTrue(packageComponents.get(313).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(314).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(315).getText().equals("subMerchantCityDefault"));
        assertTrue(packageComponents.get(316).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(317).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(318).getText().equals("subMerchantCityX"));
        assertTrue(packageComponents.get(319).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(320).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(321).getText().equals("subMerchantCountryCode"));
        assertTrue(packageComponents.get(322).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(323).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(324).getText().equals("subMerchantCountryCodeDefault"));
        assertTrue(packageComponents.get(325).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(326).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(327).getText().equals("subMerchantCountryCodeX"));
        assertTrue(packageComponents.get(328).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(329).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(330).getText().equals("subMerchantCreateCredentials"));
        assertTrue(packageComponents.get(331).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(332).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(333).getText().equals("subMerchantCreateCredentialsDefault"));
        assertTrue(packageComponents.get(334).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(335).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(336).getText().equals("subMerchantCreateCredentialsX"));
        assertTrue(packageComponents.get(337).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(338).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(339).getText().equals("subMerchantCustomerServiceNumber"));
        assertTrue(packageComponents.get(340).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(341).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(342).getText().equals("subMerchantCustomerServiceNumberDefault"));
        assertTrue(packageComponents.get(343).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(344).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(345).getText().equals("subMerchantCustomerServiceNumberX"));
        assertTrue(packageComponents.get(346).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(347).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(348).getText().equals("subMerchantDiscoverConveyMid"));
        assertTrue(packageComponents.get(349).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(350).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(351).getText().equals("subMerchantDiscoverConveyMidDefault"));
        assertTrue(packageComponents.get(352).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(353).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(354).getText().equals("subMerchantDiscoverConveyMidX"));
        assertTrue(packageComponents.get(355).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(356).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(357).getText().equals("subMerchantEmailAddress"));
        assertTrue(packageComponents.get(358).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(359).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(360).getText().equals("subMerchantEmailAddressDefault"));
        assertTrue(packageComponents.get(361).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(362).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(363).getText().equals("subMerchantEmailAddressX"));
        assertTrue(packageComponents.get(364).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(365).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(366).getText().equals("subMerchantFirstName"));
        assertTrue(packageComponents.get(367).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(368).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(369).getText().equals("subMerchantFirstNameDefault"));
        assertTrue(packageComponents.get(370).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(371).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(372).getText().equals("subMerchantFirstNameX"));
        assertTrue(packageComponents.get(373).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(374).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(375).getText().equals("subMerchantHardCodeBillingDescD"));
        assertTrue(packageComponents.get(376).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(377).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(378).getText().equals("subMerchantHardCodeBillingDescriptor"));
        assertTrue(packageComponents.get(379).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(380).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(381).getText().equals("subMerchantHardCodeBillingDescriptorX"));
        assertTrue(packageComponents.get(382).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(383).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(384).getText().equals("subMerchantLastName"));
        assertTrue(packageComponents.get(385).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(386).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(387).getText().equals("subMerchantLastNameDefault"));
        assertTrue(packageComponents.get(388).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(389).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(390).getText().equals("subMerchantLastNameX"));
        assertTrue(packageComponents.get(391).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(392).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(393).getText().equals("subMerchantMaxTransactionAmount"));
        assertTrue(packageComponents.get(394).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(395).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(396).getText().equals("subMerchantMaxTransactionAmountDefault"));
        assertTrue(packageComponents.get(397).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(398).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(399).getText().equals("subMerchantMaxTransactionAmountX"));
        assertTrue(packageComponents.get(400).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(401).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(402).getText().equals("subMerchantMerchantCategoryCode"));
        assertTrue(packageComponents.get(403).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(404).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(405).getText().equals("subMerchantMerchantCategoryCodeDefault"));
        assertTrue(packageComponents.get(406).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(407).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(408).getText().equals("subMerchantMerchantCategoryCodeX"));
        assertTrue(packageComponents.get(409).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(410).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(411).getText().equals("subMerchantMerchantName"));
        assertTrue(packageComponents.get(412).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(413).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(414).getText().equals("subMerchantMerchantNameDefault"));
        assertTrue(packageComponents.get(415).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(416).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(417).getText().equals("subMerchantMerchantNameX"));
        assertTrue(packageComponents.get(418).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(419).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(420).getText().equals("subMerchantPhone"));
        assertTrue(packageComponents.get(421).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(422).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(423).getText().equals("subMerchantPhoneDefault"));
        assertTrue(packageComponents.get(424).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(425).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(426).getText().equals("subMerchantPhoneX"));
        assertTrue(packageComponents.get(427).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(428).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(429).getText().equals("subMerchantPostalCode"));
        assertTrue(packageComponents.get(430).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(431).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(432).getText().equals("subMerchantPostalCodeDefault"));
        assertTrue(packageComponents.get(433).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(434).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(435).getText().equals("subMerchantPostalCodeX"));
        assertTrue(packageComponents.get(436).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(437).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(438).getText().equals("subMerchantPspMerchantId"));
        assertTrue(packageComponents.get(439).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(440).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(441).getText().equals("subMerchantPspMerchantIdDefault"));
        assertTrue(packageComponents.get(442).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(443).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(444).getText().equals("subMerchantPspMerchantIdX"));
        assertTrue(packageComponents.get(445).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(446).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(447).getText().equals("subMerchantStateProvince"));
        assertTrue(packageComponents.get(448).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(449).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(450).getText().equals("subMerchantStateProvinceDefault"));
        assertTrue(packageComponents.get(451).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(452).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(453).getText().equals("subMerchantStateProvinceX"));
        assertTrue(packageComponents.get(454).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(455).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(456).getText().equals("subMerchantStreetAddress1"));
        assertTrue(packageComponents.get(457).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(458).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(459).getText().equals("subMerchantStreetAddress1Default"));
        assertTrue(packageComponents.get(460).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(461).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(462).getText().equals("subMerchantStreetAddress1X"));
        assertTrue(packageComponents.get(463).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(464).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(465).getText().equals("subMerchantStreetAddress2"));
        assertTrue(packageComponents.get(466).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(467).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(468).getText().equals("subMerchantStreetAddress2Default"));
        assertTrue(packageComponents.get(469).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(470).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(471).getText().equals("subMerchantStreetAddress2X"));
        assertTrue(packageComponents.get(472).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(473).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(474).getText().equals("subMerchantUrl"));
        assertTrue(packageComponents.get(475).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(476).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(477).getText().equals("subMerchantUrlDefault"));
        assertTrue(packageComponents.get(478).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(479).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(480).getText().equals("subMerchantUrlX"));
        assertTrue(packageComponents.get(481).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(482).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(483).getText().equals("subMerchanteCheckBillingDescD"));
        assertTrue(packageComponents.get(484).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(485).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(486).getText().equals("subMerchanteCheckBillingDescriptor"));
        assertTrue(packageComponents.get(487).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(488).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(489).getText().equals("subMerchanteCheckBillingDescriptorX"));
        assertTrue(packageComponents.get(490).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(491).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(492).getText().equals("subMerchanteCheckCompanyName"));
        assertTrue(packageComponents.get(493).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(494).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(495).getText().equals("subMerchanteCheckCompanyNameDefault"));
        assertTrue(packageComponents.get(496).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(497).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(498).getText().equals("subMerchanteCheckCompanyNameX"));
        assertTrue(packageComponents.get(499).getText().equals(packageProperties.getProperty("package.object.name")));
        assertTrue(packageComponents.get(500).getText().equals(packageProperties.getProperty("package.type.field")));
        assertTrue(packageComponents.get(501).getText().equals("test"));
        assertTrue(packageComponents.get(503).getText().equals(packageProperties.getProperty("package.type.page")));
	}

	
}