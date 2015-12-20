module UsersHelper
	def assign_avatar(user)
		user.avatar = "avatar" + rand(1..3).to_s
	end
end
