class Message < ActiveRecord::Base
  belongs_to :user
  after_save :publish_message

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 320 }
  
  def publish_message
	redis = Redis.new(:url => URI.parse('redis://redistogo:285c284f17ddcb2075f37ec3a62d1ad0@tarpon.redistogo.com:11888/'))
  	redis.publish("new_message", self.to_json)
  end
end
