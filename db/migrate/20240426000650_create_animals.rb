class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :species, null: false
      t.string :name, null: false
      t.integer :status
      t.references :habitat
      t.jsonb :dietary_requirements
      t.jsonb :feeding_times

      t.timestamps
    end
  end
end
