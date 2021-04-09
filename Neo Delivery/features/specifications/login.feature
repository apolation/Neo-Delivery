#language: pt

@fluxo_de_login
Funcionalidade: Fluxo de Login

    @logando_usuario
    Cenário: Login
        Dado que o usuário insere os dados de login
        Quando a requisição é efetuada
        Então recebo a resposta de que o usuário está logado