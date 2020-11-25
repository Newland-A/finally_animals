class SessionsController < ApplicationController

  def new
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
    elsif params[:provider] == 'facebook'
      @user = User.create_by_facebook_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(password: params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Logged in!"
      else
        flash[:error] = "Sorry, login info was incorrect. Please try again."
        render login_path
      end
    end
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
