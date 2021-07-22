require "httparty"

$id_filme
$api_key

describe "Consulta filmes" do

    it "Consulta filme cadastrado" do
        $id_filme = 'tt1285016'
        $api_key = '52ec71bf'  

        result = HTTParty.get(
            "http://www.omdbapi.com/?i=#{$id_filme}&apikey=#{$api_key}"
        )

        expect(result.parsed_response["Title"]).to eql "The Social Network"
        expect(result.parsed_response["Year"]).to eql "2010"
        expect(result.parsed_response["Language"]).to eql "English, French"
    end

    it "Consulta filme não cadastrado" do
        $id_filme = '000000000'
        $api_key = '52ec71bf'
        
        result = HTTParty.get(
            "http://www.omdbapi.com/?i=#{$id_filme}&apikey=#{$api_key}"
        )

        expect(result.parsed_response["Response"]).to eql "False"
        expect(result.parsed_response["Error"]).to eql "Error getting data."
    end
end