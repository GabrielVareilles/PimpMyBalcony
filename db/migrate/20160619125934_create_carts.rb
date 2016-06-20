class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :shipping
      t.integer :discount
      t.string :delivery_address
      t.boolean :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
