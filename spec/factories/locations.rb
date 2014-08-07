# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :location do
		name "MyString"
		description "MyString"
		address "MyString"
		phone "MyString"
		latitude 1.5
		longitude 1.5
		location_type "MyString"
		active true
	
		factory :assembly do
			location_type "assembly"
		end
	end
end
