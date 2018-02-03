class PreparedPizza < ApplicationRecord
  MANUFACTURE_PRICE = 1.5

  validates :name, presence: true, uniqueness: true

  def self.calculate_price(ingredients)
    ingredients_price = 0.0

    ingredients.each do |ingredient|
      ingredients_price += ingredient.price
    end

    final_price = ingredients_price * MANUFACTURE_PRICE
    final_price
  end
end
