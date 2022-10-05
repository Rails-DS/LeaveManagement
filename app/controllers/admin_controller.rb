class AdminController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
        redirect_to admin_index_path
    else
        redirect_to new_admin_path
    end
  end

  def edit
      @user = User.find_by(params[:user_id])
  end

  def update
    @user = User.find_by(params[:user_id])
    if @user.update!(user_params)
      redirect_to admin_path
    end
  end  

  def destroy
    @user = User.find_by(params[:id])
    if @user.destroy!
      redirect_to admin_index_path
    end

  end

  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :joiningDate, :is_admin, :team_id, :role_id )
  end


end
