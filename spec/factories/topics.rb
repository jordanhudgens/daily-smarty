FactoryBot.define do
  factory :topic do
    title "CSS"
    slug "css"
  end

  factory :topic_two, class: 'Topic' do
    title "HTML"
    slug "html"
  end
end
