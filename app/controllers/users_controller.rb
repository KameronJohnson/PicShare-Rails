class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome Aboard!"
      redirect_to '/'
    else
      flash[:alert] = "There was a problem creating your account. Sucka."
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
