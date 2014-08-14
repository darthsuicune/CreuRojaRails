class UserVehicle < ActiveRecord::Base
	belongs_to :user
	belongs_to :vehicle
	belongs_to :service

	validates :user_id, presence: true
	validates :vehicle_id, presence: true
	validates :service_id, presence: true
end
