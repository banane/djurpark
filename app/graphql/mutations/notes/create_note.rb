module Mutations
    module Notes
        class CreateNote < ::Mutations::BaseMutation
            argument :message, String, required: true
            argument :employee_id, Integer, required: true
            argument :notable_type, String, required: true
            argument :notable_id, Integer, required: true

            type Types::NoteType

            def resolve (**attributes)               
                Note.create!(attributes)
            end

        end
    end
end
