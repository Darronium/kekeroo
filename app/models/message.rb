class Message < ActiveRecord::Base
  belongs_to :user
  after_save :publish_message

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 320 }
  
  def publish_message
  	redis = Redis.new
  	redis.publish("new_message", self.to_json)
  end
end
