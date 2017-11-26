class RenameColumnTypeToTrTypeInOperations < ActiveRecord::Migration[5.0]
  def change
    rename_column :operations, :type, :tr_type
  end
end
