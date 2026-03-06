# language: pt

Funcionalidade: Login
    Como um usuário do sistema
    Quero realizar login na plataforma
    Para acessar as funcionalidades disponíveis

    Cenário: Login com credenciais validas
        Dado que o usuario acessa a pagina de login
        Quando preenche o usuario "standard_user" e a senha "secret_sauce"
        E clica no botao de login
        Então deve ser redirecionado para a pagina de produtos

    Cenário: Login com senha invalida
        Dado que o usuario acessa a pagina de login
        Quando preenche o usuario "standard_user" e a senha "senha_errada"
        E clica no botao de login
        Então deve exibir mensagem de erro

    Cenário: Login com usuario invalido
        Dado que o usuario acessa a pagina de login
        Quando preenche o usuario "usuario_errado" e a senha "secret_sauce"
        E clica no botao de login
        Então deve exibir mensagem de erro
