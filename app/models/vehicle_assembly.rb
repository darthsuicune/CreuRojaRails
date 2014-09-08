class VehicleAssembly < ActiveRecord::Base
	belongs_to :vehicle
	belongs_to :location
end
