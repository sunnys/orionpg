class CreateOperations < ActiveRecord::Migration[5.0]
  def change
    create_table :operations do |t|
      t.integer :account_id
      t.string :type
      t.references :account, foreign_key: true
      t.float :amount
      t.timestamps
    end
  end
end
