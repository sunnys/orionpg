class AddColumnCommitedToOperations < ActiveRecord::Migration[5.0]
  def change
    add_column :operations, :commited, :boolean, :default => false
  end
end
