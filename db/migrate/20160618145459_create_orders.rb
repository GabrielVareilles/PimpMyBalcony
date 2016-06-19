class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :total
      t.integer :shipping
      t.integer :discount
      t.string :delivery_adress

      t.timestamps null: false
    end
  end
end
