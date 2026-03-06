*** Settings ***
Library     SeleniumLibrary
Resource    ../../../resources/web/login_page.robot
Resource    ../../../resources/global_variables.robot

Suite Setup     Abrir Navegador
Suite Teardown  Fechar Navegador

*** Variables ***
${USUARIO_VALIDO}       standard_user
${SENHA_VALIDA}         secret_sauce
${USUARIO_INVALIDO}     usuario_errado
${SENHA_INVALIDA}       senha_errada

*** Test Cases ***
CT001 - Login com credenciais validas
    [Documentation]    Verifica se o login com credenciais válidas redireciona para a home
    [Tags]    login    smoke    positivo
    Fazer Login    ${USUARIO_VALIDO}    ${SENHA_VALIDA}
    Location Should Be    https://www.saucedemo.com/inventory.html

CT002 - Login com senha invalida
    [Documentation]    Verifica se exibe mensagem de erro com senha incorreta
    [Tags]    login    negativo
    Abrir Navegador
    Fazer Login    ${USUARIO_VALIDO}    ${SENHA_INVALIDA}
    Element Should Be Visible    ${MSG_ERRO}

CT003 - Login com usuario invalido
    [Documentation]    Verifica se exibe mensagem de erro com usuário incorreto
    [Tags]    login    negativo
    Abrir Navegador
    Fazer Login    ${USUARIO_INVALIDO}    ${SENHA_VALIDA}
    Element Should Be Visible    ${MSG_ERRO}
