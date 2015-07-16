class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
  end
  # What the above does is create a method called current_user that returns an instance variable. I also call a before_action so that this method runs before every action, soooo I have access to @current_user in every view. Now in your application layout where you have your conditional for showing the login/logout links, you can say @current_user instead of session[:user_id] which is considered not-so-good.

# def current_user
#   if session[:user_id]
#     return User.find(session[:user_id])
#   else
#     return nil
#   end
# end

def require_logged_in
  redirect('/') unless is_authenticated?
end

def is_authenticated?
  return !!session[:user_id]
end

end
