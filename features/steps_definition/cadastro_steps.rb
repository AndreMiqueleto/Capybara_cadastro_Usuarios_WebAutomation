Dado("que acesso a página de cadastro") do
  @signup_page.open
end

Quando("submeto o seguinte formulário de cadastro:") do |table|
  user = table.hashes.first

  @signup_page.create(user)
end

#Cadastro de multiplos usuarios

Dado("que acesso a página para cadastrar multiplos usuários:") do
  @multi_page.open
end

Quando("submeto os usuários abaixo:") do |table|
  @multi = table.hashes

  multi.each do |item|
    @multi_page.cadastrar(item[:nome], item[:email], item[:senha])
  end

  sleep 20
end

Então("devo ver esses usuarios na tabela") do
  #expect(@dash_page.equipo_list).to have_content @multi[:nome]
  #expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"

  expect(
    @dash_page.has_no_equipo?(@multi[:name])
  ).to be true


end
