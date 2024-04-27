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
    status: :healthy,
    dietary_requirements: { "treats":["apples"], "daily": ["grass": "2 ton", "bark": ["bushel"], "leaves":["2 bushels"] ] }, 
    habitat: habitat_grasslands
)

monkey = Animal.create(
    name: "JoJo",
    species: "Capuchin monkey",
    feeding_times: ["5 PM", "10 PM]"],
    status: :healthy,
    dietary_requirements: { "daily":["oranges", "nuts"], "treats": ["corn"] }, 
    habitat: habitat_forest
)

raven = Animal.create(
    name: "Belle",
    species: "Common Raven",
    feeding_times: ["5 PM", "10 PM]"],
    status: :injured,
    dietary_requirements: { "daily":["seeds"] }, 
)

employee_eleanor = Employee.create(
    first_name: "Eleanor",
    last_name: "Rigby",
    email: "eleanor@rigby.com",
    phone: "4158892203",
    tasks: {"daily":["feeding", "cleaning", "grooming"]},
    role: :caretaker
)

employee_vega = Employee.create(
    first_name: "Suzanne",
    last_name: "Vega",
    email: "suzanne@vega.com",
    phone: "4158823303",
    tasks: {"daily":["checkups", "blood pressure"], "weekly":["parasite checks", "respitory"]},
    role: :vet
)

Note.create(
    message: "Cora  had some serious callousses we should get the vet involved.",
    employee: employee_eleanor,
    notable: elephant
)

Note.create(
    message: "We need to plant more trees here because the monkeys are tearing them down.",
    employee: employee_eleanor,
    notable: habitat_forest
)

Note.create(
    message: "Monkeys are eating too many trees.",
    employee: employee_vega,
    notable: monkey
)

Note.create(
    message: "Recovering well in the infirmary.",
    employee: employee_vega,
    notable: raven
)

