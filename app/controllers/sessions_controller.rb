class SessionsController < ApplicationController
	
	def new
	end
	
	
	def create
		#finds the user using the email provided
		user = User.find_by_email(params[:email])
		# if user exists + password is right
		if user && user.authenticate(params[:password])
			# save the user id in cookie so that they stay logged in
			session[:user_id] = user.id
			redirect_to '/'
		else
		# if the login fails
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
end
