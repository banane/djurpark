require_relative '../../rails_helper'
require 'pry'

RSpec.describe 'GetAnimals mutation' do
    fixtures :all

    let(:query_string) do
       <<-GRAPHQL 
       
        query GetAnimals($inHabitat:Boolean, $needingAttention:Boolean) {
            getAnimals (inHabitat:$inHabitat, needingAttention:$needingAttention){
                id,
                name,    
                status,
                habitat,
                feedingTimes,
                dietaryRequirements
            }
          }
    
        GRAPHQL
    end
   
    context 'healthy' do
        it "in habitat" do
            result = ZooSchema.execute(query_string, variables: { needingAttention: false, inHabitat: true })
            animal = result["data"]["getAnimals"][0]

            expect(animal["id"]).to eq("1")
            expect(animal["status"]).to eq("healthy")
            expect(animal["habitat"]["name"]).to eq("Grasslands")
        end

        it "out of habitat" do
            result = ZooSchema.execute(query_string, variables: { needingAttention: false, inHabitat: false })
            animal = result["data"]["getAnimals"][0]

            expect(animal["id"]).to eq("2")
            expect(animal["name"]).to eq("Coco")
            expect(animal["status"]).to eq("healthy")
            expect(animal["habitat"]).to be_nil
        end

    end

    context 'not healthy' do
        it 'in habitat' do
            result = ZooSchema.execute(query_string, variables: { needingAttention: true, inHabitat: true })
            animal = result["data"]["getAnimals"][0]

            expect(animal["id"]).to eq("3")
            expect(animal["name"]).to eq("Penny")
            expect(animal["status"]).to eq("injured")
            expect(animal["habitat"]["name"]).to eq("Grasslands")
        end

        it 'not in habitat' do
            result = ZooSchema.execute(query_string, variables: { needingAttention: true, inHabitat: false })
            animal = result["data"]["getAnimals"][0]

            expect(animal["id"]).to eq("4")
            expect(animal["name"]).to eq("Gerald")
            expect(animal["status"]).to eq("injured")
            expect(animal["habitat"]).to be_nil
        end

    end
end
