class AddTwoWayToTransactionDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :transaction_details, :two_way, :boolean
    add_column :transaction_details, :refundable, :boolean
    add_column :transaction_details, :journey_date, :date
    add_column :transaction_details, :journey_time, :datetime
    add_column :transaction_details, :travel_time, :float
  end
end
