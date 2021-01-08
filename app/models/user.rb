class User < ActiveRecord::Base
  has_one :profile
  has_many :products
  has_many :messages
  has_many :follows
  has_secure_password

  validates :username, presence: true, uniqueness: true
end
