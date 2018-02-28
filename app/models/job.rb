class Job < ApplicationRecord
  has_many :rankings
  has_many :posts
  
  validates :jobId, presence: true, uniqueness: true
  validates :company, presence: true
  validates :position, presence: true
  validates :location, presence: true
end
