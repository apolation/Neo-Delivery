Dado('que o usuário está logado e realiza um pedido') do
    @body = {
        "entrega":{
            "cliente": "Jó",
            "cliente_telefone": "(16) 99123-5061",
            "endereco": "Rua Independencia",
            "numero": "100",
            "bairro": "Alecrim ",
            "complemento": "",
            "itens": "Almoço",
            "valor": 20,
            "valorReceber": 1,
            "troco": 0,
            "formaPgto": 0,
            "pago": 0,
            "frete_cliente": 5.50,
            "frete_cliente_ativo": true,
            "latitude": -5.8046556,
            "longitude": -35.2230971,
            "hora": "23:30"
        }
    }
end

Quando('submete novo pedido') do
    @response = HTTParty.post("https://server.adekz.com/web/neodelivery/rest/v1/pedido/create", body: @body.to_json, headers: {'authorization': $token, 'Content-Type': 'application/json'})
    @response_body = JSON.parse(@response.body)
end
  
Então('recebo a confirmação do pedido criado') do
    expect(@response.body).not_to be_nil
    expect(@response.code).to eql 200
    expect(@response_body['error']).to eql 0
    expect(@response_body['error_msg']).to eql("")
    expect(@response_body['error_type']).to eql("")
    expect(@response_body['data']['id']).to include ("")
    expect(@response_body['msg']).to eql("ok")
    log(@response_body)
end