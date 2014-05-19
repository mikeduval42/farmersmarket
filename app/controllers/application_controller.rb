class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
#authenticates user and redirects sign in
  def authenticate_user
    if !self.current_user
      redirect_to new_sessions_path
    end
  end
end
