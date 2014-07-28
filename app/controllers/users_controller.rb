class UsersController < ApplicationController
	before_filter :signed_in_user
	before_filter :is_valid_user, only: [:create, :new, :destroy, :update]
	before_action :set_user, only: [:show, :edit, :update, :destroy, :activate]

	# GET /users
	# GET /users.json
	def index
		@users = User.all
	end

	# GET /users/1
	# GET /users/1.json
	def show
		redirect_to users_url if @user.nil?
	end

	# GET /users/new
	def new
		@user = User.new
	end

	# GET /users/1/edit
	def edit
		redirect_to root_url if @user.nil?
	end

	# POST /users
	# POST /users.json
	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				LocationUser.create!(location_id: params[:user][:assemblies][:location_id], user_id: @user.id)
				format.html { redirect_to @user, notice: I18n.t(:user_created) }
				format.json { render action: 'show', status: :created, location: @user }
			else
				format.html { render action: 'new' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update
		if @user.nil?
			redirect_to root_url
		else
			respond_to do |format|
				if @user.update(user_params)
					format.html { redirect_to @user, notice: I18n.t(:user_updated) }
					format.json { head :no_content }
				else
					format.html { render action: 'edit' }
					format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		if @user.nil?
			redirect_to root_url
		else
			@user.destroy
			respond_to do |format|
				format.html { redirect_to users_url }
				format.json { head :no_content }
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		if(User.exists?(:id => params[:id]))
			@user = User.find(params[:id])
		else
			@user = nil
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation, :resettoken, :resettime, :language, :role, :active, :phone)
	end
	
	def is_valid_user
		redirect_to root_url unless current_user && current_user.allowed_to?(:manage_users)
	end
end
