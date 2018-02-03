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

  it 'has to have an unique name' do
    any_name = 'Any name'
    any_price = '1'
    ingredient = Ingredient.new(
      name: any_name,
      price: any_price
    )
    ingredient.save
    repeated_ingredient = Ingredient.new(
      name: any_name,
      price: any_price
    )

    repeated_ingredient.save

    errors = repeated_ingredient.errors
    expect(errors.count).to eq(1)
    expect(errors.messages[:name]).to eq(["has already been taken"])
  end
end
