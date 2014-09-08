class VehiclePositionsController < ApplicationController
	before_filter :signed_in_user
	before_filter :is_valid_user
	
	def index
		last_positions = VehiclePosition.select(:vehicle_id).distinct
		@vehicles = []
		last_positions.each do |position|
			@vehicles << VehiclePosition.where(vehicle_id: position.vehicle_id).last
		end
		@vehicles
	end

	def create
		vehicle = VehiclePosition.create(vehicle_position_params)
		if vehicle.save
			respond_to do |format|
				format.json { head :ok, content_type: "text/html" }
			end
		end
	end
  
	private
	def vehicle_position_params
		params.require(:vehicle_id)
		params.require(:latitude)
		params.require(:longitude)
	end
	
	def is_valid_user
		redirect_to root_url unless current_user && current_user.allowed_to?(:manage_vehicles)
	end
end
