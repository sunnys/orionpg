class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :company, foreign_key: true
      t.references :third_party_vendor, foreign_key: true
      t.string :name
      t.float :total
      t.float :unpaid
      t.float :paid

      t.timestamps
    end
  end
end
