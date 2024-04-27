# Description
A zoo app to manage animals, habitats, and personnel (employees) securely
# About

- Rails 7.1.3.2
- PostGres 14
- Ruby 3.0.3

# Setup
  
1.`bundle install`

1.`bundle exec rake db:create && rake db:migrate && rake db:seed`

# Run tests

1.`bundle exec rake db:test:prepare && bundle exec rspec`

(Fixtures are used for tests)


# Diagram/outline
<img width="222" alt="Screenshot 2024-04-27 at 1 12 01 PM" src="https://github.com/banane/djurpark/assets/94928/5f58fc55-0204-4e18-b62a-2c60b7026009">

# Screenshots
<img width="1183" alt="Screenshot 2024-04-27 at 1 18 22 PM" src="https://github.com/banane/djurpark/assets/94928/f7ee825e-09f7-4cb4-8f0b-cdde9c382169">
<img width="1181" alt="Screenshot 2024-04-27 at 1 18 30 PM" src="https://github.com/banane/djurpark/assets/94928/95ed61d8-981b-4fb5-b08a-6dd1a9d5bc2c">


# Requirements

- GraphQL mutations and queries: getAnimals(inHabitat, needingAttention), createNote, and createAnimal
- Secured PII on Employee model
- JSON Storage for Animal's dietary requirements and habitat's preferences
- Employee enums for roles, Animal enums for health status
