class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
<<<<<<< HEAD
      redirect_to root_url
=======
      #redirect_to root_url
>>>>>>> 36d4dcca1ff95ac44c308d339fed8d1465374f35
    end
  end
  
end
