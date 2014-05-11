# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    name "MyString"
    description "MyString"
    assembly_id 1
    base_time "2014-05-11 22:16:35"
    start_time "2014-05-11 22:16:35"
    end_time "2014-05-11 22:16:35"
    code "MyString"
  end
end
