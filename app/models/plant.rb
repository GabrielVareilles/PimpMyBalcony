class Plant < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_and_belongs_to_many :items

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :temperature_min, presence: true
  validates :temperature_max, presence: true
  validates :pluviometry, presence: true
  validates :sunshine_amount, presence: true
end
