class ItemsAndPlants < ActiveRecord::Migration
  def change
    create_table :items_plants, id: false do |t|
      t.belongs_to :item, index: true
      t.belongs_to :plant, index: true
    end
  end
end
