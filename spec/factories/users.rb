# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Name #{n}" }
		sequence(:surname) { |n| "Surname #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "mypassword"
		password_confirmation "mypassword"
		resettoken "asdfasdf"
		resettime 0
		language "ca"
		role "Volunteer"
		active true
		
		factory :admin do
			role "Admin"
		end
	end
end
