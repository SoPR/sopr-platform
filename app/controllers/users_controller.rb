class UsersController < ApplicationController
  def index
    # If no search_query is provided then, return all users as usual.
    @users = if params[:search_query].nil? || params[:search_query].blank?
      User.order("created_at").page params[:page]
    else
      User.search(String.new(params[:search_query])).page params[:page]
    end
  end
end
