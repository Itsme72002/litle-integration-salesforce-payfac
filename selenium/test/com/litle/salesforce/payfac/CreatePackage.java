package com.litle.salesforce.payfac;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;

public class CreatePackage extends BaseSeleniumTestCase {
    @Test
    public void createThePackage() throws Exception {
        // Login to the build instance
        login(props.getProperty("login.build.username"), props.getProperty("login.build.password"));

        runCodeCoverage();

        createPackage();

        logout();
    }

    private void runCodeCoverage() throws Exception {
        driver.findElement(By.id("DevToolsIntegrate_font")).click(); //AppSetup -> Develop
        waitFor(By.id("ApexClasses_font"));
        driver.findElement(By.id("ApexClasses_font")).click(); //Apex Classes
        waitFor(By.id("all_classes_page:theTemplate:messagesForm:calcLink"));

        driver.findElement(By.id("all_classes_page:theTemplate:theForm:runAllTestsButton")).click(); //Run all tests
        waitFor(By.id("OptionsButton"));
    }

    private void createPackage() throws Exception {
        //Create a managed package
        driver.findElement(By.id("DevTools_font")).click(); //AppSetup -> Create
        waitFor(By.id("Package_font"));
        driver.findElement(By.id("Package_font")).click(); //Packages
        waitFor(By.name("new"));

        //Delete old packages
        System.out.println("Deleting old packages");
        WebElement packageToRemove = null;
        Long length = (Long)driver.executeScript("return document.getElementsByClassName('dataRow').length");
        if(length > 0) {
            packageToRemove = driver.findElement(By.className("dataRow"));
        }
        else {
            System.out.println("No packages to remove");
        }
        while(packageToRemove != null) {
            System.out.println("Package to remove: " + packageToRemove.getText());
            WebElement packageNameLink = packageToRemove.findElement(By.tagName("th"));
            System.out.println("Package name link: " + packageNameLink.getText());
            packageNameLink = packageNameLink.findElement(By.tagName("a"));
            System.out.println("Package name link: " + packageNameLink.getText());
            packageNameLink.click();
            waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:packageExportsTab_cell"));

            //Remove uploaded versions
            WebElement versionTab = null;
            List<WebElement> list = driver.findElement(By.id("ViewAllPackage:theForm:mainDetailBlock:packageExportsTab_cell")).findElements(By.tagName("td"));
            for(WebElement e : list) {
                if(e.getText().equals("Versions")) {
                    versionTab = e;
                }
            }
            assertNotNull("Couldn't find 'Versions' tab", versionTab);
            versionTab.click();
            System.out.println("Deprecating packages");
            waitFor(By.className("headerRow"));

            while(true) {
                try {
                    System.out.println("Found a deprecate link, so clicking it");
                    WebElement deprecateLink = driver.findElement(By.linkText("Deprecate"));
                    deprecateLink.click();
                    String deprecateButtonId = "simpleDialog0button0";
                    waitFor(By.id(deprecateButtonId));
                    driver.findElement(By.id(deprecateButtonId)).click(); //Click the confirm button
                    driver.navigate().refresh();
                    waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:packageExportsTab_cell"));

                    //Remove uploaded versions
                    versionTab = null;
                    list = driver.findElement(By.id("ViewAllPackage:theForm:mainDetailBlock:packageExportsTab_cell")).findElements(By.tagName("td"));
                    for(WebElement e : list) {
                        if(e.getText().equals("Versions")) {
                            versionTab = e;
                        }
                    }
                    assertNotNull("Couldn't find 'Versions' tab", versionTab);
                    versionTab.click();
                    System.out.println("Deprecating packages");
                    waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:packageExportsList"));
                } catch(NoSuchElementException e) {
                    break;
                }
            }

            System.out.println("Done deprecating");

            //Delete the package
            System.out.println("----------------------\nDeleting the package");
            WebElement deleteButton = findButtonOrFail("Delete the current package");
            deleteButton.click();
            driver.switchTo().alert().accept();

            waitFor(By.name("new"));

            length = (Long)driver.executeScript("return document.getElementsByClassName('dataRow').length");
            if(length > 0) {
                packageToRemove = driver.findElement(By.className("dataRow"));
            } else {
                packageToRemove = null;
            }
        }

        waitFor(By.name("new"));
        driver.findElement(By.name("new")).click(); //New button
        System.out.println("----------------------\nCreating a new empty package");
        waitFor(By.id("Name"));
        waitFor(By.id("IsManaged"));
        driver.findElement(By.id("Name")).clear();
        driver.findElement(By.id("Name")).sendKeys(PACKAGE_NAME);
        //driver.findElement(By.id("IsManaged")).click(); Don't make it managed here, we go back to do this later
        //driver.switchTo().alert().accept();
        driver.findElement(By.name("save")).click();
        int tries = 0;
        while(driver.executeScript("return document.getElementById('errorDiv_ep')") != null) {
            if(tries % 2 == 0) {
                System.out.println("The save had errors - try again with selenium");
                driver.findElement(By.id("errorDiv_ep"));
                driver.findElement(By.id("Name")).clear();
                driver.findElement(By.id("Name")).sendKeys(PACKAGE_NAME);
            } else {
                System.out.println("The save had errors - try again with javascript");
                driver.executeScript("document.getElementsByName('Name')[0].value = '"+PACKAGE_NAME+"'");
            }
            driver.findElement(By.name("save")).click();
            tries++;
        }

        //Add components to package - Apex Class
        System.out.println("----------------------\nAdding components to the package");

        //First time Apex Classes
        WebElement addButton = findButtonOrFail("Add components to the package");
        addButton.click();
        waitFor(By.id("entityType"));
        iSelectFromSelect("Apex Class", "entityType");
        driver.findElement(By.id("allBox")).click();
        driver.findElement(By.id("bottomButtonRow")).findElement(By.name("save")).click(); //Add to Package
        waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:tabButtons:tabButtons:addComponent"));

        //Second time Apex Classes
        addButton = findButtonOrFail("Add components to the package");
        addButton.click();
        waitFor(By.id("entityType"));
        iSelectFromSelect("Apex Class", "entityType");
        driver.findElement(By.id("allBox")).click();
        driver.findElement(By.id("bottomButtonRow")).findElement(By.name("save")).click(); //Add to Package
        waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:tabButtons:tabButtons:addComponent"));

        //Third time Apex Classes
        addButton = findButtonOrFail("Add components to the package");
        addButton.click();
        waitFor(By.id("entityType"));
        iSelectFromSelect("Apex Class", "entityType");
        driver.findElement(By.id("allBox")).click();
        driver.findElement(By.id("bottomButtonRow")).findElement(By.name("save")).click(); //Add to Package
        waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:tabButtons:tabButtons:addComponent"));

        addButton = findButtonOrFail("Add components to the package");
        addButton.click();
        addComponents("Button or Link");
        waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:tabButtons:tabButtons:addComponent"));

        addButton = findButtonOrFail("Add components to the package");
        addButton.click();
        addComponents("Page Layout");
        waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:tabButtons:tabButtons:addComponent"));

        addButton = findButtonOrFail("Add components to the package");
        addButton.click();
        addComponents("Visualforce Page");
        waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:tabButtons:tabButtons:addComponent"));

        WebElement backToPackageList = driver.findElement(By.linkText("Back to Package List"));
        assertNotNull("Couldn't find Back To Package List", backToPackageList);
        backToPackageList.click();
        waitFor(By.name("new"));

        WebElement editButton = findButtonOrFail("Edit");
        editButton.click();
        waitFor(By.id("appDistDevSettingsWarning"));

        WebElement continueButton = findButtonOrFail("Continue");
        continueButton.click();
        waitFor(By.id("allPackageId"));

        iSelectFromSelect("LitleSalesforceMP", "allPackageId");
        WebElement reviewButton = findButtonOrFail("Review My Selections");
        assertNotNull("Couldn't find review my selections button", reviewButton);
        reviewButton.click();
        waitFor(By.id("stageForm"));

        WebElement save = findButtonOrFail("Save");
        save.click();
        waitFor(By.name("new"));
    }

    private WebElement findButtonByValue(String buttonValue) {
        WebElement found = null;
        List<WebElement> inputs = driver.findElements(By.tagName("input"));
        for(WebElement input : inputs) {
            String value = input.getAttribute("value");
            if(value.contains(buttonValue)) {
                found = input;
                break;
            }
        }
        return found;
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

    private void addComponents(String selectTitle) {
//        waitFor(By.id("ViewAllPackage:theForm:mainDetailBlock:tabButtons:tabButtons:addComponent"));
//        driver.findElement(By.id("ViewAllPackage:theForm:mainDetailBlock:tabButtons:tabButtons:addComponent")).click();
        waitFor(By.id("entityType"));
        iSelectFromSelect(selectTitle, "entityType");
        List<WebElement> findElements = driver.findElements(By.name("ids"));
        for(WebElement e : findElements) {
            String title = e.getAttribute("title");
            if(title.contains("Litle")) {
                e.click();
            }
        }
        driver.findElement(By.id("bottomButtonRow")).findElement(By.name("save")).click(); //Add to Package
    }
}