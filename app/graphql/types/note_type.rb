# frozen_string_literal: true

module Types
    class NoteType < Types::BaseObject
      field :id, ID, null: false
      field :message, String, null: false
      field :notable, GraphQL::Types::JSON, null: false
      field :employee, GraphQL::Types::JSON
      field :createdAt, String, null: false
  
      def employee
        object.employee
      end

      def notable
        object.notable
      end

      def createdAt
        object.created_at.to_s
      end


    end
  end
  