class AddColumnStateToTableToken < ActiveRecord::Migration[5.0]
  def change
    add_column :tokens, :state, :string
  end
end
