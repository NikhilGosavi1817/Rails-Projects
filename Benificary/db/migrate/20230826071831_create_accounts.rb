class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :account_number, null: false, index: {unique: true}
      t.string :name

      t.timestamps
    end
  end
end
