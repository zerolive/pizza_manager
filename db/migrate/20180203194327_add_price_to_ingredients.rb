class AddPriceToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :price, :float
  end
end
