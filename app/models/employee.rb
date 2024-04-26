class Employee < ApplicationRecord
    # encrypts :last_name, :email, :phone

    # enum :role, [:vet, :caretaker, :manager], validate: true 
end
