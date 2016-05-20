
Project.destroy_all

100.times do 
  Project.create(
    name: Faker::App.name,
    description: Faker::Company.catch_phrase,
    start_date: Faker::Date.backward(365),
    projected_end_date: Faker::Date.backward(60),
    actual_end_date: Faker::Date.backward(14),
    budget: Faker::Number.decimal(4, 2),
    cost: Faker::Number.decimal(4, 2)
    )
end