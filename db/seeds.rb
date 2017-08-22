# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating user..... "

user = User.create({
  email: "admin@casual.com",
  password: "testtest"
})

puts "Creating items..... "

Item.create! ({
item_name: "blouse",
size: "M",
price: 100,
photo_item:"blouse1.jpg",
days_delivery: 5,
owner: user,
address: "Rua Francisco Otaviano 60 Rio de Janeiro"
})


Item.create! ({
item_name: "pants",
size: "L",
price: 300,
photo_item: "blouse1.jpg",
days_delivery: 3,
owner: user,
address: "Avenida Epitacio Pessoa 2900 Rio de Janeiro"
})

Item.create! ({
item_name: "red jacket",
size: "M",
price: 100,
photo_item:"jacket1.jpg",
days_delivery: 5,
owner: user,
address: "Avenida Atlantica 500 Rio de Janeiro"
})


Item.create! ({
item_name: "denim jacket",
size: "L",
price: 300,
photo_item: "jacket2.jpg",
days_delivery: 3,
owner: user,
address: "Rua Barata Ribeiro 300 Rio de Janeiro"
})

Item.create! ({
item_name: "blue jacket",
size: "M",
price: 100,
photo_item:"jacket3.jpg",
days_delivery: 5,
owner: user,
address: "Rua Sao Clemente 200 Rio de Janeiro"
})


Item.create! ({
item_name: "blue pants",
size: "L",
price: 300,
photo_item: "pants_2.jpg",
days_delivery: 3,
owner: user,
address: "Avenida Rio Branco 658 Rio de Janeiro"
})

Item.create! ({
item_name: "red pants",
size: "M",
price: 100,
photo_item:"pants3.jpg",
days_delivery: 5,
owner: user,
address: "Avenida Vieira Souto 480 Rio de Janeiro"
})


Item.create! ({
item_name: "pants",
size: "L",
price: 300,
photo_item: "pants.jpg",
days_delivery: 3,
owner: user,
address: "Praia de Botafogo 450 Rio de Janeiro"
})

puts 'Finished the seeding!'
