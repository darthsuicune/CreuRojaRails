# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :location do
		sequence(:name) { |n| "Name #{n}" }
		sequence(:description) { |n| "Description #{n}" }
		sequence(:address) { |n| "Address #{n}" }
		sequence(:phone) { |n| "Phone #{n}" }
		latitude 1.5
		longitude 1.5
		location_type "MyType"
		active true
	
		factory :assembly do
			location_type "assembly"
		end
	end
end
