class Cart < ActiveRecord::Base
  monetize :price_cents

  belongs_to :user
  has_and_belongs_to_many :items

  def add_item(item)
    self.items << item
    self.price += item.price
  end

  def remove_item(item)
    # This code is absolute shit, sorry.
    collection = self.items.to_a
    id = collection.index(item)
    collection.delete_at(id)
    self.items.clear
    self.items = collection
    self.price -= item.price
  end

  def remove_all_items
    self.items.clear
    self.price_cents = 0
  end
end
