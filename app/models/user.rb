class User < ActiveRecord::Base
	has_secure_password

	has_many :sessions, dependent: :destroy

	before_save { email.downcase! }
	before_save :create_session_token
	
	before_validation :defaults

	VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT }, 
			uniqueness: { case_sensitive: false }
	validates :name, presence: true, length: { maximum: 60 }
	validates :surname, presence: true, length: { maximum: 60 }
	validates :password, presence: true, length: { minimum: 6 }
  
	after_validation { self.errors.messages.delete(:password_digest) }

	def allowed_to?(action)
		return false if blocked == true
		return true if role == "admin"
		case action
		when :see_own_profile
			role == "Volunteer" || role == "Technician"
		when :see_user_list
			role == "Volunteer" || role == "Technician"
		when :manage_technician_users
			role == "Technician"
		when :manage_admin_users
			false
		else
			false
		end
	end

	private
	def create_session_token
		sessions.build(token: SecureRandom.urlsafe_base64)
	end
	
	def defaults
		blocked ||= false
		resettoken = nil
		resettime = 0
		language ||= "ca"
		role ||= "Volunteer"
	end
end
