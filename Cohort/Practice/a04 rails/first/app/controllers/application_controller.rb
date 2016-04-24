class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def login(user)
    user.reset_session_token
    session[:session_token] = user.session_token
    user.save
  end

  def logout(user)
    user.reset_session_token
    session[:session_token] = nil
  end

  def current_user
    unless session[:session_token].nil?
      @user = User.find_by(session_token: session[:session_token])
      return @user
    end
    nil
  end
end
