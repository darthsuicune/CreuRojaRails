class Vehicle < ActiveRecord::Base
	has_many :vehicle_services
	has_many :services, through: :vehicle_services
	
	validates :brand, presence: true
	validates :model, presence: true
	validates :license, presence: true
	validates :vehicle_type, presence: true
	validates :places, presence: true
end
