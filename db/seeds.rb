require 'faker'

# Create Users
10.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create Items
50.times do
  Item.create!(
    user:  users.sample,
    name:  Faker::Lorem.sentence(3, true, 4)
  )
end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'klaha.77@gmail.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"