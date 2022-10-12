class SessionsController < ApplicationController

  # before_action :is_admin?
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        if user.is_admin == true 
          redirect_to users_path, notice: "Logged in"
        elsif user.is_admin == false && user.is_tl == true
          redirect_to tl_index_path, notice: "Logged in"  
        else
          redirect_to user_path(session[:user_id]), notice: "Logged in"
        end
    else
      redirect_to new_session_path, alert: "Invalid Username or password"
    end

  end
  
 
  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, alert: "Logged out!"
  end


  private

 

end
