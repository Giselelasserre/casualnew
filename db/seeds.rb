# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Creating items..... "

Item.create! ({
item_name: "blouse"
size: "M"
price: 100
photo_item:
days_delivery: 5
})


Item.create! ({
item_name: "pants"
size: "L"
price: 300
photo_item:
days_delivery: 3
})

puts 'Finished the seeding!'
