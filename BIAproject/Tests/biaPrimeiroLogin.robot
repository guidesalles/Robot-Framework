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
${urlBancoProd}    https://skw.sankhya.com.br
${endpointDEV}     http://bia-dev.sa-east-1.elasticbeanstalk.com/ 
${endpointProd}    http://bia-production.sa-east-1.elasticbeanstalk.com/
${loginBIA}        BIA
${senhaBIA}        sankhya08

*** Test Cases ***
# Primeiro login
Loguin na BIA com sucesso
    Dado que eu abra o app da bia
    E clique no botão pular tutorial
    E preencha o banco
    E fizer o login correto
    Quando eu clicar no botão entrar
    Então poderei ver o feed da BIA
        


*** Keywords ***
Dado que eu abra o app da bia
    Open Application     ${url}    platformName=${Plataforma}    deviceName=${pixel4}    appPackage=${package}    appActivity=${activity}   automationName=appium

E clique no botão pular tutorial
    Wait Until Element Is Visible    accessibility_id=PULAR    
    Click Element                    accessibility_id=PULAR

E preencha o banco
    Wait Until Element Is Visible        accessibility_id=PRÓXIMO
    Input Text                           xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText    ${urlBancoProd}
    Click Element                        accessibility_id=PRÓXIMO      

E fizer o login correto
    Input Text           class=android.widget.EditText    ${loginBIA}
    Input Text           class=android.widget.EditText    ${senhaBIA}        

Quando eu clicar no botão entrar
    Click Element        accessibility_id=ENTRAR

Então poderei ver o feed da BIA
    Element Should Be Visible        android.view.View