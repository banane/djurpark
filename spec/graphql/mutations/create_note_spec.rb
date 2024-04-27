require_relative '../../rails_helper'
require 'pry'

RSpec.describe 'CreateNote mutation' do
    fixtures :all

    context 'Animal' do
        let(:query_string) do
        <<-GRAPHQL 
        
        mutation {
            createNote(
                message: "Very rough coat this time of year",
                employeeId: 1,
                notableId: 1,
                notableType: "Animal"
            )
            {
                id, message, createdAt, employee, notable
            }
        }
        
            GRAPHQL
        end
   
  
        it "creates successfully" do
            result = ZooSchema.execute(query_string)
            note = result["data"]["createNote"]
            expect(note["message"]).to eq("Very rough coat this time of year")
            expect(note["employee"]["first_name"]).to eq("Eleanor")
            expect(note["notable"]["name"]).to eq("Bethany")
        end

      

    end
end
