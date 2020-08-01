# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

password = '123456'
1.upto(2) do |i|
  User.create(
    email: "test-#{i}@gmail.com",
    password: password,
    password_confirmation: password
  )
end

user_3 = User.create(
  email: "roneysmith@gmail.com",
  password: password,
  password_confirmation: password
)

user_4  = User.create(
  email: "chetan.tete@gmail.com",
  password: password,
  password_confirmation: password
)
