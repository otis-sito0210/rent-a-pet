# Clear the existing data
# User.destroy_all
# Pet.destroy_all

# Create 10 users
# 10.times do
#   User.create(
#     email: Faker::Internet.unique.email,
#     password: 'password'
#   )
# end

# Create 30 pets
30.times do
  Pet.create(
    name: Faker::Creature::Dog.name,
    size: ['Small', 'Medium', 'Large'].sample,
    price: Faker::Number.decimal(l_digits: 2),
    details: Faker::Lorem.sentence,
    user_id: User.all.sample
  )
end
