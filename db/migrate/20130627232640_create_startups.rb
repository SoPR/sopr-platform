class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.string :pitch
      t.string :website
      t.string :product
      t.string :market

      t.timestamps
    end
  end
end
