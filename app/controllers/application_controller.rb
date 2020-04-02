class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless check_login
    redirect_to root_url
    end
  end
end
