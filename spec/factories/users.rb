FactoryBot.define do
	sequence :email do |n|
    "test#{n}@example.com"
  end

	sequence :username do |n|
    "jonsnow#{n}"
  end

  factory :user do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    full_name 'Jon Snow'
    username { generate :username }
  end
end
