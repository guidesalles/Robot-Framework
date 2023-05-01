*** Settings ***
Library       SeleniumLibrary
Resource      setup_teardown.robot
Test Setup    Given que eu acesse o Linkedin

*** Variables ***
${Campo_email}     id:session_key
${Campo_senha}     id:session_password
${Clique_butão}    data:id:sign-in-form__submit-btn

*** Test Cases ***

Validação de erro no login com senha errada no Linkedin
    And preencha e-mail
    And preencha senha erradamente
    When clicar no botão
    Then aparecerá uma mensagem de erro de senha ou e-mail

*** Keywords ***
And preencha e-mail
    Input Text    ${Campo_email}    -----
And preencha senha erradamente
    Input Text    ${Campo_senha}    -----
When clicar no botão
    Click Button    ${Clique_butão}
Then aparecerá uma mensagem de erro de senha ou e-mail
    Element Should Be Visible    id:error-for-password
