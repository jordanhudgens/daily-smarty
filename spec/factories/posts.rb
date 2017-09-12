FactoryGirl.define do
  factory :post do
    title "My Front End Post"
    content "The post for my content"
    user
  end

  factory :post_two, class: 'Post' do
    title "My Other Front End Post"
    content "The post for my content"
    user
  end
end
