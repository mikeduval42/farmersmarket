class SessionsController < ApplicationController
  def new
    @user = User.new
  end

#login
  def create
    @user = User.where(:email => params[:session][:email]).first

    if @user == nil || !@user.authenticate(params[:session][:password])
      flash[:error] = "Invalid email/password combination"
      render 'new'
    else
      session[:remember_token] = @user.id
      @current_user = @user
      redirect_to vendors_path
    end
  end

#logout
  def destroy
    session.delete(:remember_token)
    redirect_to vendors_path
  end
end
