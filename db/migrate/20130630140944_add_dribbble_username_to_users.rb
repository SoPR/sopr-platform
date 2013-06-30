class AddDribbbleUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dribbble_username, :string
  end
end
