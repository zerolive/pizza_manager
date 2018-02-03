class PizzasController < ApplicationController
  def index
    @pizzas = PreparedPizza.all
  end

  def show
    @pizza = PreparedPizza.find(params[:id])
    default_ingredients = Recipe.ingredients_for(@pizza.id)
    @ingredients = Ingredient.find(default_ingredients)
    @pizza_price = PreparedPizza.calculate_price(@ingredients)
  end
end
