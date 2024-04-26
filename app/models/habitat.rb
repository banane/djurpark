class Habitat < ApplicationRecord
    has_many :notes, as: :notable
    has_many :animals
end
