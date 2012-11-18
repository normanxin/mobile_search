class App < ActiveRecord::Base
  has_many :comments
  has_many :user_app_lists
end
