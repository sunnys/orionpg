class AddColumnThirdPartyVendorIdInFlightInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :flight_informations, :third_party_vendor_id, :integer
  end
end
