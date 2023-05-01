*** Settings ***
Library   SeleniumLibrary

*** Keywords ***
Given que eu acesse o Linkedin
    Open Browser    url=https://br.linkedin.com/    browser=Chrome
    Maximize Browser Window