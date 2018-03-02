class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true
  validates_length_of :body, :maximum => 200
end
