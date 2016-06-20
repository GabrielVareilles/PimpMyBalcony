class ChangePriceForItems < ActiveRecord::Migration
  def up
    add_monetize :items, :price, currency: { present: false }
    say_with_time 'migrate old price to price_cents' do
      Item.all.each do |item|
        item.price_cents = item.price
      end
    end
    remove_column :items, :price
  end

  def down
    add_column :items, :price, :integer
    say_with_time 'return old state: migrate price' do
      Item.all.each do |item|
        item.price = item.price_cents
      end
    end
    remove_column :items, :price_cents
  end
end
