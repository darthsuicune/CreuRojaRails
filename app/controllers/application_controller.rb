class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :log
	
	include SessionsHelper

	def log
		log = Log.new
		if current_user
			log.user_id = current_user.id
		else
			log.user_id = 0
		end
		log.controller = controller_name
		log.action = action_name
		log.ip = request.remote_ip
		log.save
	end
end
