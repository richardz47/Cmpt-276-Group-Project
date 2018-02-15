class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #looks up the user and sees if they're logged in and keeps track of it in @current_user
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def check_logged_in
		!current_user.nil?
	end
	#allows us to see @current_user in our view files
	helper_method :current_user

	helper_method :check_logged_in
 

end
