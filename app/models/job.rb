class Job < ApplicationRecord
  has_many :rankings
  has_many :posts
  
  validates :jobId, presence: true, uniqueness: true
  validates :company, presence: true
  validates :position, presence: true
  validates :location, presence: true
  validates_length_of :jobId, :maximum => 10
  validates_length_of :company, :maximum => 40
  validates_length_of :position, :maximum => 100
  validates_length_of :location, :maximum => 40
end
