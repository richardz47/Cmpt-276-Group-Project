class UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find(params[:id])
		if @user != current_user && check_logged_in
			redirect_to current_user
		elsif @user != current_user
			redirect_to root_url
		end
	end

	def new
		if check_logged_in
			redirect_to current_user
		else 
			@user = User.new
		end
	end
	
	def edit
	end

	def create
		@user = User.new(params.require(:user).permit(:email, :username, :password, :password_confirmation))

		if	@user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			render 'new'
		end
	end


	def destroy
	end


end 

