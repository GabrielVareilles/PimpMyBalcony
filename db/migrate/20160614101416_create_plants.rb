class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :temperature_min
      t.integer :temperature_max
      t.integer :pluviometry
      t.integer :sunshine_amount
      t.string :scientific_name
      t.integer :fertiliser
      t.text :advises
      t.integer :price
      t.integer :slot
      t.string :photo
      t.string :color
      t.string :size

      t.timestamps null: false
    end
  end
end
