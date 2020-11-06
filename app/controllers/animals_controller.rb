class AnimalsController < ApplicationController

  # def index
  #   @user_animals = current_user.animals
  #   # binding.pry
  # end

  def new
    @animal = Animal.new
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

  def edit
    @animal = Animal.find_by_id(params[:id])
  end

  def show
    @animal = Animal.find_by_id(params[:id])
    # @user_animals = current_user.animals
    # binding.pry
  end

  private

    def animal_params
      params.require(:animal).permit(:name, :age, :gender, :weight, :species, :breed, :color, :medical_info, :altered)
    end

end
