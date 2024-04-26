module Mutations
    module Animals
        class CreateAnimal < ::Mutations::BaseMutation
            argument :name, String, required: true
            argument :species, String, required: true
            argument :habitat, String, required: true
            argument :status, String, required: true

            type Types::AnimalType

            def resolve (habitat:, **attributes)
                Habitat.find_or_create_by(name: habitat).animals.create!(attributes)
            end

        end
    end
end
