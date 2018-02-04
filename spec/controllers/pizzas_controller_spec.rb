require 'rails_helper'

describe PizzasController, type: :controller do
  it 'returns ok for get index' do

    get :index

    expect(response.code).to eq('200')
  end

  it 'returns ok for get show' do
    pizza = PreparedPizza.new(name: 'any name')
    pizza.save
    params = { params: { pizza: pizza.id } }

    get :show, params

    expect(response.code).to eq('200')
  end

  it 'returns redirect for post remove ingredient' do
    pizza = PreparedPizza.new(name: 'Any pizza')
    pizza.save

    post :remove_ingredient, params: { pizza: pizza.id, ingredient: '1' }

    expect(response.code).to eq('302')
  end

  it 'returns redirect for post add ingredient' do
    pizza = PreparedPizza.new(name: 'Any pizza')
    pizza.save

    post :add_ingredient, params: { pizza: pizza.id, ingredient: '1' }

    expect(response.code).to eq('302')
  end
end
