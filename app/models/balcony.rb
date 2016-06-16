class Balcony < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_and_belongs_to_many :items
  belongs_to :user

  validates :model, inclusion: { in: ['small', 'medium', 'large']}
  validates :address, presence: true
  validates :city, presence: true
  validates :department, presence: true
  validates :length, presence: true
  validates :orientation, presence: true
  validates :user_id, presence: true

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
