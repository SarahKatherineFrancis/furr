require "open-uri"
puts "Clearing database"
Booking.destroy_all
Petsitter.destroy_all
User.destroy_all
puts "Creating 20 Users"

normal_users = []

10.times do
  user = User.new(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: "123456",
              address: Faker::Address.street_address,
              phone: Faker::PhoneNumber.phone_number,
            )
  file = URI.open("https://kitt.lewagon.com/placeholder/users/random")
  user.photo.attach(io: file, filename: "profile#{user.first_name}#{user.last_name}.png", content_type: "image/png")
  user.save
  p "created normal user with #{user.photo.key}"
  normal_users << user.id
end

10.times do
  user = User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: "123456",
              address: Faker::Address.street_address,
              phone: Faker::PhoneNumber.phone_number,
              profile_photo: Faker::LoremFlickr.image(size: "300x300", search_terms: ['profile picture person'])
            )
  p "created petsitter user with #{user.profile_photo}"

  pet = Petsitter.create(user_id: user.id, experience: Faker::Lorem.paragraph, availability: [true, false].sample)

  p "created petsitter profile with id #{pet.availability}"

  booking = Booking.create!(start_date: Date.today,
    end_date: Date.today,
    service: ["Dog Walking", "Pet Sitting", "Pet Boarding"].sample,
    pet_name: Faker::Creature::Dog.name,
    pet_type: Faker::Creature::Dog.breed,
    user_id: normal_users.sample(),
    petsitter_id: pet.id)

    p "created booking id #{booking.id} for user #{booking.user.first_name} and sitter #{booking.petsitter.user.first_name}"
end
