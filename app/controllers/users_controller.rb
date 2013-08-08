class UsersController < ApplicationController
    # GET /users
    # GET /users.json
    def index
      @users = User.order("created_at")
    end

end
