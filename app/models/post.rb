class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true # user id must be present when creating a post
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) } # order by newest posts

end
