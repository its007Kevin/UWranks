class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  after_create_commit { MessageBroadcastJob.perform_later(self) }
  validates_length_of :content, :maximum => 1000
end