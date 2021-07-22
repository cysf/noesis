#language: pt

Funcionalidade: Pesquisar Médicos
    Como um cliente Unimed
    Desejo realizar a pesquisa por médicos pela localização
    Para que eu possa encontrar os médicos de uma região específica

    @cenario_1
    Cenário: Pesquisa de médicos pela cidade do Rio de Janeiro
        Dado que eu acesse o guia médico
        Quando eu faço a pesquisa pela cidade do "Rio de Janeiro"
        Então posso ver a lista de médicos da cidade com suas especialidades

    @cenario_2
    Cenário: Pesquisa sem apresentação da cidade de São Paulo
        Dado que eu acesse o guia médico
        Quando eu faço a pesquisa pela cidade do "Rio de Janeiro"
        Então não vejo nenhum médico da cidade de "São Paulo"