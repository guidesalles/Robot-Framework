*** Settings ***
Library             AppiumLibrary   


*** Test Cases ***
Open_Aplication
    Open Application    http://localhost:4723/wd/hub     platformName=Android    deviceName=emulator-5554      appPackage=com.oneblinc.one.one_app.dev      appActivity=com.oneblinc.one.one_app.MainActivity     automationName=appium

Check if buttons are Enabled   
    Element Should Be Enabled           accessibility_id=CREATE YOUR ACCONT
    Element Should Be Enabled           accessibility_id=LOG INTO MY ACCONT

Criar Conta
    Wait Until Page Contains Element    xpath=//android.widget.Button[@content-desc="CREATE YOUR ACCONT"]
    Click Element                       xpath=//android.widget.Button[@content-desc="CREATE YOUR ACCONT"]

Selecionar Produto  
    Wait Until Page Contains Element    xpath=//android.widget.CheckBox[@content-desc="LOANS Get up to $2,000 instantly when you need!"]                                          
    Click Element                       xpath=//android.widget.CheckBox[@content-desc="LOANS Get up to $2,000 instantly when you need!"]

