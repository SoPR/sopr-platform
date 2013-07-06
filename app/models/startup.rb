class Startup < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :pitch
  validates_length_of :name, :maximum => 40
  validates_length_of :pitch, :maximum => 100
end
