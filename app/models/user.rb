class User < ActiveRecord::Base
  has_one :profile
  has_many :products
  has_many :messages
  has_many :follows
  has_secure_password
end
