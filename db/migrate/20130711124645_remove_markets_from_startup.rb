class RemoveMarketsFromStartup < ActiveRecord::Migration
  def change
    remove_column :startups, :markets, :string
  end
end
