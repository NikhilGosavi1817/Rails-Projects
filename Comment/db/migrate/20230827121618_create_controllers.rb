class CreateControllers < ActiveRecord::Migration[7.0]
  def change
    create_table :controllers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
