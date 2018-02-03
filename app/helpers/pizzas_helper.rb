module PizzasHelper
  def calculate_pizza_price(ingredients)
    ingredients_price = 0.0

    ingredients.each do |ingredient|
      ingredients_price += ingredient.price
    end

    final_price = ingredients_price * 1.5
  end
end
