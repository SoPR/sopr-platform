class StatusController < ApplicationController
  def index
    @project = Blimp::Project.find_all
  end
end
