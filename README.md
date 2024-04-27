# Description
A zoo app to manage animals, habitats, and personnel (employees) securely

Ability to get all animals that need assistance, or are in or out of habitat, `getAnimals` (see screenshots for examples)
- View all associated models in requests
- Create note, related to an animal or habitat
- Create an animal with nested associations

# About

- Rails 7.1.3.2
- PostGres 14
- Ruby 3.0.3

# Setup
  
1.`bundle install`

2.`bundle exec rake db:create && rake db:migrate && rake db:seed`

# Run tests

1.`bundle exec rake db:test:prepare && bundle exec rspec`

# Entity Relationship Diagram
<img width="604" alt="Screenshot 2024-04-27 at 2 43 46 PM" src="https://github.com/banane/djurpark/assets/94928/39273403-7314-4acf-8141-4f4d72fd46d5">

# Screenshots
* getAnimals
<img width="1183" alt="Screenshot 2024-04-27 at 1 18 22 PM" src="https://github.com/banane/djurpark/assets/94928/f7ee825e-09f7-4cb4-8f0b-cdde9c382169">

* createAnimal
<img width="1232" alt="Screenshot 2024-04-27 at 2 16 53 PM" src="https://github.com/banane/djurpark/assets/94928/625d2163-18a6-47f6-beab-41e3afcedea0">

* createNote
  <img width="1220" alt="Screenshot 2024-04-27 at 2 25 41 PM" src="https://github.com/banane/djurpark/assets/94928/20f35292-8227-4747-8fa1-f91f6ca737c5">


# Requirements

- GraphQL mutations and queries: getAnimals(inHabitat, needingAttention), createNote, and createAnimal
- Secured PII on Employee model
- JSON Storage for Animal's dietary requirements and habitat's preferences
- Employee enums for roles, Animal enums for health status
