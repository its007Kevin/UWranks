class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true # user id must be present when creating a post
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) } # order by newest posts
end
