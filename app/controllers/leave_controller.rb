class LeaveController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @leavehist = LeaveHist.where(user_id: @user.id)
  end

  def new
    @leave = LeaveHist.new
  end

  def create
    @user_session = User.find(session[:user_id])
    @user = User.find(params[:user_id])
    @leave = LeaveHist.new(leave_params)
    @leave.user_id = params[:user_id]

    if @leave.save!
      redirect_to user_path(@user.id)
    else
      redirect_to leave_new_path
    end

  end

  private

  def leave_params
    params.require(:leave_hist).permit(:leaveType, :leaveReason, :startDate, :endDate, :noofDays, :user_id)
  end

end
