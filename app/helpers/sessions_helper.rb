module SessionsHelper
	def sign_in(user)
		user.create_session_token
		cookies.permanent[:remember_token] = user.sessions.last.token #For HTML clients
		@session = user.sessions.last.token # For JSON clients
		self.current_user = user
	end
	
	def signed_in?
		!current_user.nil?
	end
	
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
	
	def current_user=(user)
		@current_user = user
	end
	
	def current_user
		session = Session.find_by_token(cookies[:remember_token]) #For HTML clients
		session ||= Session.find_by_token("") #For JSON clients
		
		@current_user = session.user unless session.nil?
	end
	
	def current_user?(user)
		user == current_user
	end
	
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end
	
	def store_location
		session[:return_to] = request.url
	end
	
	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_url, notice: I18n.t(:error_please_login)
		end
	end
end
