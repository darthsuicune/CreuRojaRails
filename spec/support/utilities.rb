include ApplicationHelper

def sign_in(user)
	user.create_session_token
	cookies[:remember_token] = user.sessions.last.token
	@session = user.sessions.last.token
end