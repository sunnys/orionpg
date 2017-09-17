class CreateThirdPartyEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :third_party_employees do |t|
      t.references :third_party_vendor, foreign_key: true
      t.string :name
      t.integer :third_party_vendor_id
      t.string :email

      t.timestamps
    end
  end
end
