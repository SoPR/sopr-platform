class UsersController < ApplicationController
  def index
    # If no search_query is provided then, return all users as usual.
    if params[:search_query].nil? or params[:search_query].blank?
      @users = User.order("created_at").page params[:page]
    else
      @users = User.search(String.new(params[:search_query])).page params[:page]
    end
  end
end
