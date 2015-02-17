class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def is_owner?
  	current_user.present? && current_user.user_group == 'owner'
  end


  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_path
    end
  end

  helper_method :is_owner?
  helper_method :current_user
  helper_method :ensure_logged_in
end
