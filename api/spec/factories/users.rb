FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    last_name { 'last_1' }
    first_name { 'first_1' }
    password { 'password' }
  end
end
