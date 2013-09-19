class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :where
      t.datetime :start_time
      t.string :url
      t.string :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
