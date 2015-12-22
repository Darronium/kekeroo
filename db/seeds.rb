# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username:  "Admin",
             password:              "heihos",
             password_confirmation: "heihos",
             admin: true,
             avatar: "logo_alt",
             color_code: "#FFE080")

if Rails.env == "development"
	20.times do |n|
		User.create!(username:  "Testuser"+n.to_s,
	             	password:              "123456",
	             	password_confirmation: "123456",
	             	admin: false,
	             	avatar: "avatar"+rand(1..3).to_s,
	             	color_code: ["#FBB07D", "#89C2F8", "#AEF184", "#FF8D8D", "#FFFF52"].sample)
	end
end