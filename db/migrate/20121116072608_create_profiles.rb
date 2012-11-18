class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.text :type
      t.integer :health
      t.integer :productivity
      t.integer :education
      t.integer :lifestyle
      t.integer :social
      t.integer :game
      t.integer :whether

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
