require 'rails_helper'
require 'capybara'

describe 'Pizza' do
  fit 'shows its ingredients' do
    ingredient = Ingredient.new(name: 'Tomato')
    ingredient.save
    pizza = PreparedPizza.new(name: 'The Fun Pizza')
    pizza.save
    recipe = Recipe.new(
      pizza: pizza.id,
      ingredient: ingredient.id
    )
    recipe.save

    visit root_path
    click_on(pizza.name)

    expect(page).to have_content(ingredient.name)
  end
end
