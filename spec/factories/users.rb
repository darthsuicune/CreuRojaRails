# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :user do
		name "Name"
		surname "Surname"
		email "email@something.com"
		password "mypassword"
		password_confirmation "mypassword"
		resettoken "asdfasdf"
		resettime 0
		language "ca"
		role "voluntario"
	end
end
