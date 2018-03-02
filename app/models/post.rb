class Post < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true # user id must be present when creating a post
  validates :content, presence: true
  validates_length_of :content, :maximum => 100
  default_scope -> { order(created_at: :desc) } # order by newest posts
end
