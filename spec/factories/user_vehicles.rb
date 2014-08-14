# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :user_vehicle do
		user_id 1
		service_id 1
		vehicle_id 1
		user_position "b1"
		
		factory :b1_driver do
			user_position "b1"
		end
		
		factory :btp_driver do
			user_position "btp"
		end
		
		factory :per_driver do
			user_position "per"
		end
	end
end
