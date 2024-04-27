# frozen_string_literal: true

module Types
    class HabitatType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :descriptors, GraphQL::Types::JSON
      field :notes, GraphQL::Types::JSON
  
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
  