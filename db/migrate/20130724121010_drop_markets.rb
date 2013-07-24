class DropMarkets < ActiveRecord::Migration
  def change
    drop_table :markets
    drop_table :markets_startups
  end
end
