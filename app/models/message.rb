class Message < ActiveRecord::Base
  belongs_to :user
  after_save :publish_message
  after_save :delete_duplicates
  

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 320 }
  

  def delete_duplicates
  	if self.user.messages.where('created_at >= ?', 3.seconds.ago).where(body: self.body).count > 1
  		self.delete
  	end

  end
 

  def publish_message
	redis = Redis.new
  	redis.publish("new_message", self.to_json)
  end
end
