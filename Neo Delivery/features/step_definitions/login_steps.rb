Dado('que o usuário insere os dados de login') do
    @body = {"login": "api_testes", "password": "123456"}
end
 
Quando('a requisição é efetuada') do
    @response_token = HTTParty.post("https://server.adekz.com/web/neodelivery/rest/v1/auth/estabelecimento", body: @body.to_json, headers: {'Content-Type': 'application/json'})
    expect(@response_token.body).not_to be_nil
    expect(@response_token.code).to eql 200
    @response = JSON.parse(@response_token.body)
end

Então('recebo a resposta de que o usuário está logado') do
    expect(@response['error']).to eql 0
    expect(@response['error_msg']).to eql("")
    expect(@response['error_type']).to eql("")
    expect(@response['data']['token']).to eql("fd4db945cbe7909c32e4d196e601f044")
    expect(@response['data']['uuid']).to eql("259")
    expect(@response['error']).to eql 0
    expect(@response['msg']).to eql("ok")
    log(@response)
end