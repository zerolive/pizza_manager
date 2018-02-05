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

  it 'has to have an unique name' do
    pizza_name = 'Any name'
    pizza = PreparedPizza.new(
      name: pizza_name
    )
    pizza.save
    repeated_pizza = PreparedPizza.new(
      name: pizza_name
    )

    repeated_pizza.save

    errors = repeated_pizza.errors
    expect(errors.count).to eq(1)
    expect(errors.messages[:name]).to eq(["has already been taken"])
  end

  it 'can have a description' do
    description = 'Specific description'
    pizza = PreparedPizza.new(
      name: 'Any name',
      description: description
    )

    pizza.save

    expect(pizza.description).to eq(description)
  end

  it 'can have an image' do
    url_image = 'image.jpg'
    pizza = PreparedPizza.new(
      name: 'Any name',
      image: url_image
    )

    pizza.save

    expect(pizza.image).to eq(url_image)
  end
end
