class User < ActiveRecord::Base
	has_secure_password

	has_many :sessions, dependent: :destroy
	has_many :user_types, dependent: :destroy
	has_many :services
	has_many :locations

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

	def allowed_to?(action)
		return false if blocked == true
		return true if role == "admin"
		case action
		when :see_own_profile
			role == I18n.t(:role_volunteer) || role == I18n.t(:role_technician)
		when :see_user_list
			role == I18n.t(:role_volunteer) || role == I18n.t(:role_technician)
		when :manage_technician_users
			role == I18n.t(:role_technician)
		when :destroy_users
			role == I18n.t(:role_technician)
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
		language ||= "ca"
		role ||= I18n.t(:role_volunteer)
	end
end
