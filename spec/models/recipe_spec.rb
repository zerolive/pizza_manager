require 'rails_helper'

describe Recipe do
  it 'has to have a pizza' do
    any_ingredient = 1
    recipe = Recipe.new(
      pizza: nil,
      ingredient: any_ingredient
    )

    recipe.save

    errors = recipe.errors
    expect(errors.count).to eq(1)
    expect(errors.messages[:pizza]).to eq(["can't be blank"])
  end

  it 'has to have a ingredient' do
    any_pizza = 1
    recipe = Recipe.new(
      pizza: any_pizza,
      ingredient: nil
    )

    recipe.save

    errors = recipe.errors
    expect(errors.count).to eq(1)
    expect(errors.messages[:ingredient]).to eq(["can't be blank"])
  end

  it 'can return the ingredients for a pizza' do
    pizza = PreparedPizza.new(name: 'Any pizza')
    pizza.save
    ingredient = Ingredient.new(name: 'Any ingredient', price: 1.0)
    ingredient.save
    recipe = Recipe.new(pizza: pizza.id, ingredient: ingredient.id)
    recipe.save
    ingredients_list = [ingredient.id]

    ingredients = Recipe.ingredients_for(pizza.id)

    expect(ingredients).to eq(ingredients_list)
  end
end
