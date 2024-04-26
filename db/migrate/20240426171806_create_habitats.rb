class CreateHabitats < ActiveRecord::Migration[7.1]
  def change
    create_table :habitats do |t|
      t.string :name, null: false
      t.jsonb :descriptors

      t.timestamps
    end
  end
end
