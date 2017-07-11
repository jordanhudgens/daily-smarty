user1 = User.create!(email: 'user@devcamp.com',
                     password: 'asdfasdf',
                     password_confirmation: 'asdfasdf',
                     username: 'jordan',
                     full_name: 'Jordan Hudgens'
                    )

500.times do |user|
  User.create!(email: "user#{user}@devcamp.com",
               password: 'asdfasdf',
               password_confirmation: 'asdfasdf',
               username: "user#{user}",
               full_name: "User #{user}Name"
              )
end

puts "501 users created"

topic1 = Topic.create!(title: "Topic 1")
topic2 = Topic.create!(title: "Topic 2")

100.times do |post|
  this_post = Post.create!(title: "My #{post} Post",
                           content: "Some content",
                           user_id: user1.id)
  Theme.create!(topic_id: (rand(2)), post_id: this_post.id)
end


