package com.litle.salesforce.payfac;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class TestInstallation extends BaseSeleniumTestCase {
    @Test
    public void packageCreationAndInstallation() throws Exception {
        login(props.getProperty("login.test.username"), props.getProperty("login.test.password"));
        uninstallPackageIfInstalledAlready();
        logout();

        // Login to the build instance
        login(props.getProperty("login.build.username"), props.getProperty("login.build.password"));

        createPackage();

        String installUrl = uploadPackage();
        logout();

        //Login to the test instance
        login(props.getProperty("login.test.username"), props.getProperty("login.test.password"));

        //Install the package
        installPackage(installUrl);

        //Get and verify list of installed packages
        verifyInstalledPackage();

        logout();

        //Login to the build instance

        //Deprecate the package

        //Delete the package

    }

    private void verifyInstalledPackage() throws Exception {
        checkInstalledPackage();
        checkPackageDetails();
    }

    private void installPackage(String installUrl) throws InterruptedException {
        driver.get(installUrl);
        waitFor(By.id("InstallPackagePage:InstallPackageForm:InstallBtn"));
        driver.findElement(By.id("InstallPackagePage:InstallPackageForm:InstallBtn")).click(); //Continue
        driver.findElement(By.className("pbBottomButtons")).findElement(By.name("goNext")).click(); //Next (API Access)
        driver.findElement(By.className("pbBottomButtons")).findElement(By.name("goNext")).click(); //Next again (Security level)
        driver.findElement(By.className("pbBottomButtons")).findElement(By.name("save")).click(); //Install
        String installText = waitForMessage("Waiting for install to complete", "Install Complete");
        assertTrue(installText, installText.contains("Install Complete"));
    }

    private String uploadPackage() throws InterruptedException {
        List<WebElement> findElements;
        //Upload the managed package
        waitFor(By.className("pbHeader"));
        findElements = driver.findElement(By.className("pbHeader")).findElements(By.tagName("input"));
        WebElement uploadButton = null;
        for(WebElement e : findElements) {
            if(e.getAttribute("value").equals("Upload")) {
                uploadButton = e;
            }
        }
        assertNotNull("Couldn't find upload button", uploadButton);
        uploadButton.click();
        waitFor(By.id("ExportPackagePage:UploadPackageForm:PackageDetailsPageBlock:PackageDetailsBlockSection:VersionInfoSectionItem:VersionText"));
        driver.findElement(By.id("ExportPackagePage:UploadPackageForm:PackageDetailsPageBlock:PackageDetailsBlockSection:VersionInfoSectionItem:VersionText")).clear(); //Version name
        driver.findElement(By.id("ExportPackagePage:UploadPackageForm:PackageDetailsPageBlock:PackageDetailsBlockSection:VersionInfoSectionItem:VersionText")).sendKeys("Selenium Test");
        driver.findElement(By.id("ExportPackagePage:UploadPackageForm:PackageDetailsPageBlock:PackageDetailsPageBlockButtons:upload")).click(); //Upload button

        String uploadText = waitForMessage("Waiting for upload to complete", "Your package is now available for install");
        System.out.println();
        assertTrue(uploadText, uploadText.contains("Your package is now available for install"));
        String installUrl = null;
        findElements = driver.findElement(By.id("ExportPackageDetailPage:theForm:versionDetailBlock")).findElements(By.tagName("a"));
        for(WebElement e : findElements) {
            if(e.getText().contains("packaging")) {
                installUrl = e.getAttribute("href");
            }
        }
        assertNotNull("Couldn't find install url", installUrl);
        System.out.println("Install url: " + installUrl);
        return installUrl;
    }

    private void createPackage() {
        //Create a managed package
        driver.findElement(By.id("DevTools_font")).click(); //AppSetup -> Create
        waitFor(By.id("Package_font"));
        driver.findElement(By.id("Package_font")).click(); //Packages
        waitFor(By.name("new"));
        driver.findElement(By.name("new")).click(); //New button
        waitFor(By.id("Name"));
        driver.findElement(By.id("Name")).clear();
        driver.findElement(By.id("Name")).sendKeys(PACKAGE_NAME);
        driver.findElement(By.name("save")).click();
        //Add components to package
        driver.findElement(By.id("ViewAllPackage:theForm:mainDetailBlock:tabButtons:tabButtons:addComponent")).click();
        waitFor(By.id("entityType"));
        iSelectFromSelect("Apex Class", "entityType");
        //select all except XMLDom and startHereController
        driver.findElement(By.id("allBox")).click();
        List<WebElement> findElements = driver.findElements(By.name("ids"));
        for(WebElement e : findElements) {
            String title = e.getAttribute("title");
            if(title.contains("startHereController") || title.contains("XMLDom")) {
                e.click();
            }
        }
        driver.findElement(By.id("bottomButtonRow")).findElement(By.name("save")).click(); //Add to Package
    }

    private void checkPackageDetails() {
        driver.findElement(By.linkText(PACKAGE_NAME)).click();
        // Let the package details part load
        waitFor(By.id("ep"));
        //Validate the package details
        List<WebElement> packageDetails = driver.findElement(By.className("detailList")).findElements(By.tagName("td"));
        //Check package name
        assertTrue(packageDetails.get(0).getText().equals("Package Name"));
        assertTrue(packageDetails.get(1).getText().equals(PACKAGE_NAME));
        //Check package type
        assertTrue(packageDetails.get(6).getText().equals("Package Type"));
        //TODO Are we sure about this?  Can we install a Salesforce unmanaged package through the exchange?
        assertTrue(packageDetails.get(7).getText().equals("Unmanaged"));
        //Check publisher
        assertTrue(packageDetails.get(12).getText().equals("Publisher"));
        assertTrue(packageDetails.get(13).getText().equals("Litle & Co."));
    }

    private void checkInstalledPackage() {
        driver.findElement(By.id("ImportedPackage_font")).click(); //Text is "Installed Packages"
        waitFor(By.className("content"));
        // Check if the page is correct "Installed Packages"
        assertTrue(driver.findElement(By.className("content")).findElement(By.tagName("h1")).getText().equals("Installed Packages"));
        // Check if the package is installed
        assertTrue(driver.findElement(By.linkText(PACKAGE_NAME)).getText().equals(PACKAGE_NAME));
    }

}