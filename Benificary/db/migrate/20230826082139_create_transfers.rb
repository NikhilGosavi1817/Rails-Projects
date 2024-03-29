class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :benficary, null: false, foreign_key: true
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
