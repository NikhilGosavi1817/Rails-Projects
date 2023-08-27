class CreateTenders < ActiveRecord::Migration[7.0]
  def change
    create_table :tenders do |t|
      t.string :company_name
      t.integer :cost
      t.string :status, default: 'open'
      t.string :note
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
