# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
first_product = Product.create({name: "Lata de Coca Cola ", description: "Lata de gaseosa Coca Cola 475 ml", stock: 200, price: 2.75, locale: :es})
first_product.update({name: "Coca Cola Can", description: "Can of Soda Coca Cola 475 ml", locale: :en})

second_product = Product.create({name: "Lata de Pepsi ", description: "Lata de gaseosa Pepsi 475 ml", stock: 200, price: 2.50, locale: :es})
second_product.update({name: "Pepsi Can", description: "Can of Soda Pepsi 475 ml", locale: :en})

third_product = Product.create({name: "Lata de fanta roja ", description: "Lata de gaseosa fanta roja 475 ml", stock: 200, price: 2.85, locale: :es})
third_product.update({name: "fanta roja Can", description: "Can of Soda fanta roja 475 ml", locale: :en})