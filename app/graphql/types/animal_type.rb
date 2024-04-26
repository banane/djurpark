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
      object.notes.map{ |note| note }
    end
  end
end
