class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.order("created_at").page params[:page]
  end
end
