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

# Pizza part sizes

pizza_parts1 = PizzaPart.create({name: "Pizza de tamaño pequeña", description: "Pizza de tamaño pequeña de unas 10 pulgadas, cortadas en 4 rebanadas", price: 4.3, category: 'S', locale: :es})
pizza_parts1.update({name: "Small pizza size", description: "Small size pizza about 10 inches, cut in 4 slices", locale: :en})

pizza_parts2 = PizzaPart.create({name: "Pizza de tamaño mediana", description: "Pizza de tamaño mediana de unas 12 pulgadas, cortadas en 6 rebanadas", price: 5.0, category: 'S', locale: :es})
pizza_parts2.update({name: "Medium pizza size", description: "Medium size pizza about 12 inches, cut in 6 slices", locale: :en})

pizza_parts3 = PizzaPart.create({name: "Pizza de tamaño grande", description: "Pizza de tamaño grande de unas 14 pulgadas, cortadas en 8 rebanadas", price: 6.2, category: 'S', locale: :es})
pizza_parts3.update({name: "Big pizza size", description: "Big size pizza about 14 inches, cut in 8 slices", locale: :en})

pizza_parts4 = PizzaPart.create({name: "Pizza de tamaño familiar", description: "Pizza de tamaño familiar de unas 16 pulgadas, cortadas en 10 rebanadas", price: 6.99, category: 'S', locale: :es})
pizza_parts4.update({name: "Family pizza size", description: "Family size pizza about 16 inches, cut in 10 slices", locale: :en})

# Pizza Flavors

pizza_parts5 = PizzaPart.create({name: "Queso Mozzarella", description: "Deliciosa pizza hecha con el ingrediente Queso Mozzarella", price: 4.44, category: 'F', locale: :es})
pizza_parts5.update({name: "Mozzarella Cheese", description: "Delicious pizza made with the topping Mozzarella Cheese", locale: :en})

pizza_parts6 = PizzaPart.create({name: "Jamón", description: "Deliciosa pizza hecha con el ingrediente Jamón", price: 5.12, category: 'F', locale: :es})
pizza_parts6.update({name: "Ham", description: "Delicious pizza made with the topping Ham", locale: :en})

pizza_parts7 = PizzaPart.create({name: "Pepperoni", description: "Deliciosa pizza hecha con el ingrediente Pepperoni", price: 4.99, category: 'F', locale: :es})
pizza_parts7.update({name: "Pepperoni", description: "Delicious pizza made with the topping Pepperoni", locale: :en})

# Pizza border

pizza_parts8 = PizzaPart.create({name: "Borde de Queso Mozzarella", description: "Delicioso borde de Queso Mozzarella", price: 2.99, category: 'B', locale: :es})
pizza_parts8.update({name: "Mozzarella Cheese Rim", description: "Delicious Mozzarella Cheese rim", locale: :en})

pizza_parts9 = PizzaPart.create({name: "Borde de Pan Tostado", description: "Delicioso borde de Pan Tostado", price: 0.99, category: 'B', locale: :es})
pizza_parts9.update({name: "Toasted Bread Edge", description: "Delicious Toasted Bread Edge", locale: :en})

pizza_parts10 = PizzaPart.create({name: "Borde con rebanadas de chorizo", description: "Delicioso Borde con rebanadas de chorizo", price: 4.35, category: 'B', locale: :es})
pizza_parts10.update({name: "Border with chorizo slices", description: "Delicious Border with chorizo slices", locale: :en})

Customer.create({name: "Javier", last_name: "Verstappen", phone: "12345678", address: "De cine blanco 2c al norte", mail: "ejemplo@hotmail.com"})
Customer.create({name: "Manuel", last_name: "Perez", phone: "12235678", address: "Del cine golzales 3 c al norte 2 al oeste", mail: "mauel@gmail.com"})
Customer.create({name: "Gerson", last_name: "Lopez", phone: "12341678", address: "De los semaforos del rigoverto 2c al este", mail: "g.lopez@hotmail.com"})
Customer.create({name: "Pluvio", last_name: "Leiva", phone: "12455678", address: "De montes los Olivos, 2c al norte", mail: "esmeralda@hotmail.com"})

Employee.create({email: 'normal1@hotmail.com', password: '123456', role: 'N', first_name: 'Jeorge', last_name: 'Miranda', phone: '12312312'})
Employee.create({email: 'normal2@hotmail.com', password: '123456', role: 'N', first_name: 'Pedro', last_name: 'Rey', phone: '11315332'})
Employee.create({email: 'boss1@hotmail.com', password: '123456', role: 'B', first_name: 'Angel', last_name: 'De la cruz', phone: '11715622'})
Employee.create({email: 'boss2@hotmail.com', password: '123456', role: 'B', first_name: 'Colm', last_name: 'Stone', phone: '11345735'})
