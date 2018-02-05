require 'rails_helper'
require 'capybara'

describe 'Pizza' do
  it 'shows its ingredients' do
    ingredient_name = 'Tomato'
    pizza = prepare_pizza(ingredient_name: ingredient_name)

    visit root_path
    click_on('Customize')

    expect(page).to have_content(ingredient_name)
  end

  it 'shows the price of its ingredients' do
    ingredient_price = 1.0
    pizza = prepare_pizza(ingredient_price: ingredient_price)

    visit root_path
    click_on('Customize')

    expect(page).to have_content(ingredient_price)
  end

  it '\' price is the total of products plus manufacture cost' do
    ingredient_price = 1.0
    manufacture_cost = 1.5
    pizza = prepare_pizza(ingredient_price: ingredient_price)

    visit root_path
    click_on('Customize')

    final_price = ingredient_price * manufacture_cost
    expect(page).to have_content("Total: #{final_price}")
  end

  it 'can not remove the last ingredient' do
    minimum_ingredients_warning = 'Pizza has to have at least one ingredient.'
    ingredient = 'Tomato'
    pizza = prepare_pizza(ingredient_name: ingredient)

    visit root_path
    click_on('Customize')
    click_on('Remove')

    expect(page).to have_content(pizza.name)
    expect(page).to have_content(ingredient)
    expect(page).to have_content(minimum_ingredients_warning)
  end

  it 'can remove different ingredients' do
    pizza = prepare_pizza
    ingredient = Ingredient.new(name: 'Onion', price: 1.0)
    ingredient.save
    extra_ingredient = Ingredient.new(name: 'Extra', price: 1.0)
    extra_ingredient.save
    recipe = Recipe.new(pizza: pizza.id, ingredient: ingredient.id)
    recipe.save
    recipe = Recipe.new(pizza: pizza.id, ingredient: extra_ingredient.id)
    recipe.save

    visit root_path
    click_on('Customize')
    remove(ingredient.id)
    remove(extra_ingredient.id)

    expect(page).to have_content(pizza.name)
    expect(page).not_to have_css("##{ingredient.id}")
    expect(page).not_to have_css("##{extra_ingredient.id}")
  end

  it 'can add ingredients' do
    pizza = PreparedPizza.new(name: 'New Pizza')
    pizza.save
    ingredient = Ingredient.new(name: 'Ingredient', price: 1.0)
    ingredient.save

    visit root_path
    click_on('Customize')
    click_on('Add')

    expect(page).to have_content(ingredient.name)
  end

  def remove(id)
    find("##{id}").click
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
