# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username:  "Admin",
             password:              "admana",
             password_confirmation: "admana",
             admin: true,
             avatar: "logo_alt")

20.times do |n|
	User.create!(username:  "Testuser"+n.to_s,
             	password:              "123456",
             	password_confirmation: "123456",
             	admin: false,
             	avatar: "avatar"+rand(1..3).to_s)	
end