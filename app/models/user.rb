class User < ActiveRecord::Base
  attr_accessible :first, :last, :email, :username, :password, :password_confirmation, :gender, :private
  has_secure_password
end
