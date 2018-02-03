class CreatePreparedPizzas < ActiveRecord::Migration[5.1]
  def change
    create_table :prepared_pizzas do |t|
      t.string :name

      t.timestamps
    end
  end
end
