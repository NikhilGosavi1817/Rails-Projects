class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.integer :add_to_cart, default: 1

      t.timestamps
    end
  end
end
