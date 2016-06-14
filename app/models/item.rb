class Item < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_and_belongs_to_many :balconies
  has_and_belongs_to_many :plants

  validates :name, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: %w(Decorations Pots Outdoor-Plants)}
  validates :price, presence: true

end
