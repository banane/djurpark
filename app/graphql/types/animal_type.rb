# frozen_string_literal: true

module Types
  class AnimalType < Types::BaseObject
    field :id, ID, null: false
    field :species, String, null: false
    field :name, String, null: false
    field :status, Integer
    field :habitat_id, Integer
    field :dietary_requirements, GraphQL::Types::JSON
    field :feeding_times, GraphQL::Types::JSON
    field :tasks, GraphQL::Types::JSON
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :notes, GraphQL::Types::JSON

    def notes
      object.notes.map do |note|
        {
          "message": note.message,
          "employee": "#{note.employee.first_name} #{note.employee.last_name}",
          "employee_id": note.employee.id,
          "created_at": note.created_at
        }
      end
      
    end
  end
end
