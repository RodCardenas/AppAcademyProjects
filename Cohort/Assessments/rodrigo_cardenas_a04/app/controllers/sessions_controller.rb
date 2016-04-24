class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
              params[:user][:nickname],
              params[:user][:password]
              )

    if @user
      login(@user)
      redirect_to todo_lists_url, notice: 'User has successfully logged in.'
    else
      flash[:notice] = "Invalid params"
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :password)
    end

end
