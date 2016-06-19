class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total
      t.integer :shipping
      t.integer :discount
      t.string :delivery_address
      t.boolean :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
