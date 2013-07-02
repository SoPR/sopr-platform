class Startup < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
end
