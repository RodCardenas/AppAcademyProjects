class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      flash[:notice] = "#{@user.email}'s account created succsessfully."
      render :show
    else
      flash[:notice] = "#{@user.email}'s account could not be created."
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
