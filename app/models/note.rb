class Note < ApplicationRecord
    belongs_to :employee
    belongs_to :notable, polymorphic: true
end
