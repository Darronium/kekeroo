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
             status: true,
             avatar: 5,
             color_code: "#DC143C")

User.create!(username:  "kekeroo",
             password:              "heihos",
             password_confirmation: "heihos",
             admin: false,
             status: true,
             avatar: 6,
             color_code: "#BBE3FB")


if Rails.env == "development"
	6.times do |n|
		User.create!(username:  "Testuser"+(n+1).to_s,
	             	password:              "123456",
	             	password_confirmation: "123456",
	             	admin: false,
	             	status: true,
	             	avatar: (n+1),
	             	color_code: ["#FBB07D", "#89C2F8", "#AEF184", "#FF8D8D", "#FFFF52", "#FFE080", "#8C4C8C"].sample)
	end
end