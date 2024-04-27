require '../rails_helper.rb'

require "httpclient"
require "net/http"
require "uri"
require "json"

require 'pry'

describe "Graphql" do

  it "Create an animal" do
    uri = URI.parse("http://localhost:3000/graphql")
    query_string = <<-GRAPHQL
    mutation {
        createAnimal(
            name:"Solo Mio",
            species:"water cat",
            habitat:"jungle",
            status:"healthy"
        )
        {
            id,
            habitatId,
            status,
            name
        }
    }
    GRAPHQL

    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.body = JSON.dump({
        "query" => query_string,
    })

    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
    end
    
    habitat = Habitat.find_by(name: "jungle")
    expect(response.code).to eq("200") # call successful
    json_response_data = JSON.parse(response.body)
    animal = json_response_data["data"]["createAnimal"]
    expect(animal["status"]).to eq(0)
    expect(animal["name"]).to eq("Solo Mio")
  end
end