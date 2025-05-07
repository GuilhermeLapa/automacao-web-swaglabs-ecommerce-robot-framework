*** Settings ***
Resource    ../core/baseWebdriver.robot
Resource    ../core/BDD.robot
Library    ../core/TiposBrowser.py

*** Variables ***
${urlHome}    https://www.saucedemo.com/v1/inventory.html
${username}
${password}
${jsonPathUrlTelaLogin}    $.TelaLogin
${jsonPathUsuarioPadrao}    $.standard.username
${jsonPathSenhaUsuarioPadrao}    $.standard.password
${jsonPathCampoUsername}    $.TelaLogin.cmpUsername
${jsonPathCampoPassword}    $.TelaLogin.cmpPassword
${jsonPathBotaoLogin}    $.TelaLogin.btnLogin

*** Keywords ***
Que acesso a tela de Login
    ${browser}=    chrome
    ${urlLogin}=    Obter Url    ${jsonPathUrlTelaLogin}
    Acessar Site    ${urlLogin}    ${browser}

Que possuo valor para o campo Username
    ${valor}=    Obter Dados Usuarios    ${jsonPathUsuarioPadrao}
    Set Test Variable    ${username}    ${valor}

Que possuo valor para o campo Password
    ${valor}=    Obter Dados Usuarios    ${jsonPathSenhaUsuarioPadrao}
    Set Test Variable    ${password}    ${valor}

Preencho o campo Username com valor
    Escrever no Campo    ${jsonPathCampoUsername}    ${username}

Preencho o campo Password com valor
    Escrever no Campo    ${jsonPathCampoPassword}    ${password}

Clico no botao Login
    Clicar Elemento    ${jsonPathBotaoLogin}

Verifico que acesso a tela Home
    Aguardar Url Ser    ${urlHome}
    ${url}=    Get Location
    Should Be Equal As Strings    ${urlHome}    ${url}
