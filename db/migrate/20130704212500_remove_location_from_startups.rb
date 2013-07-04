class RemoveLocationFromStartups < ActiveRecord::Migration
  def change
    remove_column :startups, :location, :string
  end
end
