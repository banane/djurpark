Habitat.destroy_all
Animal.destroy_all
Employee.destroy_all
Note.destroy_all

habitat_grasslands = Habitat.create(
    name: "Grasslands",
    descriptors: { "terms": ["grasslands","dry","grass"]}
)
habitat_forest = Habitat.create(
    name: "Deciduous Forest",
    descriptors: {"terms":["moist","deciduous", "forest"]}
)

elephant = Animal.create(
    name: "Cora",
    species: "Asian Elephant",
    feeding_times: ["10am", "3 PM]"],
    tasks: {"daily": ["cleaning","feeding","playing"]},
    status: :healthy,
    dietary_requirements: { "treats":["apples"], "daily": ["grass": "2 ton", "bark": ["bushel"], "leaves":["2 bushels"] ] }, 
    habitat: habitat_grasslands
)

employee_eleanor = Employee.create(
    first_name: "Eleanor",
    last_name: "Rigby",
    email: "eleanor@rigby.com",
    phone: "4158892203",
    role: 1
)

Note.create(
    message: "Cora  had some serious callousses we should get the vet involved.",
    employee: employee_eleanor,
    notable: elephant
)

Note.create(
    message: "We need to plant more trees here becuase the monkeys are tearing them down.",
    employee: employee_eleanor,
    notable: habitat_forest
)
