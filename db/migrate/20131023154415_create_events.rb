class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.datetime :date
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
