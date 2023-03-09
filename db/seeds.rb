Faker::Config.locale = 'en'

puts "Clearing database"
Review.destroy_all
Booking.destroy_all
Petsitter.destroy_all
User.destroy_all
puts "Creating 20 Users"

normal_users = []
addresses = [
  "368b Victoria Rd, Salt River",
  "31 Brickfield Road, Salt River",
  "1 Albert Road, Salt River",
  "2 Durham Avenue, Salt River",
  "3 Cecil Road, Salt River",
  "4 Bromwell Street, Salt River",
  "5 Lower Main Road, Salt River",
  "6 Pickwick Road, Salt River",
  "7 Shelley Street, Salt River",
  "8 Kent Street, Salt River"
]
addresses.each_with_index do |address, index|
  user = User.new(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: "user#{index+1}@example.com",
              password: "123456",
              address: address,
              phone: Faker::PhoneNumber.phone_number,
              profile_photo: Faker::Avatar.image)
  user.save
  p "created normal user with #{user.email}"
  normal_users << user.id
end

addresses.each do |address|
  user = User.new(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: "123456",
              address: address,
              phone: Faker::PhoneNumber.phone_number,
              profile_photo: Faker::Avatar.image)
  user.save
  p "created petsitter user with #{user.email}"

  pet = Petsitter.create(user_id: user.id, experience: Faker::Lorem.paragraph, availability: Faker::Boolean)

  p "created petsitter profile with id #{pet.id}"


  booking = Booking.create!(start_date: Date.today,
    end_date: Date.today,
    service: ["Dog Walking", "Pet Sitting", "Pet Boarding"].sample,
    pet_name: Faker::Creature::Dog.name,
    pet_type: Faker::Creature::Dog.breed,
    user_id: normal_users.sample(),
    petsitter_id: pet.id)

    p "created booking id #{booking.id} for user #{booking.user.first_name} and sitter #{booking.petsitter.user.first_name}"

  review = Review.create(
    comment: Faker::Lorem.paragraph,
    rating: rand(0..5),
    booking_id: booking.id)

    p "create a review. review id #{review.id} for booking with sitter #{review.booking.petsitter.id} and user #{review.booking.user.id}"
end
