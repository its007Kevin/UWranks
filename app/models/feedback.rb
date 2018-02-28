class Feedback < ApplicationRecord
  validates :body, presence: true
end
