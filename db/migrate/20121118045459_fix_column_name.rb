class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :profiles, :whether, :weather
    rename_column :profiles, :type, :profile_type
  end

  def self.down
  end
end
