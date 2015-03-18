class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to this awesome site!"
      redirect_to '/'
    else
      flash[:alert] = "There was a problem creating your account. Try again, please."
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
