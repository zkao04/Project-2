class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :bmr

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
  redirect_to new_session_path unless logged_in?
  end

  def bmr(gender, weight, height, age)
    if gender == 'male'
      66 + (6.23 * weight) + (12.7 * height) - (6.8 * age)
    else
      655 + (4.35 * weight) + (4.7 * height) - (4.7 * age)
    end
  end

end
