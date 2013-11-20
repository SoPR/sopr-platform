class ActivitiesController < ApplicationController
  layout 'application'
  def index
    @activities = PublicActivity::Activity.order('created_at desc')
  end
end
