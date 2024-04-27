# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end



    field :getAnimals, [Types::AnimalType], null: true, description: "Fetches all the animals" do
      argument :in_habitat, Boolean, required: false, default_value: true, description: "Returns animals in their habitat"
      argument :needing_attention, Boolean, required: false, default_value: false, description: "Returns those animals needing attention due to illness or injury"
    end

   
    def getAnimals(in_habitat:, needing_attention:)   
      habitat_sql = in_habitat ? 'habitat_id IS NOT NULL' : 'habitat_id IS NULL'
      status_logic = needing_attention ? [:injured, :sick] : :healthy
      Animal.all.where(status: status_logic).where(habitat_sql).includes(notes: :employee) 
      # TODO: eager load employee for notes to avoid n+1
    end
  end
end
