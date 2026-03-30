class Post < ApplicationRecord
  validates :body, presence: true, length: 2..200
  validates :title, presence: true, length: 2..30
  validates :status, presence: true, length: 2..14

  belongs_to :user

  ## after_create_commit { broadcast_prepend_to user, target: "posts_list" }
  default_scope -> { order(created_at: :desc) }

end
