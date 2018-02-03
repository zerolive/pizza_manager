require 'rails_helper'
require 'capybara'

describe 'Pizzas' do
  it 'are shown' do
    fun_pizza_name ='The​ ​Fun​ Pizza​'
    mushroom_pizza_name = 'The​ ​Super​ ​Mushroom​ ​Pizza'
    PreparedPizza.create(name: fun_pizza_name)
    PreparedPizza.create(name: mushroom_pizza_name)

    visit root_path

    expect(page).to have_content(fun_pizza_name)
    expect(page).to have_content(mushroom_pizza_name)
  end
end
