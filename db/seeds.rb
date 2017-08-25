# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create({
  email: "admin@casual.com",
  password: "testtest"
})

puts "Creating user..... "

Item.create! ({
category:"Blouse",
item_name: "blouse",
size: "M",
price: 100,
photo_items: [File.open("./app/assets/images/blouse1.jpg", 'r')],
days_delivery: 5,
user_id: 1,
owner: user,
address: "Rua Francisco Otaviano 60 Rio de Janeiro"
})


Item.create! ({
category: "Pant",
item_name: "pants",
size: "L",
price: 300,
photo_items: [File.open("./app/assets/images/blouse1.jpg", 'r')],
days_delivery: 3,
user_id: 2,
owner: user,
address: "Avenida Epitacio Pessoa 2900 Rio de Janeiro"
})

Item.create! ({
category: "Jacket",
item_name: "pink jacket",
size: "M",
price: 100,
photo_items: [File.open("./app/assets/images/jacket1.jpg", 'r')],
days_delivery: 5,
user_id: 3,
owner: user,
address: "Avenida Atlantica 500 Rio de Janeiro"
})


Item.create! ({
category: "Jacket",
item_name: "denim jacket",
size: "L",
price: 300,
photo_items: [File.open("./app/assets/images/jacket2.jpg", 'r')],
days_delivery: 3,
user_id: 4,
owner: user,
address: "Rua Barata Ribeiro 300 Rio de Janeiro"
})

Item.create! ({
category: "Jacket",
item_name: "blue jacket",
size: "M",
price: 100,
photo_items: [File.open("./app/assets/images/jacket3.jpg", 'r')],
days_delivery: 5,
user_id: 5,
owner: user,
address: "Rua Sao Clemente 200 Rio de Janeiro"
})


Item.create! ({
category: "Pant",
item_name: "blue pants",
size: "L",
price: 300,
photo_items: [File.open("./app/assets/images/pants_2.jpg", 'r')],
days_delivery: 3,
user_id: 6,
owner: user,
address: "Avenida Rio Branco 658 Rio de Janeiro"
})

Item.create! ({
category: "Pant",
item_name: "red pants",
size: "M",
price: 100,
photo_items: [File.open("./app/assets/images/pants3.jpg", 'r')],
days_delivery: 5,
user_id: 7,
owner: user,
address: "Avenida Vieira Souto 480 Rio de Janeiro"
})


Item.create! ({
category: "Pant",
item_name: "pants",
size: "L",
price: 300,
photo_items:  [File.open("./app/assets/images/pants.jpg", 'r')],
days_delivery: 3,
user_id: 8,
owner: user,
address: "Praia de Botafogo 450 Rio de Janeiro"
})

Item.create! ({
category: "Blouse",
item_name: "blouse",
size: "S",
price: 300,
photo_items: [File.open("./app/assets/images/blouse1.jpg", 'r')],
days_delivery: 3,
user_id: 9,
owner: user,
address: "Rua Parana Curitiba"
})

Item.create! ({
category:"Shirt",
item_name: "White shirt",
size: "S",
price: 50,
photo_item_urls: ["http://res.cloudinary.com/ddfvlr6h2/image/upload/v1503681915/11284_Agnie_002_xyduwp.png"],
days_delivery: 5,
user_id: 10,
owner: user,
address: "Rua Cupertino Durao 50 Rio de Janeiro"
})

puts 'Finished the seeding!'
