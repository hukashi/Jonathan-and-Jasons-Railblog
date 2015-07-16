class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def delete
    session[:user_id] = nil
    # I like session.delete(:user_id) because it deletes the key entirely instead of setting it to nil.
    redirect_to root_path
  end

  # private

  # def sessions_params
  # end

  # not necessary
end
