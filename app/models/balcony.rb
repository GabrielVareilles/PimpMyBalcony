class Balcony < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_and_belongs_to_many :items
  belongs_to :user

end
