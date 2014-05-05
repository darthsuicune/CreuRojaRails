class StaticPagesController < ApplicationController
	def map
		redirect_to login_url unless signed_in?
	end

	def contact
	end
	
	def about
	end
end
