class SessionsController < ApplicationController

  # before_action :is_admin?
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        if user.is_admin == true 
          redirect_to users_path
        elsif user.is_admin == false && user.is_tl == true
          redirect_to tl_leave_request_path
        else
          redirect_to user_path(session[:user_id])
        end
    else
      redirect_to new_session_path
    end

  end
  
 
  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Logged out!"
  end


  private

 

end
