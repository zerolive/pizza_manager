class Recipe < ApplicationRecord
  validates :ingredient, presence: true
  validates :pizza, presence: true

  def self.ingredients_for(pizza)
    recipes = where(pizza: pizza)

    ingredients = recipes.map do |recipe|
      recipe.ingredient
    end

    ingredients
  end
end
