class OrderAndItem < ActiveRecord::Migration
  def change
    create_table :orders_items, id: false do |t|
      t.belongs_to :order, index: true
      t.belongs_to :item, index: true
    end
  end
end
