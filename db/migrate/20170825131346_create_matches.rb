class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :reportee, index: true

      t.timestamps null: false
    end

    add_foreign_key :matches, :users, column: :reportee_id
    add_index :matches, [:user_id, :reportee_id], unique: true
  end
end
