package com.litle.salesforce.payfac;


import org.junit.Test;

public class TestUninstallation extends BaseSeleniumTestCase {

    @Test
    public void packageUninstallation() throws Exception {
        //Login to the test instance
        login(props.getProperty("login.test.username"), props.getProperty("login.test.password"));

        uninstallPackageIfInstalledAlready();

        logout();
    }
}