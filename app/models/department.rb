class Department < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end
