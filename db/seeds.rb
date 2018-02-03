# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mushroom_pizza = PreparedPizza.create(name: 'The​ ​Super​ ​Mushroom​ ​Pizza')
fun_pizza = PreparedPizza.create(name: 'The​ ​Fun​ Pizza​')

tomato = Ingredient.create(name: 'Tomato​')
mushrooms = Ingredient.create(name: 'Sliced​ ​Mushrooms​')
feta = Ingredient.create(name: 'Feta​ ​Cheese')
sausages​ = Ingredient.create(name: 'Sausages​')
onion = Ingredient.create(name: 'Sliced​ ​Onion')
mozzarella​ = Ingredient.create(name: 'Mozzarella​ ​Cheese')
oregano = Ingredient.create(name: 'Oregano​')
bacon = Ingredient.create(name: 'Bacon')

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

