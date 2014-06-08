class Location < ActiveRecord::Base
	has_many :services
	has_and_belongs_to_many :users
	
	before_validation :defaults
	
	validates :name, presence: true
	validates :address, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :location_type, presence: true
	
	private
	def defaults
		active ||= true
	end
end
