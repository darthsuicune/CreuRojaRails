class ServiceUsersController < ApplicationController
	before_filter :signed_in_user
	before_filter :is_valid_user, only: [:create, :update, :destroy]
	
	def create
		service_user = ServiceUser.new(service_user_params)
		if service_user.save
			redirect_to service_user.service, notice: I18n.t(:user_assigned_to_service)
		else
			redirect_to service_user.service
		end
	end

	def update
		service_user = ServiceUser.find(params[:id])
		service_user.update(service_user_params)
		redirect_to service_user.service
	end

	def destroy
		service_user = ServiceUser.find(params[:id])
		service = service_user.service
		service_user.destroy
		redirect_to service
	end
	
	private
	def service_user_params
		params.require(:service_user).permit(:service_id, :user_id, :location_id, :user_position)
	end
	
	def is_valid_user
		unless current_user && current_user.allowed_to?(:assign_user_to_service)
			redirect_to root_url 
		else
			redirect_to root_url unless current_user?(User.find(params[:service_user][:user_id]))
		end
	end
end
