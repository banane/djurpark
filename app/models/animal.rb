class Animal < ApplicationRecord
    has_many :notes, as: :notable
    belongs_to :habitat

    enum :status, [:healthy, :injured, :sick], validate: true
end
