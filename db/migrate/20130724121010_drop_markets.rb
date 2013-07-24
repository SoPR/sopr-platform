class DropMarkets < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'markets'
      drop_table :markets
    end
    if ActiveRecord::Base.connection.table_exists? 'markets_startups'
      drop_table :markets_startups
    end
  end
end
