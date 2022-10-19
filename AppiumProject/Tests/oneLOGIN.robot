*** Settings ***
Library             AppiumLibrary   


*** Test Cases ***
Open_Aplication
    Open Application    http://localhost:4723/wd/hub     platformName=Android    deviceName=emulator-5556      appPackage=com.oneblinc.one.one_app.dev      appActivity=com.oneblinc.one.one_app.MainActivity     automationName=appium

Check if buttons are Enabled   
    Element Should Be Enabled           accessibility_id=CREATE YOUR ACCONT
    Element Should Be Enabled           accessibility_id=LOG INTO MY ACCONT

Click Login 
    Wait Until Page Contains Element            accessibility_id=LOG INTO MY ACCONT
    Click Element                               accessibility_id=LOG INTO MY ACCONT                                            

Preencher login e senha 
    Wait Until Page Contains Element       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]
    Click Element                          xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]
    Input Text                             xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]        guilherme.soares@blinctek.com
    Click Element                          xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]
    Input Text                             xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]        @Aa11091990aA@           

Logar
    Wait Until Page Contains Element            accessibility_id=LOGIN
    Click Element                               accessibility_id=LOGIN