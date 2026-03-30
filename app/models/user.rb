class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :active_relationships, class_name: "Follow", foreign_key: "follower_user", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed_user

  has_many :passive_relationships, class_name: "Follow", foreign_key: "followed_user", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower_user

  validates :bio, length: {maximum: 100}, allow_nil: true
  validates :first_name, :last_name, presence: true, length: 2..16
  validates :username, presence: true, uniqueness: true, length: 2..16
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }

  def user_total_posts = posts.count
  def user_total_followers = followers.count
  def user_total_following = following.count


  def to_s
    "#{first_name} #{last_name}"
  end

  def is_following?(user)
    @user = user
    following.include?(@user)
  end
  def get_follow_id(user)
    @user = user
    Follow.find_by(follower_user: self, followed_user: @user)
  end


end
