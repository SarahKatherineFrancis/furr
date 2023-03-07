# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Clearing database"
Petsitter.destroy_all
User.destroy_all
puts "Creating 20 Users"

20.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: "123456",
              address: Faker::Address.street_address,
              phone: Faker::PhoneNumber.phone_number,
              profile_photo: Faker::Avatar.image)
end

puts "Users created"

puts "Creating 10 Petsitters"
index = 0
12.times do
  Petsitter.create(user_id: User.ids[index], experience: Faker::Lorem.paragraph, availability: Faker::Boolean)
  index += 1
end

puts "Petsitters created"
