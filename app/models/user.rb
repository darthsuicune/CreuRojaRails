class User < ActiveRecord::Base
	has_secure_password

	before_save { email.downcase! }

	VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT }, 
			uniqueness: { case_sensitive: false }
	validates :name, presence: true, length: { maximum: 60 }
	validates :password, presence: true, length: { minimum: 6 }

	def allowed_to?(action)
		return true if role == "admin"
		return false if blocked == true
		case action
		when "manage technician users"
			role == "technician"
		when "manage admin users"
			false
		when "see own profile"
			role == "volunteer" || role == "technician"
		else
			false
		end
	end
end
