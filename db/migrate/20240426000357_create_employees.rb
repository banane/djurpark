class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :role
      t.jsonb :tasks

      t.timestamps
    end
  end
end
