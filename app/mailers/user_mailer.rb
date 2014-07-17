class UserMailer < ActionMailer::Base
	default from: "08000-Tècnics Socors Oficina Local de Barcelona <tecnicssocors@creuroja.org>",
		return_path: "08000-Tècnics Socors Oficina Local de Barcelona <tecnicssocors@creuroja.org>",
		sender: "08000-Tècnics Socors Oficina Local de Barcelona <tecnicssocors@creuroja.org>"

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.user_mailer.password_reset.subject
	#
	def password_reset(user)
		@user = user

		mail to: "lapuente@localhost"
	end
end
