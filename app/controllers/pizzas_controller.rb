class PizzasController < ApplicationController
  before_action :set_pizza, only: [:show, :remove_ingredient, :add_ingredient, :custom]
  before_action :get_ingredient_id, only: [:remove_ingredient, :add_ingredient]
  before_action :get_new_ingredients, only: [:show, :custom]

  def index
    @pizzas = PreparedPizza.all
  end

  def show
    default_ingredients = Recipe.ingredients_for(@pizza.id)
    session[:ingredients] = default_ingredients

    @unused_ingredients = unused_ingredients_from(default_ingredients)
    @ingredients = Ingredient.find_and_sort(default_ingredients)
    @pizza_price = PreparedPizza.calculate_price(@ingredients)
  end

  def remove_ingredient
    if has_ingredients?
      ingredients.delete(@ingredient_id)
    end

    redirect_to custom_path(@pizza.id)
  end

  def add_ingredient
    ingredients << @ingredient_id

    redirect_to custom_path(@pizza.id)
  end

  def custom
    @unused_ingredients = unused_ingredients_from(ingredients)
    @ingredients = Ingredient.find_and_sort(ingredients)
    @pizza_price = PreparedPizza.calculate_price(@ingredients)
  end

  private

  def unused_ingredients_from(ingredients)
    @new_ingredients.select do |new_ingredient|
      !ingredients.include?(new_ingredient.id)
    end
  end

  def has_ingredients?
    ingredients.size > 1
  end

  def set_pizza
    @pizza = PreparedPizza.find(params[:pizza])
  end

  def ingredients
    session[:ingredients] || []
  end

  def get_ingredient_id
    id = params[:ingredient][0]

    @ingredient_id = id.to_i
  end

  def get_new_ingredients
    @new_ingredients = Ingredient.all.to_a
  end
end
