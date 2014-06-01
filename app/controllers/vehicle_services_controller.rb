class VehicleServicesController < ApplicationController
		before_filter :signed_in_user
	
	def create
		vehicle_service = VehicleService.new(vehicle_service_params)
		if vehicle_service.save
			redirect_to vehicle_service.service, notice: I18n.t(:vehicle_assigned_to_service)
		else
			
		end
		
	end
	
	def update
	end
	
	def destroy
	end
	
	private
	def vehicle_service_params
		params.require(:vehicle_service).permit(:vehicle_id, :service_id, :doc, :due, :tes, :ci, :asi, :btp, :b1, :acu, :per)
	end
end
