class PasswordResetController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by_email(params[:user][:email])
		if user && user.create_reset_password_token
			redirect_to login_path, :notice => I18n.t(:password_recovery_email_sent)
		else
			@email = params[:user][:email]
			flash.now[:notice] = I18n.t(:error_invalid_email)
			render 'new'
		end
	end
	
	def edit
		@user = User.find_by_resettoken!(params[:id])
		if @user.nil? || @user.resettime < 4.hours.ago
			redirect_to root_url 
			@user.errors << I18n.t(:error_invalid_token) unless @user.nil?
		end
	end
	
	def update
		user = User.find_by_resettoken!(params[:id])
		if user && params[:user][:password] && params[:user][:password_confirmation] && 
				params[:user][:password] == params[:user][:password_confirmation] && 
				params[:user][:password].length >= 6 && params[:user][:password_confirmation].length >= 6 && 
				user.reset_password(params[:user][:password]) && user.resettime < 4.hours.ago
			sign_in user
			redirect_to user
		else
			flash.now[:notice] = I18n.t(:error_invalid_password)
			render 'edit'
		end
	end
end
