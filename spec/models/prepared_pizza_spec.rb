require 'rails_helper'

describe PreparedPizza do
  it 'has to have a name' do
    pizza = PreparedPizza.new(
      name: nil
    )

    pizza.save

    errors = pizza.errors
    expect(errors.count).to eq(1)
    expect(errors.messages[:name]).to eq(["can't be blank"])
  end
end
