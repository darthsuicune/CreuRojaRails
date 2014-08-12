class Service < ActiveRecord::Base
	default_scope { order(base_time: :desc) }
	
	belongs_to :assembly, class_name: "Location", foreign_key: :assembly_id
	has_many :vehicle_services
	has_many :vehicles, through: :vehicle_services
	has_many :service_users
	has_many :users, through: :service_users
	has_many :location_services
	has_many :locations, through: :location_services
	
	validates :name, presence: true
	validates :assembly_id, presence: true
	validates :base_time, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	
	def first_location_id
		locations.first.location_id
	end
end
