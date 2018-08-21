class Ranking < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :employerRank, presence: true
  validates :yourRank, presence: true
  validates :job_id, uniqueness: { scope: :user_id }
end
