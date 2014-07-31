class SessionsController < ApplicationController
	def new
		redirect_to map_url if signed_in?
	end

	def create
		user = User.find_by_email(email)
		if user && user.authenticate(password)
			respond_to do |format|
				sign_in user
				format.html { redirect_back_or user }
				format.json { render :json => @session }
			end
		else
			respond_to do |format|
				format.html {
					flash.now[:error] = I18n.t(:error_invalid_login)
					render 'new'
				}
				format.json {
					render :json => "401", status: :unauthorized
				}
			end
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
	
	private
		def email
			params[:session][:email].downcase if params[:session] || params[:email] if params || nil
		end
		def password
			params[:session][:password].downcase if params[:session] || params[:password] if params || nil
		end
end
