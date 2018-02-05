class AddImageToPreparedPizza < ActiveRecord::Migration[5.1]
  def change
    add_column :prepared_pizzas, :image, :string, :default => 'pizza.png'
  end
end
