class StatusController < ApplicationController
  layout 'application'
  def index
    @project = Blimp::Project.find_all
  end
end
