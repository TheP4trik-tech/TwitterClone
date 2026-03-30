class Follow < ApplicationRecord
  belongs_to :followed_user, class_name: "User", foreign_key: "followed_user"
  belongs_to :follower_user, class_name: "User", foreign_key: "follower_user"

  validates :follower_user, presence: true
  validates :followed_user, presence: true

  before_save :check_for_uniqueness, :check_for_self_follow

  def check_for_uniqueness
    if Follow.where(follower_user: self.follower_user, followed_user: self.followed_user).exists?
      errors.add(:base, "You already follow this user")
      self.destroy
    end
  end
  def check_for_self_follow
    if self.follower_user == self.followed_user
      errors.add(:base, "You can't follow yourself")
      self.destroy
    end
  end


end
