FactoryBot.define do
  factory :task do
    name { 'test_1' }
    description { 'description_test_1' }
    status {'open'}
  end
end
