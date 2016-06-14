class Item < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_and_belongs_to_many :balconies
  has_and_belongs_to_many :plants

end
