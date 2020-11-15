class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  
  def create_with_omni
    if params[:provider] == 'google_oauth2'
      @user = User.create_by_google_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to @user

    elsif params[:provider] == 'github'
      @user = User.create_by_github_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(password: params[:user][:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:error] = "Sorry, login info was incorrect. Please try again."
        redirect_to login_path
      end
    end
  end

  def omniauth
    @user = User.create_by_google_omniauth(auth)
    session[:user_id] = @user.id
    redirect_to @user
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
