class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end

  end

  def show
    @user_animals = current_user.animal_ids
    binding.pry
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if @user.user_id == current_user.id
      @user.destroy
      flash.now[:alert] = "Your user has been deleted!!!"
    else
      @user.destroy
    end
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

end
