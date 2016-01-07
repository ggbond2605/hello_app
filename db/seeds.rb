User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
users = User.order(:created_at).take(6)
20.times do
  title = Faker::Lorem.sentence(1)
  content = Faker::Lorem.sentence(5)

  users.each { |user| user.entries.create!(title: title,content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..20]
followers = users[5..15]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

