class User < ActiveRecord::Base
	attr_accessor :remember_token
	validates :username, presence: true, length: {in: 3..16}, uniqueness: true

	has_secure_password
	validates :password, presence: true, length: { in: 6..20 }, allow_nil: true
end
