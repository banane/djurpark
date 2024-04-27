# frozen_string_literal: true

module Types
    class NoteType < Types::BaseObject
      field :id, ID, null: false
      field :message, String, null: false
      field :notable, GraphQL::Types::JSON, null: false

      field :employee, GraphQL::Types::JSON
  
      def employee
        object.employee.to_json
      end

      def notable
        object.notable
      end

    end
  end
  