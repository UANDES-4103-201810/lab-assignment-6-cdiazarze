class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    User.find(session[:user_id])
  end

  def is_user_logged_in?
  	logged_in = false
    if !current_user.nil?
      logged_in=true
    end
	  if logged_in then true
    else redirect_to root_path
    end
  end
end
