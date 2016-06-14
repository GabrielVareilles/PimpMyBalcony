class Plant < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end
