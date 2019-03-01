class Job < ApplicationRecord
  has_many :rankings
  has_many :posts
  
  validates :jobId, presence: true, uniqueness: true, format: { with: /\A\d+\z/ }
  validates :company, presence: true
  validates :position, presence: true
  validates :location, presence: true
  validates :openings, presence: true, format: { with: /\A\d+\z/ }
  validates_length_of :jobId, :minimum => 5, :maximum => 6
  validates_length_of :company, :maximum => 40
  validates_length_of :position, :maximum => 100
  validates_length_of :location, :maximum => 40
  validates_length_of :openings, :maximum => 3
end
