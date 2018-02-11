class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  has_many :rankings, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :messages
  has_many :conversations, foreign_key: :sender_id

end
