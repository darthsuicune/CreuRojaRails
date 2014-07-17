class PasswordResetController < ApplicationController
	def new
	end
	
	def edit
		@user = User.find_by_resettoken!(params[:id])
	end
	
	def create
		user = User.find_by_email(params[:email])
		if user && user.create_reset_password_token
			redirect_to login_path, :notice => I18n.t(:password_recovery_email_sent)
		else
			render 'new'
		end
	end
	
	def update
		user = User.find_by_resettoken!(params[:id])
		if user && params[:user][:password] && params[:user][:password_confirmation] && 
				params[:user][:password] == params[:user][:password_confirmation] && 
				params[:user][:password].length >= 6 && params[:user][:password_confirmation].length >= 6 && 
				user.reset_password(params[:user][:password])
			sign_in user
			redirect_to user
		else
			render 'edit'
		end
	end
end
