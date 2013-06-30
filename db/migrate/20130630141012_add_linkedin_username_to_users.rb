class AddLinkedinUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_username, :string
  end
end
