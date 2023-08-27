class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.integer :items, default: 0
      t.integer :cost, default: 0
      t.integer :remove_item, default: 1

      t.timestamps
    end
  end
end
