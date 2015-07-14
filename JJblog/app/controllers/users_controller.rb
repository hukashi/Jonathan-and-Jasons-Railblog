class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'You have successfully signed up!'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def login
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password)
  end
end
