*** Settings ***
Resource    ../resources/main.robot
Resource    ../resources/pages/loginCompleto.robot




*** Test Cases ***
# Primeiro login
Loguin na BIA com sucesso
    Dado que eu abra o app da bia
    E clique no botão pular tutorial
    E preencha o banco
    E fizer o login correto
    E aceitar os termos
    Quando eu der as autorizações do Android
    Então poderei ver o feed da BIA
        


