class AddPriceToPlants < ActiveRecord::Migration
  def change
    add_monetize :plants, :price, currency: { present: false }
  end
end
