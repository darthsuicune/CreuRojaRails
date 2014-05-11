# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle do
    brand "MyString"
    model "MyString"
    license "MyString"
    indicative "MyString"
    vehicle_type "MyString"
    places 1
    notes "MyString"
    operative false
  end
end
