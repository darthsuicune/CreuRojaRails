# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_service do
    user_type "MyString"
    user_id 1
    service_id 1
  end
end
