require '../rails_helper.rb'

require "httpclient"
require "net/http"
require "uri"
require "json"

describe "Graphql" do

  it "Create a note" do
    uri = URI.parse("http://localhost:3000/graphql")
    query_string = <<-GRAPHQL
    mutation {
        createNote(
            message: "very rough coat this time of year",
            employeeId: 1,
            notableId: 1,
            notableType: "Animal"
        )
        {
            id, message, createdAt, employee
        }
    }
    GRAPHQL

    employee = create(:employee)
    animal = create(:animal)
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
    note = json_response_data["data"]["createNote"]
    expect(note["message"]).to eq("very rough coat this time of year")
    expect(note["employee"]["first_name"]).to eq("Eleanor")
    
  end
end