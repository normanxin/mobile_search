# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
seed_file = File.join(Rails.root, 'db', 'seed.yml')
config = YAML::load_file(seed_file)
App.create(config["apps"])
User.create(config["users"])
Profile.create(config["profiles"])
UserAppList.create(config["user_app_lists"])