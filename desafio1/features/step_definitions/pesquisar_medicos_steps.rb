Dado('que eu acesse o guia médico') do
    visit "/"
    find(:xpath, "//div[@id='accordion']//a/span[text()='ENCONTRE UM MÉDICO']").click
end
  
Quando('eu faço a pesquisa pela cidade do {string}') do |nome_cidade|
    find(:xpath, "//div[text()='Digite aqui o que você procura']").click
    find('#react-select-2-input').send_keys('Rio de Janeiro')
    click_button('Pesquisar')
end
  
Então('posso ver a lista de médicos da cidade com suas especialidades') do
    especialidades = all(:xpath, "//div[@class='ProviderSpecialties']")
    expect(especialidades[0].text).to eql 'Homeopatia'
    cidades = all(:xpath, "//a[@class='ProviderAddressAsGrid--address-link']")
    expect(cidades[0].text).to include 'Rio de Janeiro'
end
    
Então('não vejo nenhum médico da cidade de {string}') do |string|
  3.times do
    cidades = all(:xpath, "//a[@class='ProviderAddressAsGrid--address-link']")
    for i in cidades do
        expect(i.text).not_to include 'São Paulo'
    end
    click_button 'Ver mais resultados'
  end
end