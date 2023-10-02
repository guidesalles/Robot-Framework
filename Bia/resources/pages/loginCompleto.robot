*** Settings ***

Resource    ../main.robot

*** Variables ***
${url}                 http://localhost:4723/wd/hub
${Plataforma}          Android
${Oneplus7}            483131cb
${emulador}            emulator-5554 
${package}             br.com.sankhya.bia
${activity}            br.com.sankhya.bia.sankhya_bia.MainActivity
${urlServidorProd}     https://skw.sankhya.com.br
${endpointDEV}         http://bia-dev.sa-east-1.elasticbeanstalk.com/ 
${endpointProd}        http://bia-production.sa-east-1.elasticbeanstalk.com/
${loginBIA}            BIA
${senhaBIA}            sankhya07

*** Keywords ***
Dado que eu abra o app da bia
    Open Application     ${url}    
    ...                  platformName=${Plataforma}    
    ...                  deviceName=${Oneplus7}    
    ...                  appPackage=${package}    
    ...                  appActivity=${activity}   
    ...                  automationName=appium

E clique no botão pular tutorial
    Wait Until Element Is Visible    accessibility_id=PULAR       timeout=20 
    Hide Keyboard  
    Click Element                    accessibility_id=PULAR

E preencha o banco
    Wait Until Page Contains Element         class=android.widget.EditText    timeout=20
    Click Element                            class=android.widget.EditText    
    Sleep                                    2
    Input Text Into Current Element          ${urlServidorProd}  
    Hide Keyboard                            
    Click Element                            accessibility_id=PRÓXIMO

E fizer o login correto
    Wait Until Page Contains Element        class=android.widget.EditText    timeout=15
    Click Element                           xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]     
    Input Text                              class=android.widget.EditText    ${loginBIA}
    Click Element                           xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2] 
    Sleep                                   1 
    Input Text Into Current Element         ${senhaBIA} 
    Hide Keyboard
    Click Element        accessibility_id=ENTRAR       

E aceitar os termos
    Wait Until Element Is Visible    accessibility_id=ACEITAR
    Click Element                    accessibility_id=ACEITAR

Quando eu der as autorizações do Android
    Wait Until Element Is Visible        id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Click Element                        id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Element Is Visible        id=com.android.permissioncontroller:id/permission_allow_button
    Click Element                        id=com.android.permissioncontroller:id/permission_allow_button
    Wait Until Element Is Visible        accessibility_id=Scrim       
    Click Element                        accessibility_id=Scrim

Então poderei ver o feed da BIA
    Wait Until Element Is Visible            class=android.view.View               timeout=6 
    Element Should Be Visible                class=android.view.View