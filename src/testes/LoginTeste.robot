*** Settings ***
Resource    ../core/BDD.robot
Resource    ../page/LoginPage.robot
Test Teardown    Encerrar Teste

*** Test Cases ***
Cenário - Login com sucesso
    Dado    Que acesso a tela de Login
    E    Que possuo valor para o campo Username
    E    Que possuo valor para o campo Password
    Quando    Preencho o campo Username com valor
    E    Preencho o campo Password com valor
    E    Clico no botao Login
    Entao    Verifico que acesso a tela Home
