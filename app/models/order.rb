class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :items

  def add_item(item)
    self.items << item
  end

  def remove_item(item)
    # This code is absolute shit, sorry.
    collection = self.items.to_a
    id = collection.index(item)
    collection.delete_at(id)
    self.items.clear
    self.items = collection
  end

  def remove_all_items
    self.items.clear
  end
end
