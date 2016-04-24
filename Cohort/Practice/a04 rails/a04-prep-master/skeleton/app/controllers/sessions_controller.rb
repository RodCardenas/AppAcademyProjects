class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
              params[:user][:username],
              params[:user][:password]
            )

    if @user
      login(@user)
      redirect_to links_url, notice: "#{@user.username}, welcome back!"
    else
      flash[:errors] = 'Invalid Credentials'
      render :new
    end
  end

  def destroy
    @user = current_user
    logout(@user)
    redirect_to new_session_url, notice: "#{@user.username} logged out successfully."
  end

  private
    def session_params
      params.require(:user).permit(:username, :password)
    end
end
