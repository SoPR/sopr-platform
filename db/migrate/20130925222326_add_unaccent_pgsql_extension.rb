require_relative '20130921141716_add_unaccent_extension'

class AddUnaccentPgsqlExtension < ActiveRecord::Migration
  def up
    revert AddUnaccentExtension
    enable_extension 'unaccent'
  end

  def down
    disable_extension 'unaccent'
  end
end