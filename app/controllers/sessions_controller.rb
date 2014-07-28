class SessionsController < ApplicationController
	def new
		redirect_to map_url if signed_in?
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			respond_to do |format|
				sign_in user
				format.html { redirect_back_or user }
				#format.json { render :json => @session }
			end
		else
			flash.now[:error] = I18n.t(:error_invalid_login)
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
