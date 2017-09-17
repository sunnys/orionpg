class CreateTransacts < ActiveRecord::Migration[5.0]
  def change
    create_table :transacts do |t|
      t.references :employee, foreign_key: true
      t.references :token, foreign_key: true
      t.references :company, foreign_key: true
      t.references :third_party_vendor, foreign_key: true
      t.string :transaction_token
      t.datetime :transaction_token_created_at
      t.integer :employee_id
      t.integer :company_id
      t.integer :third_party_vendor_id
      t.integer :token_id

      t.timestamps
    end
  end
end
