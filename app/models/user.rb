class User < ActiveRecord::Base
  has_many :messages
  has_many :follows
  has_secure_password
end
