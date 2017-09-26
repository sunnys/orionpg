class AddColumnUserIdInThirdPartyEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :third_party_employees, :user_id, :integer
  end
end
