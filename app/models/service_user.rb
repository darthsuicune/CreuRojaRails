class ServiceUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :service
	
	before_validation :defaults
	
	validates :service_id, presence: true
	validates :user_id, presence: true
	
	private
	def defaults
		self.location_id ||= service.first_location_id
	end
end
