class SessionsController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      login(@user)
      flash[:notice] = "Welcome back #{@user.email}!"
      redirect_to user_url(@user)
    else
      flash[:notice] = "Invalid credentials..."
      render :new
    end
  end

  def destroy
    logout(current_user)
    render :new
  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
