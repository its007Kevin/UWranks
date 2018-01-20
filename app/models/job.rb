class Job < ApplicationRecord
  has_many :rankings, dependent: :destroy
end
