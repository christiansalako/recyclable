# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning database'
Product.destroy_all
puts 'database is clean'


puts 'Creating users'
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "hello123"
  )
  puts "users #{user.id} is created"
end

puts 'done'



puts 'Creating products'
10.times do
    product = Product.create!(
    name: Faker::Commerce.department,
    category: Faker::Commerce.department,
    user_id: rand(1..10)
  )
  puts "product #{product.id} is created"
end

puts 'done'
