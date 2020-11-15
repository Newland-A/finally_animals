class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :redirect_if_not_logged_in
  
  def index
    @user = User.find(user_params)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user_animals = current_user.animals
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
      @user.destroy
      flash.now[:alert] = "Your user has been deleted!!!"
      redirect_to new_user_path
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

end
