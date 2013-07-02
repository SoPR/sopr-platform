class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.string :pitch
      t.string :website
      t.text :product
      t.string :location
      t.string :markets
      t.references :user, index: true

      t.timestamps
    end
  end
end
