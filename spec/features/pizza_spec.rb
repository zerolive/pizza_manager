require 'rails_helper'
require 'capybara'

describe 'Pizza' do
  it 'shows its ingredients' do
    ingredient_name = 'Tomato'
    pizza = prepare_pizza(ingredient_name: ingredient_name)

    visit root_path
    click_on(pizza.name)

    expect(page).to have_content(ingredient_name)
  end

  it 'shows the price of its ingredients' do
    ingredient_price = 1.0
    pizza = prepare_pizza(ingredient_price: ingredient_price)

    visit root_path
    click_on(pizza.name)

    expect(page).to have_content(ingredient_price)
  end

  it '\' price is the total of products plus manufacture cost' do
    ingredient_price = 1.0
    manufacture_cost = 1.5
    pizza = prepare_pizza(ingredient_price: ingredient_price)

    visit root_path
    click_on(pizza.name)

    final_price = ingredient_price * manufacture_cost
    expect(page).to have_content("Total: #{final_price}")
  end

  def prepare_pizza(pizza_name:'The Fun Pizza', ingredient_name:'Tomato', ingredient_price:1.0)
    ingredient = Ingredient.new(
      name: ingredient_name,
      price: ingredient_price
    )
    ingredient.save
    pizza = PreparedPizza.new(name: pizza_name)
    pizza.save
    recipe = Recipe.new(
      pizza: pizza.id,
      ingredient: ingredient.id
    )
    recipe.save

    pizza
  end
end
