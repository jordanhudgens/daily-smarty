class UserImage < ApplicationRecord
  belongs_to :user

  mount_uploader :img, ImageUploader

  validates_presence_of :img
end
