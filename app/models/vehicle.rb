class Vehicle < ActiveRecord::Base
	has_many :vehicle_services
	has_many :services, through: :vehicle_services
	has_many :vehicle_assemblies
	has_many :assemblies, through: :vehicle_assemblies

	after_validation :defaults, on: [:create]

	validates :brand, presence: true
	validates :model, presence: true
	validates :license, presence: true
	validates :vehicle_type, presence: true
	validates :places, presence: true
	validates :operative, presence: true
	
	def to_s
		"#{indicative}, #{license}"
	end

	protected
	def defaults
		self.indicative ||= license
	end
end
