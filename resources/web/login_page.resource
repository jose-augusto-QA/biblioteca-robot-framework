*** Settings ***
Library    SeleniumLibrary

Resource    ../global_variables.resource

*** Variables ***
# Locators da página de Login
${INPUT_USUARIO}    id=user-name
${INPUT_SENHA}      id=password
${BTN_LOGIN}        id=login-button
${MSG_ERRO}         css=.error-message-container

*** Keywords ***
Abrir Navegador
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Open Browser    ${BASE_URL}    ${BROWSER}    options=${options}
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
