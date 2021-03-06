class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :message
      t.references :transact, foreign_key: true
      t.integer :transact_id

      t.timestamps
    end
  end
end
