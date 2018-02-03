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
end
