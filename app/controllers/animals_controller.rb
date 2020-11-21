class AnimalsController < ApplicationController
   before_action :set_animal, only: [:show, :update, :destroy]
    before_action :redirect_if_not_logged_in
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
    @animal = Animal.find_by_id(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
     if @animal
      @animal.update(animal_params)
      if @animal.errors.any?
        render :edit
      else
        redirect_to @animal
      end
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    flash.now[:alert] = "Your animal has been deleted"
    redirect_to user_animals_path(current_user)
  end

  private

  def set_animal
    @animal = Animal.find_by_id(params[:id])
  end
    
  def animal_params
    params.require(:animal).permit(:name, :age, :gender, :weight, :species, :breed, :color, :medical_info, :altered, :company_ids)
  end

end
