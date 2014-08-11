class UsersController < ApplicationController
	before_filter :signed_in_user
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_filter :is_valid_user

	# GET /users
	# GET /users.json
	def index
		@users = []
		if "admin" == current_user.role
			@users = User.all
		else
			current_user.assemblies(include: :users).each do |assembly|
				@users.concat assembly.users.where("role != \"admin\"").to_a
			end
		end
	end

	# GET /users/1
	# GET /users/1.json
	def show
	end

	# GET /users/new
	def new
		@user = User.new
	end

	# GET /users/1/edit
	def edit
	end

	# POST /users
	# POST /users.json
	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				add_to_assembly @user
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
		respond_to do |format|
			if @user.update(user_params)
				add_to_assembly @user
				verify_active @user
				format.html { redirect_to @user, notice: I18n.t(:user_updated) }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id]) || not_found
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:name, :surname, :email, :notes, :password, :password_confirmation, :resettoken, :resettime, :language, :role, :active, :phone, user_types_attributes: [:user_type])
	end
	
	def is_valid_user
		unless current_user
			redirect_to root_url 
		end
		unless (current_user.allowed_to?(:manage_users) || (current_user == @user && current_user.allowed_to?(:see_own_profile)))
			redirect_to root_url 
		end
	end
	
	def add_to_assembly(user)
		if params[:user][:assemblies] && LocationUser.all.where(user: user.id, location_id: params[:user][:assemblies][:location_id]).empty?
			LocationUser.create!(location_id: params[:user][:assemblies][:location_id], user_id: user.id)
		end
	end
	
	def verify_active(user)
		Session.destroy_all(user_id: user.id) unless user.active
	end
end
