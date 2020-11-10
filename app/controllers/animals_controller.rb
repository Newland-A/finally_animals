class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  def index
  #   @user_animals = current_user.animals
    @animal = Animal.all
  #   # binding.pry
  end

  def new
    @animal = current_user.animals.build
  end

  def create 
    @animal = current_user.animals.build(animal_params)
    # binding.pry
    if @animal.save
      binding.pry
      redirect_to @animal, notice: "Animal Created"
    else
      flash.now[:alert] = "Please fill out all information:"
      redirect_to new_animal_path, notice: "Create New Animal"
    end
  end

  def edit
    binding.pry
    if !@animal #= Animal.find_by_id(params[:id])
      binding.pry
      redirect_to animal_path
    end
  end

  def update
    if @animal
    # @animal = Animal.find(params[:id])
      @animal.update(animal_params)
      if @animal.errors.any?
        render "edit"
      else
        redirect_to @animal
      end
    else
      render "edit"
    end
  end

  def destroy
    binding.pry
    @animal.destroy
    flash.now[:alert] = "Your animal has been deleted"
    redirect_to new_animal_path
  end

  private

  def set_animal
    @animal = Animal.find_by_id(params[:id])
  end
    
  def animal_params
    params.require(:animal).permit(:name, :age, :gender, :weight, :species, :breed, :color, :medical_info, :altered, :company_ids)
  end

end
