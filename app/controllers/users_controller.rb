class UsersController < ApplicationController
  def index
    @users = User.order("created_at").page params[:page]
  end
end
