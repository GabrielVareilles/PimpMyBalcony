class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state
      t.monetize :amount, currency: { present: false }
      t.json :payment
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
