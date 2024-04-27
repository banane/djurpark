require '../rails_helper.rb'

require "httpclient"
require "net/http"
require "uri"
require "json"

require 'pry'

describe "Graphql" do

    context "Healthy" do
        it "in habitat (defaults)" do
            uri = URI.parse("http://localhost:3000/graphql")
            query_string = <<-GRAPHQL
            {
                getAnimals {
                    id,
                    name,
                    species,
                    notes,
                    feedingTimes,
                    status,
                    dietaryRequirements
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
            
            expect(response.code).to eq("200") # call successful
            json_response_data = JSON.parse(response.body)
            animals = json_response_data["data"]["getAnimals"]
            expect(animals.size).to eq(1)
            # values from db:seeds, 2 healthy animals
            expect(animals[0]["name"]).to eq("Cora")

            expect(animals[0]["notes"].size).to eq(1)
            note = animals[0]["notes"][0]
            expect(note["message"]).to eq("Cora  had some serious callousses we should get the vet involved.")
            expect(note["employee"]).to eq("Eleanor Rigby")
            expect(animals[0]["feedingTimes"]).to eq(["10am", "3 PM]"])
            expect(animals[0]["species"]).to eq("Asian Elephant")
            expect(animals[0]["status"]).to eq("healthy") 

            dietary_requirements = animals[0]["dietaryRequirements"]
            expect(dietary_requirements["daily"][0]["bark"][0]).to eq("bushel")
        end

        it "out of habitat" do
            uri = URI.parse("http://localhost:3000/graphql")
            query_string = <<-GRAPHQL
            {
                getAnimals(inHabitat: false) {
                    id,
                    name,
                    species,
                    notes,
                    feedingTimes,
                    status,
                    dietaryRequirements
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
            
            expect(response.code).to eq("200") # call successful
            json_response_data = JSON.parse(response.body)
            animals = json_response_data["data"]["getAnimals"]
            expect(animals.size).to eq(1)
            # values from db:seeds, 2 healthy animals
            expect(animals[0]["name"]).to eq("JoJo")

            expect(animals[0]["species"]).to eq("Capuchin monkey")
            expect(animals[0]["status"]).to eq("healthy") 
        end

    end    

    context "unhealthy" do
        it "in habitat" do
            uri = URI.parse("http://localhost:3000/graphql")
            query_string = <<-GRAPHQL
            {
                getAnimals(needingAttention: true) {
                    id,
                    name,
                    species,
                    status,
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
            
            expect(response.code).to eq("200") # call successful
            json_response_data = JSON.parse(response.body)
            animals = json_response_data["data"]["getAnimals"]
            expect(animals.size).to eq(1)
            # values from db:seeds
            expect(animals[0]["name"]).to eq("Julius")
            expect(animals[0]["status"]).to eq("sick")
            expect(animals[0]["habitatId"]).not_to eq(0)
        end

        it "out of habitat" do
            uri = URI.parse("http://localhost:3000/graphql")
            query_string = <<-GRAPHQL
            {
                getAnimals(needingAttention: true, inHabitat: false) {
                    id,
                    name,
                    species,
                    status,
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
            
            expect(response.code).to eq("200") # call successful
            json_response_data = JSON.parse(response.body)
            animals = json_response_data["data"]["getAnimals"]
            expect(animals.size).to eq(1)
            # values from db:seeds
            expect(animals[0]["name"]).to eq("Belle")
            expect(animals[0]["habitatId"]).to be_nil
            expect(animals[0]["status"]).to eq("injured")
        end        
    end

end
