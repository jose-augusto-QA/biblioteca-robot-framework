*** Settings ***
Library    SeleniumLibrary

Resource    ../global_variables.robot

*** Variables ***
# Locators da página de Login
${INPUT_USUARIO}    id=user-name
${INPUT_SENHA}      id=password
${BTN_LOGIN}        id=login-button
${MSG_ERRO}         css=.error-message-container

*** Keywords ***
Abrir Navegador
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Preencher Login
    [Arguments]    ${usuario}    ${senha}
    Input Text     ${INPUT_USUARIO}    ${usuario}
    Input Text     ${INPUT_SENHA}      ${senha}

Clicar Em Login
    Click Button    ${BTN_LOGIN}

Fazer Login
    [Arguments]    ${usuario}    ${senha}
    Preencher Login    ${usuario}    ${senha}
    Clicar Em Login

Fechar Navegador
    Close Browser
