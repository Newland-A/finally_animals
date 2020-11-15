class AnimalsController < ApplicationController
   before_action :set_animal, only: [:show, :update, :destroy]
    # before_action :get_user

  def index
    @animal = current_user.animals
  end

  def new
    @animal = current_user.animals.build
  end

  def create 
    @animal = current_user.animals.build(animal_params)
    if @animal.save
      redirect_to @animal, notice: "Animal Created"
    else
      flash.now[:alert] = "Please fill out all information:"
      redirect_to new_animal_path, notice: "Create New Animal"
    end
  end
  
  def show
  end

  def edit
    # @animal = User.find_by_id(params[:animal_id])
    # binding.pry
    @animal = Animal.find_by_id(params[:id])
    # binding.pry
  end

  def update
    # if @animal
    @animal = Animal.find(params[:id])
    binding.pry
     if @animal.update(animal_params)
        redirect_to @animal
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    flash.now[:alert] = "Your animal has been deleted"
    redirect_to new_animal_path
  end

  private

  # def get_user
  #   # binding.pry
  #   @user = Animal.find_by_id(params[:user_id])
  #   binding.pry
  # end

  def set_animal
    @animal = Animal.find_by_id(params[:id])
  end
    
  def animal_params
    params.require(:animal).permit(:name, :age, :gender, :weight, :species, :breed, :color, :medical_info, :altered, :company_ids)
  end

end
