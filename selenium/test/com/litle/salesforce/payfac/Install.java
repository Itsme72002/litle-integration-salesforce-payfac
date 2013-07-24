package com.litle.salesforce.payfac;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;

public class Install extends BaseSeleniumTestCase {
    @Test
    public void packageCreationAndInstallation() throws Exception {
        // Login to the build instance
        login(props.getProperty("login.build.username"), props.getProperty("login.build.password"));

        String installUrl = uploadPackage();
        System.setProperty("SALESFORCE_INSTALL_URL", installUrl);
        logout();

        //Login to the test instance
        login(props.getProperty("login.test.username"), props.getProperty("login.test.password"));

        //Install the package
        installPackage(installUrl);

        //Get and verify list of installed packages
        verifyInstalledPackage();
        addButtonsToLayouts();

        logout();
    }

    private void addButtonsToLayouts() {
        getToEditAccountLinkScreen();
        addButtonsToLayout();

        getTooEditOpportunityLinkScreen();
        addButtonsToLayout();
    }

    private void addButtonsToLayout() {
        // Drag buttons
        WebElement buttonsLink = null;
        for (WebElement selector : driver.findElement(By.id("troughSelector")).findElements(
                By.className("selectorItem"))) {
            if (selector.getText().equals("Buttons")) {
                buttonsLink = selector;
            }
        }
        assertNotNull("Couldn't find Buttons in trough", buttonsLink);
        buttonsLink.click();

        List<WebElement> buttons = driver.findElement(By.id("fieldTrough")).findElements(By.className("item"));
        for (WebElement button : buttons) {
            try {
                if(button.getText().contains("Litle")) {
                    System.out.println("Moving button to custom buttons area with text: " + button.getText());

                    Actions builder = new Actions(driver);
                    WebElement customButtonArea = driver.findElement(By.className("customButtons"));
                    Action dragAndDrop = builder.clickAndHold(button).moveToElement(customButtonArea).release(customButtonArea)
                            .build();
                    dragAndDrop.perform();
                    break;
                }
            } catch(StaleElementReferenceException ex) {}
        }
        WebElement saveButton = null;
        for (WebElement button : driver.findElement(By.id("saveBtn")).findElements(By.tagName("button"))) {
            try {
                System.out.println("Found button with text: " + button.getText());
                if (button.getText().equals("Save")) {
                    saveButton = button;
                    break;
                }
            } catch(StaleElementReferenceException ex) {}
        }
        assertNotNull("Couldn't find save button", saveButton);
        saveButton.click();
        waitFor(By.id("LayoutList_body"));
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
        if(installText.contains("Please try this again")) {
            System.out.println("Install text was: " + installText);
            System.out.println("Trying again");
            driver.get(installUrl);
            waitFor(By.id("InstallPackagePage:InstallPackageForm:InstallBtn"));
            driver.findElement(By.id("InstallPackagePage:InstallPackageForm:InstallBtn")).click(); //Continue
            driver.findElement(By.className("pbBottomButtons")).findElement(By.name("goNext")).click(); //Next (API Access)
            driver.findElement(By.className("pbBottomButtons")).findElement(By.name("goNext")).click(); //Next again (Security level)
            driver.findElement(By.className("pbBottomButtons")).findElement(By.name("save")).click(); //Install
            installText = waitForMessage("Waiting for install to complete", "Install Complete");
        }
        assertTrue(installText, installText.contains("Install Complete"));
    }

    private String uploadPackage() throws InterruptedException {
        driver.findElement(By.id("DevTools_font")).click();
        waitFor(By.id("Package_font"));
        driver.findElement(By.id("Package_font")).click();
        waitFor(By.linkText("LitleSalesforceMP"));

        WebElement packageLink = driver.findElement(By.linkText("LitleSalesforceMP"));
        packageLink.click();

        //Upload the managed package
        waitFor(By.className("pbHeader"));
        WebElement uploadButton = findButtonOrFail("Upload the current package");
        assertNotNull("Couldn't find upload button", uploadButton);
        uploadButton.click();
        String id = "ExportPackagePage:UploadPackageForm:PackageDetailsPageBlock:PackageDetailsBlockSection:VersionInfoSectionItem:VersionText";
        waitFor(By.id(id));

        int tries = 0;
        Long count = 0L;
        do {
            if(tries % 2 == 0) {
                System.out.println("Entering version name with selenium");
                driver.findElement(By.id(id)).clear(); //Version name
                driver.findElement(By.id(id)).sendKeys("Selenium Test");
            }
            else {
                System.out.println("Entering version name with javascript");
                driver.executeScript("document.getElementById('"+id+"').value = 'Selenium Test'");
            }
            driver.findElement(By.id("ExportPackagePage:UploadPackageForm:PackageDetailsPageBlock:PackageDetailsPageBlockButtons:upload")).click(); //Upload button
            count = (Long)driver.executeScript("return document.getElementsByClassName('errorMsg').length");
            tries++;
        } while(count != 0L);

        String uploadText = waitForMessage("Waiting for upload to complete", "Your package is now available for install");
        System.out.println();
        assertTrue(uploadText, uploadText.contains("Your package is now available for install"));
        String installUrl = null;
        List<WebElement> findElements = driver.findElement(By.id("ExportPackageDetailPage:theForm:versionDetailBlock")).findElements(By.tagName("a"));
        for(WebElement e : findElements) {
            if(e.getText().contains("packaging")) {
                installUrl = e.getAttribute("href");
            }
        }
        assertNotNull("Couldn't find install url", installUrl);
        System.out.println("Install url: " + installUrl);
        return installUrl;
    }

    private WebElement findButtonOrFail(String buttonTitle) {
        WebElement found = null;
        List<WebElement> inputs = driver.findElements(By.tagName("input"));
        for(WebElement input : inputs) {
            String title = input.getAttribute("title");
            if(!title.trim().equals("")) {
                System.out.println("Looking at title " + title);
            }
            if(title.contains(buttonTitle)) {
                found = input;
                break;
            }
        }
        assertNotNull("Couldn't find " + buttonTitle + " button", found);
        return found;
    }

    private void checkPackageDetails() {
        driver.findElement(By.linkText(PACKAGE_NAME)).click();
        // Let the package details part load
        waitFor(By.id("ep"));
        //Validate the package details
        WebElement table = driver.findElement(By.className("detailList"));
        String tableText = table.getText();
        assertTrue(tableText, tableText.contains(PACKAGE_NAME));
        assertTrue(tableText, tableText.contains("Managed"));
        assertTrue(tableText, tableText.contains("Litle & Co."));
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