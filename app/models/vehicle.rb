class Vehicle < ActiveRecord::Base
	has_many :services, through: :vehicle_services
	has_many :assemblies, class_name: "Location", foreign_key: "assembly_id"
	
	validates :brand, presence: true
	validates :model, presence: true
	validates :license, presence: true
	validates :vehicle_type, presence: true
	validates :places, presence: true
end
