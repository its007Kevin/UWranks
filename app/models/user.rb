class User < ApplicationRecord
  devise :cas_authenticatable
  validates :username, uniqueness: true
  validates_length_of :username, :maximum => 40

  has_many :posts, dependent: :destroy

  has_many :rankings, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  has_many :notifications, foreign_key: :recipient_id
end
