class User < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  has_many :keks

	attr_accessor :remember_token
	validates :username, presence: true, length: {in: 3..12}, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { in: 6..20 }, allow_nil: true


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

    # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

    # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def to_param
    username
  end




  
end
