class AddWebsiteUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :website_url, :string
  end
end
