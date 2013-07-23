package com.litle.salesforce.payfac;

import org.junit.Test;
import org.openqa.selenium.By;

public class RemoveApex extends BaseSeleniumTestCase {
    @Test
    public void removeApex() throws Exception {
        // Login to the build instance
        login(props.getProperty("login.build.username"), props.getProperty("login.build.password"));

        removeAllApex();

        logout();
    }

    private void removeAllApex() {
        driver.findElement(By.id("DevTools_font")).click();
        //Remove tabs
        waitFor(By.id("CustomTabs_font")); //Tabs
        driver.findElement(By.id("CustomTabs_font")).click();
        waitFor(By.linkText("What Is This?"));
        Long count = 0L;
        do {
            driver.findElement(By.className("dataRow")).findElement(By.linkText("Del")).click();
            driver.switchTo().alert().accept();
            //waitFor(By.linkText("What is This?"));

            count = (Long)driver.executeScript("return document.getElementsByClassName('dataRow').length");
        } while(count != 0L);

        //Remove pages
        driver.findElement(By.id("DevToolsIntegrate_font")).click(); //Develop
        waitFor(By.id("ApexPages_font"));
        driver.findElement(By.id("ApexPages_font")).click(); //Pages
        waitFor(By.className("listRelatedObject"));
        count = 0L;
        do {
            driver.findElement(By.className("dataRow")).findElement(By.linkText("Del")).click();
            driver.switchTo().alert().accept();
            //waitFor(By.className("listRelatedObject"));

            count = (Long)driver.executeScript("return document.getElementsByClassName('dataRow').length");
        } while(count != 0L);
        waitFor(By.id("ApexClasses_font"));

        //Remove Apex Classess
        driver.findElement(By.id("ApexClasses_font")).click(); // //Apex Classes
        waitFor(By.id("all_classes_page:theTemplate:messagesForm:compileAll"));
        count = 0L;
        do {
            driver.findElement(By.className("dataRow")).findElement(By.linkText("Del")).click();
            driver.switchTo().alert().accept();
            //waitFor(By.id("all_classes_page:theTemplate:messagesForm:compileAll"));

            count = (Long)driver.executeScript("return document.getElementsByClassName('dataRow').length");
        } while(count != 0L);

    }
}