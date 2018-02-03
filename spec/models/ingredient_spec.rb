require 'rails_helper'

describe Ingredient do
  it 'has to have a name' do
    ingredient = Ingredient.new(
      name: nil
    )

    ingredient.save

    errors = ingredient.errors
    expect(errors.count).to eq(1)
    expect(errors.messages[:name]).to eq(["can't be blank"])
  end
end
