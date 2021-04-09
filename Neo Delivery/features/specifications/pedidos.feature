#language: pt

@cadastro_pedidos
Funcionalidade: Cadastrar Novo Pedido

    @pedidos
    Cenário: Cadastro de Pedidos
        Dado que o usuário está logado e realiza um pedido
        Quando submete novo pedido
        Então recebo a confirmação do pedido criado