class AddPriceToCarts < ActiveRecord::Migration
  def change
    add_monetize :carts, :price, currency: { present: false }
  end
end
