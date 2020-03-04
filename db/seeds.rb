# require "open-uri"


# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')


# puts 'Cleaning database'
# Product.destroy_all
# puts 'database is clean'


# puts 'Creating users'
# 10.times do
#   user = User.create!(
#     email: Faker::Internet.email,
#     password: "hello123"
#   )
#   puts "users #{user.id} is created"
# end

# puts 'done'



# puts 'Creating products'
# 10.times do
#     product = Product.create!(
#       name: Faker::Commerce.department,
#       category: Faker::Commerce.department,
#       user_id: rand(1..10),
#     )
#   file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
#     product.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#   puts "product #{product.id} is created"
# end

# puts 'done'



# puts 'Creating products'
# 10.times do
#     product = Product.create!(
#       name: Faker::Commerce.department,
#       category: Faker::Commerce.department,
#       user_id: rand(1..10),

#   file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
#     product.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#   puts "product #{product.id} is created"
# end

# puts 'done'
















puts 'Cleaning database'
Product.destroy_all
puts 'database is clean'


puts 'Creating users'
3.times do
  Material.create!(
  category:[i] ["glass", "wood", "plastic"]
  recyclability:[i] [true, false, true]
   )
   puts "materials is created"
 end

 puts 'done'
















