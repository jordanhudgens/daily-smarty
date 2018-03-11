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

  factory :published_post, class: 'Post' do
    title "My Published Post"
    content "The post for my content"
    user
    post_status 1
  end

  factory :draft_post, class: 'Post' do
    title "My Draft Post"
    content "The post for my content"
    user
    post_status 0
  end
end
