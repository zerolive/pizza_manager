class PizzasController < ApplicationController
  def index
    @pizzas = PreparedPizza.all
  end
end
