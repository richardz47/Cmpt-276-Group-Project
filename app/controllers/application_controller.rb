class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  #looks up the user and sees if they're logged in and keeps track of it in @current_user
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	#allows us to see @current_user in our view files
	helper_method :current_user
	
	#makes it so that unless the user is logged in they can't view page
	#add 'before_filter :checkLoggedIn' to any controller we want secured behind a login
	def checkLoggedIn
		redirect_to '/login' unless current_user
	end

end
