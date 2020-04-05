class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "Hello " + @user.name
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:danger] = "Registration failed"
     render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
