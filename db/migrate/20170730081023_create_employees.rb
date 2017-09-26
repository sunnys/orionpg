class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :name
      t.string :email
      t.integer :company_id
      t.integer :user_id
      t.timestamps
    end
  end
end
