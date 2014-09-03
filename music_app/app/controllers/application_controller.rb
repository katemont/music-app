class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You don't have permission to access that, I'm afraid - sorry."
    redirect_to root_url
  end

  private
    def current_user
      begin
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue ActiveRecord::RecordNotFound
        session[:user_id] = nil
      end
    end
  end
