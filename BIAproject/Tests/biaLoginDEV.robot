*** Settings ***
Library    AppiumLibrary

*** Test Cases ***
Open_App
    Open Application     http://localhost:4723/wd/hub    platformName=Android    deviceName=483131cb    appPackage=br.com.sankhya.bia    appActivity=br.com.sankhya.bia.sankhya_bia.MainActivity   automationName=appium

