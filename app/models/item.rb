class Item < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_and_belongs_to_many :balconies
  has_and_belongs_to_many :plants

  validates :name, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: %w(Deco Pot Plant Custom)}
  validates :price, presence: true

  def add_plant(plant)
    self.plants << plant

  end

  def remove_plant(plant)
    # This code is absolute shit, sorry.
    collection = self.plants.to_a
    id = collection.index(plant)
    collection.delete_at(id)
    self.plants.clear
    self.plants = collection

  end

  def remove_all_plants
    self.plants.clear
  end
end
