class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :log
	
	include SessionsHelper
	
	private
	def log
		#write log code here
	end
end
