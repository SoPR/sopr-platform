class AddFlickrUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :flickr_username, :string
  end
end
