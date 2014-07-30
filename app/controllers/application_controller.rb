class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :log
	before_action :set_locale
	
	include SessionsHelper
	
	def default_url_options(options={})
		if params && params[:locale]
			{ locale: I18n.locale }
		else
			Rails.application.routes.default_url_options
		end
	end
	
	def not_found
		raise ActiveRecord::RecordNotFound.new('Not Found')
	end

	private
		def log
			if (action_name == :create || action_name == :update || action_name == :destroy)
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
		
		def set_locale
			if current_user
				I18n.locale = params[:locale] || current_user.language
			else
				I18n.locale = params[:locale] || I18n.default_locale
			end
		end
end
