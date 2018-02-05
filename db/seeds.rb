# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
description = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate.'
mushroom_pizza = PreparedPizza.create(name: 'The​ ​Super​ ​Mushroom​ ​Pizza', description: description)
fun_pizza = PreparedPizza.create(name: 'The​ ​Fun​ Pizza​', description: description)

tomato = Ingredient.create(name: 'Tomato​', price: 0.5)
mushrooms = Ingredient.create(name: 'Sliced​ ​Mushrooms​', price: 0.5)
feta = Ingredient.create(name: 'Feta​ ​Cheese', price: 1.0)
sausages​ = Ingredient.create(name: 'Sausages​', price: 1.0)
onion = Ingredient.create(name: 'Sliced​ ​Onion', price: 0.5)
mozzarella​ = Ingredient.create(name: 'Mozzarella​ ​Cheese', price: 0.5)
oregano = Ingredient.create(name: 'Oregano​', price: 1.0)
bacon = Ingredient.create(name: 'Bacon', price: 1.0)

Recipe.create(pizza: mushroom_pizza.id, ingredient: tomato.id)
Recipe.create(pizza: mushroom_pizza.id, ingredient: bacon.id)
Recipe.create(pizza: mushroom_pizza.id, ingredient: mozzarella​.id)
Recipe.create(pizza: mushroom_pizza.id, ingredient: mushrooms.id)
Recipe.create(pizza: mushroom_pizza.id, ingredient: oregano.id)

Recipe.create(pizza: fun_pizza.id, ingredient: tomato.id)
Recipe.create(pizza: fun_pizza.id, ingredient: mushrooms.id)
Recipe.create(pizza: fun_pizza.id, ingredient: feta.id)
Recipe.create(pizza: fun_pizza.id, ingredient: sausages​.id)
Recipe.create(pizza: fun_pizza.id, ingredient: onion.id)
Recipe.create(pizza: fun_pizza.id, ingredient: mozzarella​.id)
Recipe.create(pizza: fun_pizza.id, ingredient: oregano.id)

