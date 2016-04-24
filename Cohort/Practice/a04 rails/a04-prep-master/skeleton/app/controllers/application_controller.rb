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
    if !session[:session_token].nil?
      @current_user = User.find_by(session_token: session[:session_token])
      return @current_user unless @current_user.nil?
    end
    nil
  end

  def require_user
    if current_user.nil?
      redirect_to new_session_url
    end
  end
end
