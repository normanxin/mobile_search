class CreateApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.string :name
      t.text :description, :limit=>nil
      t.string :publisher
      t.string :image_url
      t.integer :counter
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :apps
  end
end
