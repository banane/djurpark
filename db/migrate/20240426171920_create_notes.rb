class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.references :employee, null: false
      t.references :notable, polymorphic: true, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
