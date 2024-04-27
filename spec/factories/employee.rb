FactoryBot.define do
    factory(:employee) do
        first_name { "Emily" }
        role { :vet }
        # last_name { Faker::Person::last_name }
        # email { Faker::Internet.email }
        # phone { Faker::Phone.number }
        # tasks { "daily": ["cleaning", "grooming"] }
        # role { :caretaker }
    end
end
