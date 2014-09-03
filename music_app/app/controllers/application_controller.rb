class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied - sorry about that."
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
