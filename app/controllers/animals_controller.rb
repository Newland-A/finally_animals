class AnimalsController < ApplicationController

  # def index
  #   @user_animals = current_user.animals
  #   # binding.pry
  # end

  def new
    @animal = current_user.animals.build
  end

  def create 
    @animal = current_user.animals.build(animal_params)
    # binding.pry
    if @animal.save
      # binding.pry
      redirect_to @animal, notice: "Animal Created"
    else
      flash.now[:alert] = "Please fill out all information:"
      redirect_to new_animal_path, notice: "Create New Animal"
    end
  end

  def edit
    @animal = Animal.find_by_id(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    redirect_to animal_path(@animal)
  end

  def show
    @animal = Animal.find_by_id(params[:id])
    # @user_animals = current_user.animals
    # binding.pry
  end

  def delete
    @animal = Animal.find(params[:id])
    if @animal == current_user.id
      @animal.delete
      flash.now[:alert] = "Your animal has been deleted"
    else
      @animal.delete
    end
    redirect_to new_animal_path
  end

  private

    def animal_params
      params.require(:animal).permit(:name, :age, :gender, :weight, :species, :breed, :color, :medical_info, :altered, :company_ids)
    end

end
