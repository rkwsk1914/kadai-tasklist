module SessionsHelper
  def check_login
    !!current_user
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

