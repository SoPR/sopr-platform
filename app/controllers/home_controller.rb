class HomeController < ApplicationController
  def index
    if signed_in?
        redirect_to startups_path
    end
  end
end
