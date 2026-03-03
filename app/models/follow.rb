class Follow < ApplicationRecord
  belongs_to :followed_user, class_name: "User", foreign_key: "followed_user", dependent: :destroy
  belongs_to :follower_user, class_name: "User", foreign_key: "follower_user", dependent: :destroy


end
