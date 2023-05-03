*** Settings ***
Library    AppiumLibrary

*** Variables ***
${url}             http://localhost:4723/wd/hub
${Plataforma}      Android
${Oneplus7}        483131cb
${emulador}        emulator-5554
${pixel4}          99171FFAZ00958  
${package}         br.com.sankhya.bia
${activity}        br.com.sankhya.bia.sankhya_bia.MainActivity
${endpointDEV}     http://bia-dev.sa-east-1.elasticbeanstalk.com/ 
${endpointProd}    http://bia-production.sa-east-1.elasticbeanstalk.com/

*** Test Cases ***
# Loguin na BIA com conta em modo desenvolvedor e com conta já logada 1x
Loguin na BIA com sucesso
    Dado que eu abra o app da bia
    E confirme o endpoint de meu desejo
    Quando eu clicar no botão confirmar
    Então poderei ver o feed da BIA
        


*** Keywords ***
Dado que eu abra o app da bia
    Open Application     ${url}    platformName=${Plataforma}    deviceName=${pixel4}    appPackage=${package}    appActivity=${activity}   automationName=appium

E confirme o endpoint de meu desejo
    Element Should Contain Text      class:android.widget.EditText    ${endpointDEV}  

Quando eu clicar no botão confirmar
    Click Element                    class:android.widget.Button

Então poderei ver o feed da BIA
    Element Should Be Visible        android.view.View