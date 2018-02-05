module PizzasHelper
  def with_currency(price)
    "#{price} €"
  end

  def minimum?(ingredients)
    ingredients.size == 1
  end
end
