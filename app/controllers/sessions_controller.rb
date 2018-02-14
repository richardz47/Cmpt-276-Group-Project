class SessionsController < ApplicationController
	
	def new
		if logged_in?
			redirect_to current_user
		end
	end
	
	
	def create
		#finds the user using the email provided
		user = User.find_by(email: params[:email])
		password = params[:password]
		#determine if password is correct

		# if user exists + password is right
		if user
			if password == user.password
				# save the user id in cookie so that they stay logged in
				session[:user_id] = user.id
				redirect_to user
			end
		else
		# if the login fails
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end
end
