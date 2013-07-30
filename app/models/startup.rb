class Startup < ActiveRecord::Base
  belongs_to :user

  extend FriendlyId
  friendly_id :name, use: :slugged

  # Alias for acts_as_taggable_on :tags
  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :markets
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :pitch
  validates_length_of :name, :maximum => 40
  validates_length_of :pitch, :maximum => 100

end
