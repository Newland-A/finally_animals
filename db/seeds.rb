require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, email: Faker::Internet.email, username: Faker::Internet.username(specifier: 8), password: "password", is_owner: false, is_vet: true, animal_id: rand(1..10), vet_id: rand(1..10))
end

10.times do
  User.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, email: Faker::Internet.email, username: Faker::Internet.username(specifier: 8), password: "password", is_owner: true, is_vet: false, animal_id: rand(1..10), vet_id: rand(1..10))
end

10.times do 
  Animal.create(name: Faker::Creature::Animal.name, age: Faker::Creature::Dog.age, gender: Faker::Gender.binary_type, weight: rand(5..150), breed: Faker::Creature::Dog.breed, species: "Dog", color: "Brindle", medical_info: Faker::Lorem.unique, altered: true)
end

10.times do 
  Animal.create(name: Faker::Creature::Animal.name, age: Faker::Creature::Dog.age, gender: Faker::Gender.binary_type, weight: rand(50..2000), breed: Faker::Creature::Dog.breed, species: "Horse", color: "Blue Roan", medical_info: Faker::Lorem.unique, altered: false)
end

Company.create(location: Faker::Company.name, user_id: rand(1..20), animal_id: rand(1.20), appointment_time: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today), address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, open_time: Time.strptime("Monday, 08:00 AM"), closing_time: Time.strptime("Friday, 08:00 PM"))
  # Faker::PhoneNumber.cell_phone