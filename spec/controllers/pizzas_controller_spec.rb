require 'rails_helper'

describe PizzasController do
  it 'returns ok for get index' do

    get :index

    expect(response.code).to eq('200')
  end
end
