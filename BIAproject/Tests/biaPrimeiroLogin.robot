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
    E eu clicar no botão entrar
    Quando eu der as autorizações do Android
    Então poderei ver o feed da BIA
        


*** Keywords ***
Dado que eu abra o app da bia
    Open Application     ${url}    platformName=${Plataforma}    deviceName=${emulador}    appPackage=${package}    appActivity=${activity}   automationName=appium

E clique no botão pular tutorial
    Wait Until Element Is Visible    accessibility_id=PULAR       timeout=20   
    Click Element                    accessibility_id=PULAR

E preencha o banco
    Wait Until Page Contains Element         class=android.widget.EditText    timeout=10
    Click Text                               Endereço externo*
    Input Text Into Current Element          ${urlBancoProd}  
    Hide Keyboard                            
    Click Element                            accessibility_id=PRÓXIMO

E fizer o login correto
    Wait Until Page Contains Element        class=android.widget.EditText
    Click Text                              Usuário  
    Input Text                              class=android.widget.EditText    ${loginBIA}
    Click Text                              Senha  
    Input Text Into Current Element         ${senhaBIA} 
    Hide Keyboard       

E eu clicar no botão entrar
    Click Element        accessibility_id=ENTRAR

Quando eu der as autorizações do Android
    Wait Until Element Is Visible        id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Click Element                        id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Element Is Visible        id=com.android.permissioncontroller:id/permission_allow_button
    Click Element                        id=com.android.permissioncontroller:id/permission_allow_button

Então poderei ver o feed da BIA
    Wait Until Element Is Visible            class=android.view.View               timeout=6 
    Element Should Be Visible                class=android.view.View
