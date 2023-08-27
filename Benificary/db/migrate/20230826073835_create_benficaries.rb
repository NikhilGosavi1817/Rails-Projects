class CreateBenficaries < ActiveRecord::Migration[7.0]
  def change
    create_table :benficaries do |t|
      t.string :account_number
      t.string :name
      t.integer :balance, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
