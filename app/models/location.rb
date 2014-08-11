class Location < ActiveRecord::Base
	default_scope { order(location_type: :desc) }
	has_many :services
	has_many :location_users
	has_many :users, through: :location_users
	
	before_validation :defaults
	
	validates :name, presence: true
	validates :address, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :location_type, presence: true
	
	private
	def defaults
	end
end
