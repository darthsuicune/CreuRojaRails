class User < ActiveRecord::Base
	has_secure_password

	has_many :access_tokens

	before_save { email.downcase! }

	VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT }, 
			uniqueness: { case_sensitive: false }
	validates :name, presence: true, length: { maximum: 60 }
	validates :password, presence: true, length: { minimum: 6 }
  
	after_validation { self.errors.messages.delete(:password_digest) }

	def allowed_to?(action)
		return false if blocked == true
		return true if role == "admin"
		case action
		when "see own profile"
			role == "volunteer" || role == "technician"
		when "manage technician users"
			role == "technician"
		when "manage admin users"
			false
		else
			false
		end
	end
end
