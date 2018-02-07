class Job < ApplicationRecord
  has_many :rankings
  has_many :posts
end
