*** Settings ***
Library    SeleniumLibrary
Library    ../core/Utils.py
Resource    ../recursos/propriedades/locators.json

*** Variables ***
${tempoDeEsperaPadraoSelenium}    5
${tempoDeEspera}    3
${caminhoArquivoJsonLocators}    ../recursos/propriedades/locators.json

*** Keywords ***
Acessar Site
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${tempoDeEsperaPadraoSelenium}

Aguardar Elemento Presente
    [Arguments]    ${jsonPathCampo}
    ${locator}=    Obter Locator    ${jsonPathCampo}
    Wait Until Page Contains Element    ${locator}    ${tempoDeEspera}    None    None

Aguardar Elemento Visivel
    [Arguments]    ${jsonPathCampo}
    ${locator}=    Obter Locator    ${jsonPathCampo}
    Wait Until Element Is Visible    ${locator}    ${tempoDeEspera}    None

Aguardar Elemento Habilitado
    [Arguments]    ${jsonPathCampo}
    ${locator}=    Obter Locator    ${jsonPathCampo}
    Wait Until Element Is Enabled    ${locator}    ${tempoDeEspera}    None

Escrever no Campo
    [Arguments]    ${jsonPathCampo}    ${valor}
    ${locator}=    Obter Locator    ${jsonPathCampo}
    Aguardar Elemento Presente    ${locator}
    Aguardar Elemento Visivel    ${locator}
    Input Text    ${locator}    ${valor}    False

Clicar Elemento
    [Arguments]    ${jsonPathCampo}
    ${locator}=    Obter Locator    ${jsonPathCampo}
    Aguardar Elemento Presente    ${locator}
    Aguardar Elemento Visivel    ${locator}
    Aguardar Elemento Habilitado    ${locator}
    Click Element    ${locator}

Clicar Elemento Coordenadas
    [Arguments]    ${jsonPathCampo}
    ${locator}=    Obter Locator    ${jsonPathCampo}
    Aguardar Elemento Presente    ${locator}
    Aguardar Elemento Visivel    ${locator}
    Aguardar Elemento Habilitado    ${locator}
    ${posicaoHorizonalElemento}=    Get Horizontal Position    ${locator}
    ${posicaoVerticalElemento}=    Get Vertical Position    ${locator}
    Click Element At Coordinates    ${locator}    ${posicaoHorizonalElemento}    ${posicaoVerticalElemento}

Encontrar Elemento
    [Arguments]    ${jsonPathCampo}
    ${locator}=    Obter Locator    ${jsonPathCampo}
    Aguardar Elemento Presente    ${locator}
    Aguardar Elemento Visivel    ${locator}
    ${elemento}=    Get WebElement    ${locator}
    RETURN    ${elemento}

Encontrar Lista de Elementos
    [Arguments]    ${jsonPathCampo}
    ${locator}=    Obter Locator    ${jsonPathCampo}
    Aguardar Elemento Presente    ${locator}
    Aguardar Elemento Visivel    ${locator}
    ${listaElementos}=    Get WebElements    ${locator}
    RETURN    ${listaElementos}

Selecionar Elemento
    [Arguments]    ${jsonPathCampoElemento}    ${jsonPathListaElementos}
    ${locatorElemento}=    Obter Locator    ${jsonPathCampoElemento}
    ${locatorListaOpcoes}=    Obter Locator    ${jsonPathListaElementos}
    Aguardar Elemento Presente    ${locatorElemento}
    Aguardar Elemento Visivel    ${locatorElemento}
    Clicar Elemento    ${locatorElemento}
    Aguardar Elemento Presente    ${locatorListaOpcoes}
    Aguardar Elemento Visivel    ${locatorListaOpcoes}
    Clicar Elemento    ${locatorListaOpcoes}

Marcar CheckBox
    [Arguments]    ${jsonPathCampo}
    ${locator}=    Obter Locator    ${jsonPathCampo}
    Aguardar Elemento Presente    ${locator}
    Aguardar Elemento Visivel    ${locator}
    Page Should Contain Checkbox    ${locator}
    Select Checkbox    ${locator}

Fechar Browser
    Close Window

Tirar Printscreen
    Capture Page Screenshot

Obter Locator
    [Arguments]    ${jsonPath}
    ${locator}=    Utils.Obter Locator    ${caminhoArquivoJsonLocators}    ${jsonPath}
    RETURN    ${locator}

Encerrar Teste
    Tirar Printscreen
    Fechar Browser
