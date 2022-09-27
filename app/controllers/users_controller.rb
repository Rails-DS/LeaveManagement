class UsersController < ApplicationController




	def index
		@user = User.find_by(id: session[:user_id])
	   	@leavehist = LeaveHist.where(user_id: session[:user_id])
	end

	def new 
		@user = User.new

	end

	def create
		@user = User.new(user_params)
		if @user.save!
			flash[:notice] =  "Thank you for signing up!"
			redirect_to new_session_path
		else
			render 'new'
		end

	end


	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end





end
