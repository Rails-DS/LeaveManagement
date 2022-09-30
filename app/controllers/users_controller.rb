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

	def leave_request
		@leavehist = LeaveHist.where(tlStatus: 0, hrStatus: 0)
		# To filter using teams 
		# @users_histories = User.where(team_id:2)

	end

	def user_profile
		@user_profile = User.find(params[:id])
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
  		@leave = Leave.all
  		@available_leave = 24
  		@user = User.find(params[:id])
  		@leavehist = LeaveHist.where(user_id: @user.id)
  	end

	def destroy
  		@user = User.find(params[:id])
    	if @user.destroy!
      	redirect_to users_path
    	end

  	end

	 def toggle_status
	  	@leavehist = LeaveHist.where(id: params[:id]).first
		if @leavehist.hr_status_pending?
		    @leavehist.hr_status_approved!
		end
	    redirect_to leave_request_url, notice: 'Leave status has been updated.'
	end

    def status_rejected
  	 @leavehist = LeaveHist.where(id: params[:id]).first
	    if @leavehist.hr_status_pending?
	      @leavehist.hr_status_rejected!
	    end
    redirect_to leave_request_url, notice: 'Leave status has been updated.'
  end

  	private

  	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :joiningDate, :post, :team_id, :role_id )
  	end


end