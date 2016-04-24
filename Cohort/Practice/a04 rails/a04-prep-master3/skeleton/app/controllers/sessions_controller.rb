class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(
              params[:user][:username],
              params[:user][:password]
              )

    if @user
      login(@user)
      p "here"
      redirect_to links_url, notice: "#{@user.username} is logged in"
    else
      flash.now[:errors] = 'Invalid params.'
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private
    def session_params
      params.require(:user).permit(:username, :password)
    end

end
