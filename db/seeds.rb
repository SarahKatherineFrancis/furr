# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.new(first_name: "Alex", last_name: "Smith", email: "alex2@gmail.com", password: "123456",
                address: "123 Albert Road", phone: "123456789", profile_photo: "https://images.unsplash.com/photo-1466840787022-48e0ec048c8a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2850&q=80")
user.save!

puts "user created"

