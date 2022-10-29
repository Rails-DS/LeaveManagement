class UsersController < ApplicationController
	
	before_action :set_user, only: [ :edit, :update, :show, :destroy]
	before_action :set_session_user, only: [ :index, :tl_index, :tl_leave_request ]
	
	def index
		@users = User.all
	   	@leavehist = LeaveHist.where(user_id: session[:id])
	   	@leavehistcount = LeaveHist.where(hrStatus: 0).count
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
		@leavehist = LeaveHist.where(hrStatus: 0)
	end

	def tl_index
		@user_all = User.where(team_id: @user.team_id)
		@leavehist = LeaveHist.where(tlStatus: 0)
		@total_leavereq_count = 0
		@user_all.each do |user|
			unless user.is_tl?
				@total_leavereq_count += user.leaveHists.where(tlStatus:0).count
			end 
		end

		@team_name = ""
		if @user.team_id == 1
			@team_name = "Development"
		elsif @user.team_id == 2
			@team_name = "Support"
		elsif @user.team_id = 3
			@team_name = "Marketing"
		else
			@team_name = "Design"		
		end	
	end

	def tl_leave_request
		#show all the pending request for all user where tl status is in pending
		@leavehist = LeaveHist.where(tlStatus: 0)
		@user_all = User.where(team_id: @user.team_id)
	end

	def user_profile
		@user_profile = User.find(params[:id])
	end
	
	def edit
  	end

  	def update
    	if @user.update!(user_params)
      		redirect_to users_path
    	end
  	end  

  	def show
  		@user_session = User.find(session[:user_id]) 
  		@leave_type = params[:leave_type]
		if (@leave_type =='rejected')
	        @conditions = "hrStatus = 2 and user_id=#{@user.id}"
      	elsif (@leave_type == 'approved')
	        @conditions = "hrStatus = 1 and tlStatus = 1 and user_id=#{@user.id}"
    	elsif(@leave_type == 'pending')
	        @conditions = "hrStatus = 0 or tlStatus = 0 and user_id=#{@user.id}"
	    else
	    	@conditions = "user_id=#{@user.id}"
    	end

  		if params[:leave_type].present?
  			@leavehist = LeaveHist.where(@conditions)
  		else 
  			@leavehist = LeaveHist.where(user_id: @user.id)
  		end

  		@leave = Leave.all
  		@available_leave = 24
  		@all_leave_hist = LeaveHist.where(user_id:@user.id)
  		@total_approved_leave = @leavehist.hr_status_approved
  		@total_rejected_leave = @leavehist.hr_status_rejected
  		@total_pending_leave = @leavehist.hr_status_pending 

		respond_to do |format|
		   format.html
		   format.js
		end
  	end

	def destroy
    	if @user.destroy!
      	redirect_to users_path
    	end

  	end

# TL Status approval
	 def toggle_status_tl
	  	@leavehist = LeaveHist.where(id: params[:id]).first
		if @leavehist.tl_status_pending?
		    @leavehist.tl_status_approved!
		end
	    redirect_to tl_leave_request_url
	end

    def status_rejected_tl
  	 @leavehist = LeaveHist.where(id: params[:id]).first
	    if @leavehist.tl_status_pending?
	      @leavehist.tl_status_rejected!
	    end
    	redirect_to tl_leave_request_url
 	end

# HR Status approval
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
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :joiningDate, :is_admin, :team_id, :role_id, :is_tl)
  	end

  	def set_user
  		@user = User.find(params[:id])
  	end

  	def set_session_user
  		@user = User.find(session[:user_id])
  	end

end