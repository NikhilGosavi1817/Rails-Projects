class AddFundsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :funds, :integer, default: 10000
  end
end
