@user = User.create!(email: 'admin@devcamp', password: 'asdfasdf', password_confirmation: 'asdfasdf')

Topic.create!(title: 'Development', user_id: @user.id)
Topic.create!(title: 'History', user_id: @user.id)
Topic.create!(title: 'Something Else', user_id: @user.id)

100.times do |post|
  Post.create!(title: "#{post} Post",
               content: "Some content goes here",
               user_id: @user.id,
               topic_id: Topic.first.id
              )
end
