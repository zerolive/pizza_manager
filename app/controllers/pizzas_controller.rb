class PizzasController < ApplicationController
  before_action :set_pizza, only: [:show, :remove_ingredient]

  def index
    @pizzas = PreparedPizza.all
  end

  def show
    default_ingredients = Recipe.ingredients_for(@pizza.id)

    @ingredients = Ingredient.find(default_ingredients)
    @pizza_price = PreparedPizza.calculate_price(@ingredients)
  end

  def remove_ingredient
    removed = session[:removed] || []
    ingredients = Recipe.ingredients_for(@pizza.id)

    removed << params[:ingredient].to_i
    session[:removed] = removed

    removed.each do |ingredient|
      ingredients.delete(ingredient)
    end

    @ingredients = Ingredient.find(ingredients)
    @pizza_price = PreparedPizza.calculate_price(@ingredients)

    render :show
  end

  private

  def set_pizza
    @pizza = PreparedPizza.find(params[:id])
  end
end
