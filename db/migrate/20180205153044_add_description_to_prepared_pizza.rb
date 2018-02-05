class AddDescriptionToPreparedPizza < ActiveRecord::Migration[5.1]
  def change
    add_column :prepared_pizzas, :description, :text, :default => ''
  end
end
