class BalconiesAndItems < ActiveRecord::Migration
  def change
    create_table :balconies_items, id: false do |t|
      t.belongs_to :balcony, index: true
      t.belongs_to :item, index: true
    end
  end
end
