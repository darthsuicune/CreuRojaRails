class Vehicle < ActiveRecord::Base
	has_many :vehicle_services
	has_many :services, through: :vehicle_services
	
	before_validation :defaults

	validates :brand, presence: true
	validates :model, presence: true
	validates :license, presence: true
	validates :vehicle_type, presence: true
	validates :places, presence: true
	
	def to_s
		self.indicative << " " << self.brand << " " << self.model << ", " << self.license
	end
	
	private
	def defaults
		indicative ||= license
	end
end
