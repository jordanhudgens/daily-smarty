FactoryGirl.define do
  factory :post do
    title "My Post"
    content "The post for my content"
    user
    topic
  end
end
