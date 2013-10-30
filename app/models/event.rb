class Event < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  # Public Activity
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  def link
    if url.present? then url else "http://startupsofpuertorico.com/events" end
  end
end
