class Animal < ApplicationRecord
    has_many :notes, as: :notable
    belongs_to :habitat, optional: true

    enum :status, [:healthy, :injured, :sick], validate: true
end

#       t.string :species, null: false
#       t.string :name, null: false
#       t.integer :status
#       t.references :habitat
#       t.jsonb :dietary_requirements
#       t.jsonb :feeding_times