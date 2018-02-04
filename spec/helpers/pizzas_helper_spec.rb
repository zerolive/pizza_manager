require 'rails_helper'

describe PizzasHelper do
  it 'returns a price with a currency symbol' do
    currency_symbol = '€'
    price = 1.0

    result = helper.with_currency(price)

    expect(result).to eq("#{price} #{currency_symbol}")
  end
end
