class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.references :employee, foreign_key: true
      t.string :transaction_token
      t.datetime :transaction_token_created_at
      t.integer :employee_id

      t.timestamps
    end
  end
end
