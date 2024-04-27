# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_animal, mutation: Mutations::Animals::CreateAnimal
    field :create_note, mutation: Mutations::Notes::CreateNote
    
  end
end
