class Event < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, ImageUploader

  # Public Activity
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
end
