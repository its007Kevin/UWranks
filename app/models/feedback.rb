class Feedback < ApplicationRecord
  validates :body, presence: true
  validates_length_of :body, :maximum => 500
end
