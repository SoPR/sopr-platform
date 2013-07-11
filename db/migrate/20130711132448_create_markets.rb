class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name

      t.timestamps
    end

    create_table :markets_startups, :id => false do |t|
      t.integer "startup_id"
      t.integer "market_id"
    end

    add_index :markets_startups, [:startup_id, :market_id]

  end
end
