class AddColumnTypeToFlightInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :flight_informations, :type, :string
  end
end
