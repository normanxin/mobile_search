class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :profiles, :whether, :weather
    rename_column :profiles, :type, :profile_type
    change_column :apps, :description, :text
  end

  def self.down
    change_column :apps, :description, :string
  end
end
