require_relative '../../rails_helper'
require 'pry'

RSpec.describe 'CreateAnimal mutation' do
    fixtures :all

    context 'Habitat does not exist' do
        let(:query_string) do
        <<-GRAPHQL 
        
            mutation {
                createAnimal(
                    name: "Solo Mio",
                    species: "water cat",
                    habitat: "Jungle",
                    status: "healthy"
                )
                {
                    id,
                    habitat,
                    status,
                    name,
                    species
                }
            }
        
            GRAPHQL
        end
   
  
        it "creates successfully" do
            result = ZooSchema.execute(query_string)
            animal = result["data"]["createAnimal"]
            expect(animal["habitat"]["name"]).to eq("Jungle")
            expect(animal["status"]).to eq("healthy")
            expect(animal["species"]).to eq("water cat")
            expect(animal["name"]).to eq("Solo Mio")
        end
    end

    context 'Habitat does  exist' do
        let(:query_string) do
        <<-GRAPHQL 
        
            mutation {
                createAnimal(
                    name: "Solo Mio",
                    species: "water cat",
                    habitat: "Grasslands",
                    status: "healthy"
                )
                {
                    id,
                    habitat,
                    status,
                    name,
                    species
                }
            }
        
            GRAPHQL
        end
   
  
        it "creates successfully" do
            result = ZooSchema.execute(query_string)
            animal = result["data"]["createAnimal"]
            expect(animal["habitat"]["id"]).to eq(1)
            expect(animal["habitat"]["name"]).to eq("Grasslands")
            expect(animal["status"]).to eq("healthy")
            expect(animal["species"]).to eq("water cat")
            expect(animal["name"]).to eq("Solo Mio")
        end
    end
end
