class Startup < ActiveRecord::Base
  attr_accessor :default_logo
  belongs_to :user

  extend FriendlyId
  friendly_id :name, use: :slugged

  # Alias for acts_as_taggable_on :tags
  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :markets
  mount_uploader :image, ImageUploader

  before_save :set_default_logo

  validates_presence_of :name, :pitch
  validates_length_of :name, :maximum => 40
  validates_length_of :pitch, :maximum => 100

  def set_default_logo
    self.remove_image! if self.default_logo && self.default_logo == 'set_default'
  end

  # Public Activity
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

end
