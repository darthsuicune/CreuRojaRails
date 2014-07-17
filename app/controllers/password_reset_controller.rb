class PasswordResetController < ApplicationController
	def new
	end
	
	def edit
		@user = User.find_by_resettoken(params[:id])
	end
	
	def create
		user = User.find_by_email(params[:user_email][:email])
		if user && user.create_reset_password_token
			redirect_to login_path, :notice => I18n.t(:password_recovery_email_sent)
		else
			redirect_to login_path, :notice => I18n.t(:password_recovery_invalid_user)
		end
	end
	
	def update
		user = User.find_by_resettoken(params[:id])
		if user && params[:password] == params[:password_confirmation] && 
				user.reset_password(params[:password])
			sign_in user
			redirect_to user
		end
	end
end
