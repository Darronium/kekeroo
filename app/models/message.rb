class Message < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 320 }
end
