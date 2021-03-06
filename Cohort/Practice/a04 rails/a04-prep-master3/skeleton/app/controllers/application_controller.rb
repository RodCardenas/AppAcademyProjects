class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def login(user)
    user.reset_session_token
    session[:session_token] = user.session_token
    user.save!
  end

  def current_user
    if !session[:session_token].nil?
      @current_user = User.find_by(session_token: session[:session_token])
      return @current_user if !@current_user.nil?
    end
    nil
  end

  def logout
    current_user.reset_session_token
    session[:session_token] = nil
  end
end
