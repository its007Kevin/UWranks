class Ranking < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :employerRank, presence: true
  validates :yourRank, presence: true
end
