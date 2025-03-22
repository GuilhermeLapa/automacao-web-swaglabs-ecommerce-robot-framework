*** Settings ***
Resource    ../core/baseWebdriver.robot
Resource    ../core/BDD.robot
Library    ../core/TiposBrowser.py
Test Teardown    Encerrar Teste

*** Variables ***
${urlHome}    https://www.saucedemo.com/v1/inventory.html
${username}    None
${password}    None

*** Test Cases ***
Cenário - Login com sucesso
    Dado    Que acesso a tela de Login
    #E    Que possuo valor para o campo Username
    #E    Que possuo valor para o campo Password
    #Quando    Preencho o campo Username com valor ${username}
    #E    Que preencho o campo Password com valor ${password}
    #E    Clico no botao Login
    #Entao    Verifico que acesso a tela Home

*** Keywords ***
Que acesso a tela de Login
    ${browser}=    Chrome
    Acessar Site    ${urlHome}    ${browser}
