class UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end
	
	def edit
	end

	def create
		@user = User.new(params.require(:user).permit(:email, :username, :password, :password_confirmation))

		if	@user.save
			redirect_to @user
		else
			render 'new'
		end
	end


	def destroy
	end


end 

