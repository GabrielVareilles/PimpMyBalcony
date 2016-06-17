class Review < ActiveRecord::Base
  belongs_to :balcony

  validates :content, length: { minimum: 20 }
end
