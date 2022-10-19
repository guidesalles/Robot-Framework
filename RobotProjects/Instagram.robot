*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${input_login}              //*[@id="loginForm"]/div/div[1]/div/label/input
${input_senha}              //*[@id="loginForm"]/div/div[2]/div/label/input
${button_entrar}            //*[@id="loginForm"]/div/div[3]/button
${button_not_now}           //*[@id="react-root"]/section/main/div/div/div/div/button
${button_not_now2}          //*[contains(concat( " ", @class, " " ), concat( " ", "_a9_1", " " ))]
${button_primeiro_story}    //*[contains(concat( " ", @class, " " ), concat( " ", "_aama", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "_aa8j", " " ))]
${button_curtir_story}      //div[contains(@class,'_abx4')]//button[contains(@type,'button')]
${button_avancar}           _ac0d

*** Keywords ***
Abrindo instagram
    Open Browser    https://www.instagram.com/   chrome
    Maximize Browser Window 

Preenchendo login e senha
    Input Text  ${input_login}  gmss_importacoes
    Input Text  ${input_senha}  @Aa02121991aA@

Clicar em entrar
    Click Element           ${button_entrar}  

Clicar em "not now"
    Click Element           ${button_not_now} 

Clicar em "not now2"
   Click Element            ${button_not_now2}      

Clicar no story
    Click Element           ${button_primeiro_story}

Curtir story
    Click Element           ${button_curtir_story}



*** Test Cases ***
Cenário 1: Entrando no site do Instagram
    Abrindo instagram
    
    
Cenário 2: Logando no Instagram 
    Wait Until Page Contains Element     //*[@id="loginForm"]/div/div[1]/div/label/input     7s
    Preenchendo login e senha
    Clicar em entrar
    Wait Until Page Contains Element    //*[@id="react-root"]/section/main/div/div/div/div/button    7s
    Clicar em "not now"
    sleep       2s
    
Cenário 3: Clicando no pop up de notificação "not now"
    Wait Until Page Contains Element    //*[contains(concat( " ", @class, " " ), concat( " ", "_a9_1", " " ))]   7s
    Clicar em "not now2"

Cenário 4: Clicando no primeiro story
    Wait Until Page Contains Element    //*[contains(concat( " ", @class, " " ), concat( " ", "_aama", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "_aa8j", " " ))]
    Clicar no story

Cenário 5: Curtindo o Story
    Wait Until Page Contains Element     ${button_curtir_story}      2s
    Curtir story