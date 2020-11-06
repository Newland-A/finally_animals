class SessionsController < ApplicationController
  
  def new

  end
#this is the login method
  def create
    user = User.find_by_email(params[:email])
    @user = User.find_or_create_from_auth_hash(auth_hash)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"  
    elsif @user && user.authenticate(params[:password])
      self.current_user = @user
      redirect_to '/'
    end
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
