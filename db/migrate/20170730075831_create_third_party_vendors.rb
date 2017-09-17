class CreateThirdPartyVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :third_party_vendors do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
