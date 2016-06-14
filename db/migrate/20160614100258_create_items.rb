class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :sub_category
      t.string :plant_category
      t.integer :slot
      t.integer :price
      t.integer :volume
      t.integer :length
      t.integer :width
      t.integer :weight
      t.string :photo

      t.timestamps null: false
    end
  end
end
