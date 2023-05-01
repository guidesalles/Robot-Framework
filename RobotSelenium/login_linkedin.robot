*** Settings ***
Library       SeleniumLibrary
Resource      setup_teardown.robot
Test Setup    Given que eu acesse o Linkedin

*** Variables ***
${Campo_email}     id:session_key
${Campo_senha}     id:session_password
${Clique_butão}    data:id:sign-in-form__submit-btn

*** Test Cases ***

Validação de login com sucesso no Linkedin
    And preencha e-mail e senha
    When clicar no botão
    Then aparecerá o feed do perfil logado


*** Keywords ***
And preencha e-mail e senha
    Input Text       ${Campo_email}         dexter342@gmail.com
    Input Text       ${Campo_senha}         11091990a

When clicar no botão    
    Click Button     ${Clique_butão} 

Then aparecerá o feed do perfil logado
   Element Should Be Visible    class:search-global-typeahead__input 
