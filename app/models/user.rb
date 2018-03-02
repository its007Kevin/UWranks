class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :username, uniqueness: true
  validates_length_of :username, :maximum => 40
  validates_length_of :password, :maximum => 100
  validates_length_of :email, :maximum => 100

  has_many :posts, dependent: :destroy

  has_many :rankings, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  has_many :notifications, foreign_key: :recipient_id
end
