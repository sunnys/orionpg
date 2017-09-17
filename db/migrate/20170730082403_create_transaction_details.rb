class CreateTransactionDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_details do |t|
      t.references :transact, foreign_key: true
      t.integer :transaction_id
      t.string :type
      t.string :source
      t.string :destination
      t.float :amount
      t.boolean :confirmed

      t.timestamps
    end
  end
end
