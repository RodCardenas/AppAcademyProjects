class SessionsController < ApplicationController
  def show
  end

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
      flash[:notice] = "User created successfully"
      redirect_to @user
    else
      flash.now[:notice] = @user.errors.full_messages
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
