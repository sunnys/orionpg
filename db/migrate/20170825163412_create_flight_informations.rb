class CreateFlightInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :flight_informations do |t|
      t.string :name
      t.string :source
      t.string :destination
      t.string :source_code
      t.string :destination_code
      t.float :amount
      t.boolean :two_way
      t.date :journey_date
      t.datetime :journey_time
      t.float :travel_time
      t.boolean :refundable

      t.timestamps
    end
  end
end
