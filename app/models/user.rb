class User < ActiveRecord::Base
	has_secure_password

	has_many :sessions, dependent: :destroy
	has_many :user_types, dependent: :destroy
	has_many :location_users, dependent: :destroy
	has_many :assemblies, through: :location_users, source: :location
	
	before_save { email.downcase!
	              role.downcase unless role.nil? }
	before_save :create_session_token
	
	before_validation :defaults

	VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT }, 
			uniqueness: { case_sensitive: false }
	validates :name, presence: true, length: { maximum: 60 }
	validates :surname, presence: true, length: { maximum: 60 }
	validates :password, presence: true, length: { minimum: 6 }
  
	after_validation { self.errors.messages.delete(:password_digest) }
	
	def get_map_markers
		[
			{ 
				"lat" => 41.40, "lng" => 2.20,
				"picture" => {
					"width" => 36, "height" => 36,
					"url" => "assets/asamblea.png"
				},
				"infowindow" => "Hello point1"
			},{ 
				"lat" => 41.39, "lng" => 2.19,
				"picture" => {
					"width" => 36, "height" => 36,
					"url" => "assets/terrestre.png"
				},
				"infowindow" => "Hello point2"
			}
		]
	end

	def allowed_to?(action)
		return false if active == false
		return true if role == "admin"
		case action
		when :see_own_profile
			role == "volunteer" || role == "technician"
		when :see_user_list
			role == "volunteer" || role == "technician"
		when :see_location_list
			role == "volunteer" || role == "technician"
		when :see_vehicle_list
			role == "volunteer" || role == "technician"
		when :see_service_list
			role == "volunteer" || role == "technician"
		when :add_to_own_assembly
			role == "technician"
		when :add_to_any_assembly
			false
		when :manage_technician_users
			role == "technician"
		when :assign_vehicle_to_service
			role == "technician"
		when :destroy_users
			role == "technician"
		when :manage_admin_users
			false
		when :manage_issues
			role == "technician"
		else
			false
		end
	end

	private
	def create_session_token
		sessions.build(token: SecureRandom.urlsafe_base64)
	end
	
	def defaults
		active ||= true
		language ||= "ca"
		role ||= "volunteer"
	end
end
