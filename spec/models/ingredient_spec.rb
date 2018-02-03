require 'rails_helper'

describe Ingredient do
  it 'has to have a name' do
    any_price = 1
    ingredient = Ingredient.new(
      name: nil,
      price: any_price
    )

    ingredient.save

    errors = ingredient.errors
    expect(errors.count).to eq(1)
    expect(errors.messages[:name]).to eq(["can't be blank"])
  end

  it 'has to have a price' do
    ingredient = Ingredient.new(
      name: 'any name',
      price: nil
    )

    ingredient.save

    errors = ingredient.errors
    expect(errors.count).to eq(1)
    expect(errors.messages[:price]).to eq(["can't be blank"])
  end
end
