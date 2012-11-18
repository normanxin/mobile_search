class User < ActiveRecord::Base
  has_many :profiles
  has_many :user_app_lists
  has_many :friends
end
