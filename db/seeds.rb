# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(
#   email: "user1@example.com",
#   password: "abcdefg",
#   password_confirmation: "abcdefg",
#   first_name: "Jane",
#   last_name: "Doe"
# )

@user = User.create!(
  email: "jdoe@example.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "John",
  last_name: "Doe"
)
puts "1 user created"

100.times do |post|
  Post.create!(date: Date.today, reason: "#{post} This is my reason", user_id: @user.id)
end
puts "created 100 posts"
