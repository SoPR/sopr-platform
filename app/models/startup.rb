class Startup < ActiveRecord::Base
  belongs_to :user
  # has_and_belongs_to_many :markets
  # Alias for acts_as_taggable_on :tags
  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :markets
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :pitch
  validates_length_of :name, :maximum => 40
  validates_length_of :pitch, :maximum => 100

  # def markets=(markets)
  #   markets = markets.split(",")

  #   existing_markets = Market.where(name: markets)

  #   self.markets << existing_markets

  #   (markets - existing_markets.map(&:name)).each do |name|
  #     self.markets << Market.create(name: name)
  #    end

  # end

end
