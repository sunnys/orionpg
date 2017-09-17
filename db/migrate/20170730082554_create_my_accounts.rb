class CreateMyAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :my_accounts do |t|
      t.float :total_earning

      t.timestamps
    end
  end
end
