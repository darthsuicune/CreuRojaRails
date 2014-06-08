class VehicleService < ActiveRecord::Base
	belongs_to :service
	belongs_to :vehicle
	
	before_validation :defaults
	
	validates :vehicle_id, presence: true
	validates :service_id, presence: true
	
	private
		def defaults
			doc ||= 0
			due ||= 0
			tes ||= 0
			ci  ||= 0
			asi ||= 0
			btp ||= 0
			b1  ||= 0
			acu ||= 0
			per ||= 0
		end
end
