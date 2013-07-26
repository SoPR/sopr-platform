class AddAvailableForHireToUsers < ActiveRecord::Migration
  def change
    add_column :users, :available_for_hire, :boolean, :default => false
  end
end
