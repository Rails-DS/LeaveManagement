class UsersController < ApplicationController
	
	# before_action :is_admin?

	def index
		@user = User.find(session[:user_id])
		@users = User.all
	   	@leavehist = LeaveHist.where(user_id: session[:id])
	end

	def new 
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		if @user.save!
			redirect_to users_path
		else
			render 'new'
		end
	end

	def edit
  		@user = User.find(params[:id])
  	end


  	def update
  		@user = User.find(params[:id])
    	if @user.update!(user_params)
      		redirect_to users_path
    	end
  	end  

  	def show 
  		@user = User.find(params[:id])
  		@leavehist = LeaveHist.where(user_id: @user.id)
  	end

	def destroy
  		@user = User.find(params[:id])
    	if @user.destroy!
      	redirect_to users_path
    	end

  	end

  	private

  	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :joiningDate, :post, :team_id, :role_id )
  	end


end