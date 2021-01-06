class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, foreign_key: :follower_id
  belongs_to :folllowing_user, foreign_key: :following_id
end
