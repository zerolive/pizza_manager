require 'rails_helper'

describe PizzasController, type: :controller do
  it 'returns ok for get index' do

    get :index

    expect(response.code).to eq('200')
  end

  it 'returns ok for get show' do
    pizza = PreparedPizza.new(name: 'any name')
    pizza.save
    params = { params: { id: pizza.id } }

    get :show, params

    expect(response.code).to eq('200')
  end
end
