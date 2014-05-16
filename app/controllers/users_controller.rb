class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully signed up!"
      session[:remember_token] = @user.id
      @current_user = @user
      redirect_to vendors_path
    else
      render :new
    end
  end

protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :is_admin)
  end
end

