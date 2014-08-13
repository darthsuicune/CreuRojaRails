class Vehicle < ActiveRecord::Base
	default_scope { order(indicative: :asc) }
	
	has_many :vehicle_services, dependent: :destroy
	has_many :services, through: :vehicle_services
	has_many :vehicle_assemblies, dependent: :destroy
	has_many :assemblies, through: :vehicle_assemblies

	after_validation :defaults, on: [:create]

	validates :brand, presence: true
	validates :model, presence: true
	validates :license, presence: true
	validates :vehicle_type, presence: true
	validates :places, presence: true
	
	def to_s
		"#{indicative}, #{license}"
	end
	
	def translated_vehicle_type
		case vehicle_type
		when "alfa bravo"
			I18n.t(:vehicle_type_alfa_bravo)
		when "alfa mike"
			I18n.t(:vehicle_type_alfa_mike)
		when "mike"
			I18n.t(:vehicle_type_mike)
		when "romeo"
			I18n.t(:vehicle_type_romeo)
		when "tango"
			I18n.t(:vehicle_type_tango)
		else
			"dafuq"
		end
	end

	protected
	def defaults
		self.indicative ||= license
	end
end
